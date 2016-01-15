package com.dfp2p.core.thirdparty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.mrbean.BeanUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseThirdpartyController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

@Controller
public class ThirdpartyTpnoticeController extends BaseThirdpartyController {
	public boolean isReturn=false;
	private static Log logger = LogFactory.getLog(ThirdpartyTpnoticeController.class);
	
	public ThirdpartyTpnoticeController setIsReturn(boolean isR){
		isReturn = isR;
		return this;
	}
	public void getMerAccount(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String actionType="getMerAccount";
		//HashMap<String, Object> logRes = this.LogInfoSave(actionType);
		//if((boolean)logRes.get("res")==false){
			this.echo("fail",response,isReturn);
			return ;
		//}
	}

	public void recharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String actionType="create_hosting_deposit"; 
		PageData pd = new PageData(request);
		HashMap<String, Object> logRes = this.LogInfoSave(actionType,null,"-1");
		if((boolean)logRes.get("res")==false){
			this.echo("fail",response,isReturn);
			return ;
		}
		
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		String uidString = ((HashMap<String, String>)logRes.get("logVo")).get("uid");
		//保存info信息
		DataSet infoDataSet;
		DataSet countDataSet;
		Map<String, String> countRecharge = new HashMap<>();
		HashMap<String, Object> saveRechargeInfo = new HashMap<>();
		Map<String, String> InfoVo = new HashMap<>();
		WhereUtil whereMap = new WhereUtil();
		whereMap.getStringCondition("uid", uidString);
		whereMap.getStringCondition("nid", pd.rqst("outer_trade_no")+"");
		//查询是不是第一次充值成功
		WhereUtil whereMap2 = new WhereUtil();
		whereMap2.getStringCondition("uid", uidString);
		whereMap2.getStringCondition("status", "1");
		try {		
			infoDataSet = T.load("recharge", conn).W(whereMap.getParamConditionList()).Q("uid,money,fee,status");
			InfoVo = BeanMapUtils.dataSetToListMap(infoDataSet).get(0);
			
			countDataSet = T.load("recharge", conn).W(whereMap2.getParamConditionList()).Q("count(id) as num");
			countRecharge = BeanMapUtils.dataSetToListMap(countDataSet).get(0);
		} catch (Exception e1) {
			logger.error("查询出错"+e1.toString());
			InfoVo=null;
		}
		
		if(InfoVo==null||!"0".equals(InfoVo.get("status"))){
			MySQL.rollback(conn);
			MySQL.closeConnection(conn);
			return ;
		}
		
		Map<String, Object> list = ConfigCache.getCacheList("cache_pay",conn);
		Map<String, String> payInfoMap = new HashMap<>();
		if (list != null&&!Common.isBlankInMap(list, "sina")){
			payInfoMap = (HashMap<String, String>)list.get("sina");
		}else{
			payInfoMap.put("recharge_pay", "1");
		}
		String fee = ("1".equals(payInfoMap.get("recharge_pay")))?"0":InfoVo.get("fee");
		
		HashMap<String, String> rechargeStatusMap = getRechargeStatus();
		saveRechargeInfo.put("status", rechargeStatusMap.get(pd.rqst("deposit_status")));
		saveRechargeInfo.put("tran_id", pd.rqst("inner_trade_no"));
		saveRechargeInfo.put("fee", fee);
		double rechargeMoney = DfMath.s2sub(InfoVo.get("money"), fee);
		if("1".equals(saveRechargeInfo.get("status"))){
			HashMap<String, String> moneyType=new HashMap<>();
			moneyType.put("account_money", "+");
			String moneyRes = borrowAndInvest.memberMoneyLog(uidString, "1", rechargeMoney+"", "充值成功，充值订单号："+pd.rqst("outer_trade_no"), "", "", moneyType, conn);
			if(!"success".equals(moneyRes)){
				MySQL.rollback(conn);
				MySQL.closeConnection(conn);
				return ;
			}
		}
		try {
			//增加体验金
			logger.info("充值信息判断:"+countRecharge+"###"+countRecharge.get("num")+"$$$$$"+rechargeMoney);
			if(countRecharge!=null && Long.valueOf(countRecharge.get("num"))==0&&DfMath.toIntValue(rechargeMoney+"")>=0){
			HashMap<String, Object>addCard= new HashMap<>();
			addCard.put("uid",uidString);
			addCard.put("type","1");
			addCard.put("card","体验金大放送");
			addCard.put("affect_money","10000");
			addCard.put("expired_time",Tools.strToTime("2015-07-31 23:59:59"));
			addCard.put("add_time",Tools.getLongTime());
			addCard.put("add_ip",Tools.getClientIp());
			//BaseDao.insert(conn, "user_card", addCard);
			}
			//更新充值记录
			BaseDao.update(conn, "recharge", saveRechargeInfo, whereMap.getParamConditionList());
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}
		
