package com.dfp2p.core.member.Recharge;

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

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberRechargeService")
public class MemberRechargeService{

	private static Log logger = LogFactory.getLog(MemberRechargeService.class);
	
	@Resource(name="memberRechargeDao")
	private MemberRechargeDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	


	public HashMap<String, Object> getRechargeList(PageData pd, ModelAndView mv)
{
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		Tools.printData(pd.rqst());
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		WhereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//指定ID
		whereUtil.getStringCondition("uid", userInfo.get("id"));
		//选择时间
		if(!StringUtils.isBlank(pd.get("timespan"))){
			String[] timeSpan = pd.get("timespan").split(",");
			whereUtil.getMultiCondition("add_time", timeSpan[0]+"&"+timeSpan[1]);			
		}
		//以后动选择的时间优先
		if (pd.rqst().containsKey("startTime")&&pd.rqst().containsKey("endTime")&&!StringUtils.isBlank(pd.rqst("startTime"))&&!StringUtils.isBlank(pd.rqst("endTime")))  baseService.timeFrame("add_time", whereUtil, pd, mv);
		if(!StringUtils.isBlank(pd.get("status")))		whereUtil.getStringCondition("status", pd.get("status"));
		
		try{
			
			list = thisDao.getRechargeList(conn, rp);
		} catch (Exception e) {
			logger.error("getRechargeList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public List<Map<String,String>> getInvestorDetail(PageData pd)
{
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> parmMap = new HashMap<>();
		parmMap.put("paramCondition", Tools.BuildWhereMap("invest_id", pd.get("id"), "="));
		List<Map<String, String>> list = new ArrayList<>();
		try{
			list = thisDao.getInvestorDetail(conn, parmMap);
		} catch (Exception e) {
			logger.error("getMyinvestList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	
	public long addBank(HashMap<String, Object> bankInfo) {
		long newid=0l;
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			newid=BaseDao.insert(conn, "user_banks", bankInfo);
			MySQL.commit(conn);
		}catch(Exception e) {
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}
		return newid;
	}
	
	public long upBank(HashMap<String, Object> bankInfo,WhereUtil wheremap) {
		long newid=0l;
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			newid=BaseDao.update(conn, "user_banks", bankInfo,wheremap.getParamConditionList());
			MySQL.commit(conn);
		}catch(Exception e) {
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}
		return newid;
	}
	
	public long rechargeRes(HashMap<String, String> rechargeInfo) {
		long newid=0l;
		Connection conn = MySQL.getConnectionReadOnly(false);
		HashMap<String, Object> updata=new HashMap<>();
		updata.put("id", rechargeInfo.get("id"));
		updata.put("status", "0");
		//updata.put("tran_id", rechargeInfo.get("ex_out_trade_no"));
		if(rechargeInfo.containsKey("ex_ticket")) updata.put("tran_id", rechargeInfo.get("ex_ticket"));
		try{
			newid=BaseDao.update(conn, "recharge", updata,null);

			/*String moneyRes="";
			if("1".equals(updata.get("status"))){
				String fee=rechargeInfo.get("fee");
				double rechargeMoney = DfMath.s2sub(rechargeInfo.get("money"), fee);
				HashMap<String, String> moneyType=new HashMap<>();
				moneyType.put("account_money", "+");
				moneyRes = borrowAndInvest.memberMoneyLog(rechargeInfo.get("uid"), "1", rechargeMoney+"", "充值成功，充值订单号："+rechargeInfo.get("ex_out_trade_no"), "", "", moneyType, conn);
				logger.info("moneyRES的结果是"+moneyRes);
			}else moneyRes="success";
			
			if("success".equals(moneyRes)) MySQL.commit(conn);
			else MySQL.rollback(conn);*/
			MySQL.commit(conn);
		}catch(Exception e) {
			MySQL.rollback(conn);
			logger.error("rechargeRes充值更新失败",e);
		}finally{
			MySQL.closeConnection(conn);
		}
		return newid;
	}

	public Map<String, String> ckBank(WhereUtil mp) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> cardInfo=null;
		try{
			DataSet ds = T.load("user_banks", conn).W(mp.getParamConditionList()).Q(null);
			cardInfo=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getUserInfoDetail失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return cardInfo;
	}
	
public Map<String, String> getUserInfoDetail(String uid)
{
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> userInfo=null;
		try{
			DataSet ds = T.load("user_info", conn).W(Tools.BuildWhereMap("uid", uid, "=")).Q("real_name");
			userInfo=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getUserInfoDetail失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return userInfo;
	}





 


 

 
}












 


 

	

	

