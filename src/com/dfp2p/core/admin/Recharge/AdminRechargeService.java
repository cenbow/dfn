package com.dfp2p.core.admin.Recharge;

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

import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;

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


@Service("adminRechargeService")
public class AdminRechargeService{

	private static Log logger = LogFactory.getLog(AdminRechargeService.class);
	
	@Resource(name="adminRechargeDao")
	private AdminRechargeDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	





	public HashMap<String, Object> getRechargeList(PageData pd, ModelAndView mv)
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("r","recharge");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		
		//充值金额
		String compareSign = pd.post("compareSign");
		String balanceNum = pd.post("balanceNum");
		if (balanceNum != null && !"".equals(balanceNum.trim()))
		{
				whereUtil.getStringCondition("r.money", balanceNum, compareSign);
				mv.addObject("compareSign", compareSign);
				mv.addObject("balanceNum", balanceNum);
		}
		
		//充值时间
		baseService.timeFrame("add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getRechargeList(conn, rp);
		} catch (Exception e) {
			logger.error("getRechargeList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	public Map<String, String> get_recharge(PageData pd,ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> findMap = new HashMap<>();
		findMap.put("id", pd.rqst("id"));
		Map<String, String> list = null;
		try{
			list = thisDao.getRecharge(conn, findMap);
		} catch (Exception e) {
			logger.error("getRecharge失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}


	public String do_edit(PageData pd, ModelAndView mv)
	{

			String rechargeid = pd.post("id");
			Map<String, String> vo = get_recharge(pd, mv);
			
			Connection conn = MySQL.getConnectionReadOnly(false);
			//更新资金
			double account_money = DfMath.s2sub(vo.get("money"),vo.get("fee"));
			String uid = vo.get("uid");
			String info = "充值审核";
			String reString1="success";

			if(account_money!=0&&"1".equals(pd.post("status"))){
				HashMap<String, String> moneyType = new HashMap<>();
				moneyType.put("account_money", "+");
				reString1 = borrowAndInvest.memberMoneyLog(uid, "20", account_money+"", info, "", "", moneyType,conn);
			}
			
			//更新数据
			
			
			try{
				if("0".equals(vo.get("status"))){
				    HashMap<String, Object> rp = new HashMap<>();
				    rp.put("id", rechargeid);
				    rp.put("status", pd.post("status"));
				    rp.put("tran_id", pd.post("tran_id"));
				    
					thisDao.updateRecharge(conn, rp);
					if("success".equals(reString1)) MySQL.commit(conn);				
				}else{
					MySQL.rollback(conn);
					return "此充值已处理过";
				}
			} catch (Exception e) {
				MySQL.rollback(conn);
				return "数据提交出错";
			} finally {
				MySQL.closeConnection(conn);
			}
			return "success";

	}

	public HashMap<String, Object> getRechargeExcelList(PageData pd,
			ModelAndView mv) {

		pd = Tools.convertDollar(pd);
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("r","recharge");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		
		//充值金额
		String compareSign = pd.post("compareSign");
		String balanceNum = pd.post("balanceNum");
		if (balanceNum != null && !"".equals(balanceNum.trim()))
		{
				whereUtil.getStringCondition("r.money", balanceNum, compareSign);
				mv.addObject("compareSign", compareSign);
				mv.addObject("balanceNum", balanceNum);
		}
		
		//充值时间
		baseService.timeFrame("add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getRechargeExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getRechargeList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}


 

 
}












 


 

	

	