		//String echoValueString = (!StringUtils.isBlank(pd.rqst("OrdId")))?pd.rqst("OrdId"):pd.rqst("TrxId");
		//if(!StringUtils.isBlank(pd.rqst("OrdId"))) echoValueString= pd.rqst("ProId");
		this.echo("SUCCESS",response,isReturn);
		return ;
	}

	public void withdraw(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String actionType="create_hosting_withdraw"; 
		PageData pd = new PageData(request);
		HashMap<String, Object> logRes = this.LogInfoSave(actionType,null,"-1");
		if((boolean)logRes.get("res")==false){
			this.echo("fail",response,isReturn);
			return ;
		}
		
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		String uidString = ((HashMap<String, String>)logRes.get("logVo")).get("uid");
		//保存info信息
		DataSet infoDataSet;
		DataSet countDataSet;
		Map<String, String> countRecharge = new HashMap<>();
		HashMap<String, Object> saveRechargeInfo = new HashMap<>();
		Map<String, String> InfoVo = new HashMap<>();
		WhereUtil whereMap = new WhereUtil();
		whereMap.getStringCondition("uid", uidString);
		whereMap.getStringCondition("t_tran_id", pd.rqst("outer_trade_no")+"");
		try {		
			infoDataSet = T.load("withdraw", conn).W(whereMap.getParamConditionList()).Q("withdraw_status,withdraw_money,withdraw_fee");
			InfoVo = BeanMapUtils.dataSetToListMap(infoDataSet).get(0);
		} catch (Exception e1) {
			logger.error("查询出错"+e1.toString());
			InfoVo=null;
		}
		
		if(InfoVo==null||!"1".equals(InfoVo.get("withdraw_status"))){
			MySQL.rollback(conn);
			MySQL.closeConnection(conn);
			return ;
		}
		
		
		HashMap<String, String> rechargeStatusMap = new HashMap<>();
		rechargeStatusMap.put("SUCCESS", "2");
		rechargeStatusMap.put("FAILED", "3");
		rechargeStatusMap.put("RETURNT_TICKET", "1");
		
		saveRechargeInfo.put("withdraw_status", rechargeStatusMap.get(pd.rqst("withdraw_status")));
		saveRechargeInfo.put("tran_id", pd.rqst("inner_trade_no"));

		if("2".equals(saveRechargeInfo.get("withdraw_status"))){
			HashMap<String, String> moneyType=new HashMap<>();
			moneyType.put("money_freeze", "-");
			String moneyRes = borrowAndInvest.memberMoneyLog(uidString, "23", DfMath.s2add(InfoVo.get("withdraw_money")+"",InfoVo.get("withdraw_fee")+"")+"", "提现成功，提现订单号："+pd.rqst("outer_trade_no"), "", "", moneyType, conn);
			if(!"success".equals(moneyRes)){
				MySQL.rollback(conn);
				MySQL.closeConnection(conn);
				return ;
			}
		}else if("3".equals(saveRechargeInfo.get("withdraw_status"))){
			HashMap<String, String> moneyType=new HashMap<>();
			moneyType.put("account_money", "+");
			if(DfMath.toIntValue(InfoVo.get("id"))>28) moneyType.put("money_freeze", "-");
			String moneyRes = borrowAndInvest.memberMoneyLog(uidString, "21", DfMath.s2add(InfoVo.get("withdraw_money")+"",InfoVo.get("withdraw_fee")+"")+"", "提现失败，提现订单号："+pd.rqst("outer_trade_no"), "", "", moneyType, conn);
			if(!"success".equals(moneyRes)){
				MySQL.rollback(conn);
				MySQL.closeConnection(conn);
				return ;
			}
		}
		try {
			//更新充值记录
			BaseDao.update(conn, "withdraw", saveRechargeInfo, whereMap.getParamConditionList());
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}
		
		String echoValueString = (!StringUtils.isBlank(pd.rqst("OrdId")))?pd.rqst("OrdId"):pd.rqst("TrxId");
		if(!StringUtils.isBlank(pd.rqst("OrdId"))) echoValueString= pd.rqst("ProId");
		this.echo("RECV_ORD_ID_"+echoValueString,response,isReturn);
		return ;
	}
	
}
