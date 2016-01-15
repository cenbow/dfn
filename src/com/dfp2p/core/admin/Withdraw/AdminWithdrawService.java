package com.dfp2p.core.admin.Withdraw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminWithdrawService")
public class AdminWithdrawService{

	private static Log logger = LogFactory.getLog(AdminWithdrawService.class);
	
	@Resource(name="adminWithdrawDao")
	private AdminWithdrawDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	





	public HashMap<String, Object> getWithdrawList(PageData pd, ModelAndView mv)
{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("r","withdraw");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		
		//提现金额
		String compareSign = pd.post("compareSign");
		String balanceNum = pd.post("balanceNum");
		if (balanceNum != null && !"".equals(balanceNum.trim()))
		{
				whereUtil.getStringCondition("r.withdraw_money", balanceNum, compareSign);
				mv.addObject("compareSign", compareSign);
				mv.addObject("balanceNum", balanceNum);
		}
		
		//提现时间
		baseService.timeFrame("add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getWithdrawList(conn, rp);
		} catch (Exception e) {
			logger.error("getWithdrawList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	
	
	public Map<String, String> getWithdraw(PageData pd,ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> findMap = new HashMap<>();
		findMap.put("id", pd.rqst("id"));
		Map<String, String> data = null;
		try{
			data = thisDao.getWithdraw(conn, findMap);
		} catch (Exception e) {
			logger.error("getRecharge失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
		
	}
	
	public String editWithdraw(PageData pd,ModelAndView mv) {
		
		
		Map<String, String> vox = getWithdraw(pd,mv);
		String moneyRes ="success";
		String moneyRes1 ="success";
		double source_fee = DfMath.s2sub(vox.get("withdraw_fee"), vox.get("adjust_fee"));
		double adjust_fee = 0;//DfMath.s2sub(vox.get("withdraw_fee"), vox.get("adjust_fee"));
		double withdraw_fee = 0;//DfMath.s2round(pd.post("withdraw_fee"));
		if(Double.valueOf(vox.get("withdraw_fee"))<Double.valueOf(pd.post("withdraw_fee"))){
			withdraw_fee = DfMath.s2round(pd.post("withdraw_fee"));
			adjust_fee = DfMath.sub(withdraw_fee, source_fee) ;
		}else if(Double.valueOf(vox.get("withdraw_fee"))>Double.valueOf(pd.post("withdraw_fee"))){
			withdraw_fee = DfMath.s2round(pd.post("withdraw_fee"));
			adjust_fee = DfMath.sub(withdraw_fee, source_fee) ;
		}else if(Double.valueOf(vox.get("withdraw_fee"))==Double.valueOf(pd.post("withdraw_fee"))){
			adjust_fee = DfMath.s2round(vox.get("adjust_fee"));
		}
		
		if(!"0".equals(vox.get("withdraw_status"))&& !"1".equals(vox.get("withdraw_status"))) return "此提现已处理过了！";

		//费用调整逻辑
		Connection conn = MySQL.getConnectionReadOnly(false);
		if(!"3".equals(vox.get("withdraw_status"))&& "3".equals(pd.post("withdraw_status"))){
			HashMap<String, String> moneyType = new HashMap<>();
			moneyType.put("account_money", "+");
			moneyType.put("money_freeze", "-");
			moneyRes = borrowAndInvest.memberMoneyLog(vox.get("uid"), "21", DfMath.s2add(vox.get("withdraw_money"), source_fee+"")+"", "提现未通过,返还", "", "", moneyType,conn);
		}else if(!"2".equals(vox.get("withdraw_status"))&& "2".equals(pd.post("withdraw_status"))){
			if(adjust_fee>0){//提高了手续费
				HashMap<String, String> usermoney = borrowAndInvest.getUserMoneyIfo(vox.get("uid"), conn);
				if(Double.valueOf(usermoney.get("account_money"))<adjust_fee){
					MySQL.closeConnection(conn);
					return "因为调高了提现费用，且会员帐户余额不足以支付调高的部分，提现失败，请标记为提现失败让会员重新提现";
				}else{
					HashMap<String, String> moneyType1 = new HashMap<>();
					moneyType1.put("account_money", "-");
					moneyRes1 = borrowAndInvest.memberMoneyLog(vox.get("uid"), "22", adjust_fee+"", "提现审核时管理员对提现费用进行调整，提现ID："+vox.get("id"), "", "", moneyType1,conn);
				}
				HashMap<String, String> moneyType = new HashMap<>();
				moneyType.put("money_freeze", "-");
				moneyRes = borrowAndInvest.memberMoneyLog(vox.get("uid"), "23",DfMath.s2add(vox.get("withdraw_money"), source_fee+"")+"", "提现成功，减去冻结资金，到帐金额："+vox.get("withdraw_money"), "", "", moneyType,conn);				
			}else if(adjust_fee==0){
				HashMap<String, String> moneyType1 = new HashMap<>();
				moneyType1.put("money_freeze", "-");
				moneyRes1 = borrowAndInvest.memberMoneyLog(vox.get("uid"), "23",DfMath.s2add(vox.get("withdraw_money"), source_fee+"")+"", "提现成功，减去冻结资金，到帐金额："+vox.get("withdraw_money"), "", "", moneyType1,conn);				
			}else{//把减少的手续费加到到帐金额里面
				HashMap<String, String> moneyType1 = new HashMap<>();
				moneyType1.put("money_freeze", "-");
				moneyRes1 = borrowAndInvest.memberMoneyLog(vox.get("uid"), "23",DfMath.s2add(vox.get("withdraw_money"), source_fee+"")+"", "提现成功，减去冻结资金，到帐金额："+DfMath.s2add(vox.get("withdraw_money"),(adjust_fee*(-1))+"")+"", "", "", moneyType1,conn);				
			}
		}
		//更新提现表
		HashMap<String, Object> rp = new HashMap<>();
		rp.put("id", vox.get("id"));
		rp.put("withdraw_status", pd.post("withdraw_status"));
		rp.put("adjust_fee", adjust_fee+"");
		rp.put("deal_info", pd.post("deal_info"));
		try {
			thisDao.updateWithdras(conn, rp);
			MySQL.commit(conn);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			MySQL.rollback(conn);
			return "提现数据更新失败";
		}finally{
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public HashMap<String, Object> getWithdrawExcelList(PageData pd,
			ModelAndView mv) {

		pd = Tools.convertDollar(pd);
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("r","withdraw");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		
		//提现金额
		baseService.compareNum("r.withdraw_money", whereUtil, pd, mv);
		
		//提现时间
		baseService.timeFrame("add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getWithdrawExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getWithdrawList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






 


 

 
}












 


 

	

	

