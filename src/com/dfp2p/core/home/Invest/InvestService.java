package com.dfp2p.core.home.Invest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.dfp2p.fun.Home.HomeData;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("InvestService")
public class InvestService{

	private static Log logger = LogFactory.getLog(InvestService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="InvestDao")
	private InvestDao thisDao;

	public HashMap<String, Object> getBorrowInfo(PageData pd,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//借款信息
		Map<String, String> borrowInfo = thisDao.getBorrowInfo(conn, pd);
		if(borrowInfo!=null){
			int Progress = (int)((DfMath.multi(DfMath.s2div(borrowInfo.get("has_borrow"), borrowInfo.get("borrow_money"),2),100)));
			borrowInfo.put("need", DfMath.s2sub(borrowInfo.get("borrow_money"), borrowInfo.get("has_borrow"))+"");
			borrowInfo.put("leftdays", Tools.getLeftTime(borrowInfo.get("collect_time"), 2));
			borrowInfo.put("leftSecond", DfMath.s2sub(borrowInfo.get("collect_time")+"", Tools.getLongTime()+"")+"");
			borrowInfo.put("progress",Progress+"");
			borrowInfo.put("duration_unit", ("4".equals(borrowInfo.get("repayment_type"))?"天":"个月"));
			borrowInfo.put("url", Common.getBorrowUrlString(borrowInfo.get("id")));	
			getRes.put("borrowInfo", borrowInfo);
		}
		//借款人信息
		Map<String, String> borrowUserInfo = thisDao.getBorrowUserInfo(conn,borrowInfo.get("borrow_uid"));
		getRes.put("borrowUserInfo", borrowUserInfo);
		
		//投标信息
		HashMap<String, Object> parm=new HashMap<>();
		parm.put("whereMap", Tools.BuildWhereMap("bi.borrow_id", pd.rqst("id"), "="));
		Map<String, Object> listInvestor = thisDao.getInvestorList(conn, parm);
		if(listInvestor!=null)		getRes.put("investorList", listInvestor);

		MySQL.closeConnection(conn);

		return getRes;
	}

	public HashMap<String, Object> getInvestorList(PageData pd,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//投标信息
		HashMap<String, Object> parm=new HashMap<>();
		parm.put("whereMap", Tools.BuildWhereMap("bi.borrow_id", pd.get("id"), "="));
		Map<String, Object> listInvestor = thisDao.getInvestorList(conn, parm);
		if(listInvestor!=null)		getRes.put("investorList", listInvestor);

		MySQL.closeConnection(conn);

		return getRes;
	}

	public List<Map<String, String>> getCardList(PageData pd,ModelAndView mv,String type) throws Exception {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//投标信息
		WhereUtil parm=new WhereUtil();
		parm.getStringCondition("uid", userInfo.get("id"));
		parm.getStringCondition("status", "0");
		parm.getStringCondition("expired_time", Tools.getLongTime()+"",">");
		if(!StringUtils.isBlank(type)) parm.getStringCondition("type", type,"in");
		
		List<Map<String, String>> cardLinst = thisDao.getCardList(conn, parm);

		MySQL.closeConnection(conn);

		return cardLinst;
	}


	public Map<String, String> getCardInfo(String cardID) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//投标信息
		WhereUtil parm=new WhereUtil();
		parm.getStringCondition("id", cardID);
		Map<String, String> cardInfo = thisDao.getCardInfo(conn, parm);

		MySQL.closeConnection(conn);

		return cardInfo;
	}


	public HashMap<String, Object> getBorrowList(PageData pd,ModelAndView mv) {
		HashMap<String, Object> getRes = null;
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil borrowMap = new WhereUtil();
		List<String> canSearchStatus=Arrays.asList("2", "4", "6", "7");
		//状态
		logger.info("borrowSTATUS@@@@@@@@@@@@:"+Common.isBlankInMap(pd.get(), "borrowStatus")+"###"+canSearchStatus.contains(pd.get("borrowStatus")));
		if(!Common.isBlankInMap(pd.get(), "borrowStatus")&& canSearchStatus.contains(pd.get("borrowStatus")))  borrowMap.getStringCondition("b.borrow_status", pd.get("borrowStatus"),"=");
		else borrowMap.getStringCondition("b.borrow_status", "2,4,6,7","in");
		//期限
		if(!Common.isBlankInMap(pd.get(), "borrowDuration")) {
			String[] searchDuration = pd.get("borrowDuration").split(",");
			if(searchDuration.length==2){
				if("30".equals(searchDuration[1])){
					borrowMap.getStringCondition("b.borrow_duration", searchDuration[0]+" and "+searchDuration[1],"between");
					borrowMap.getStringCondition("b.repayment_type", "4","=");
				}
				else{
					borrowMap.getStringCondition("b.borrow_duration", searchDuration[0]+" and "+searchDuration[1],"between");
					borrowMap.getStringCondition("b.repayment_type", "4","<>");
				}
			}
		}
		//金额
		if(!Common.isBlankInMap(pd.get(), "borrowMoney")) {
			String[] searchMoney = pd.get("borrowMoney").split(",");
			if(searchMoney.length==2) borrowMap.getStringCondition("b.borrow_money", searchMoney[0]+" and "+searchMoney[1],"between");
		}
		//利率
		if(!Common.isBlankInMap(pd.get(), "borrowInterest")) {
			String[] searchRate = pd.get("borrowInterest").split(",");
			if(searchRate.length==2) borrowMap.getStringCondition("b.borrow_interest_rate", searchRate[0]+" and "+searchRate[1],"between");
		}
		//借款种类
		if(!Common.isBlankInMap(pd.get(), "borrowType")) 	 borrowMap.getStringCondition("b.borrow_type", pd.get("borrowType"),"=");
		
		HashMap<String, Object> parmHashMap = new HashMap<>();
		parmHashMap.put("whereMap", borrowMap.getParamConditionList());
		parmHashMap.put("addFields", "b.borrow_pass,b.vouch_company_id,b.mortgage_id,b.xtype,b.is_show_invest");
		parmHashMap.put("orderBy", "field(borrow_status,'2','4','6','7'),b.id DESC");
		parmHashMap.put("pageSize", 5);
		try {
			getRes = HomeData.getBorrowList(conn, parmHashMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			logger.error("获取借款数据有误"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
		return getRes;
	}

	public static Map<String, String> getSummary() {
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("borrow_status", "2,6,7", "in");

		Map<String, String> res =new HashMap<>();
		try{
			DataSet ds = T.load("borrow_info", conn).W(mapUtil.getParamConditionList()).G("borrow_status").Q("count(id) as num,borrow_status");
			List<Map<String, String>> rses = BeanMapUtils.dataSetToListMap(ds);
			for (Map<String, String> map : rses) {
				//Tools.printData("循环里的"+map);
				res.put(map.get("borrow_status"), map.get("num"));
			}
		} catch (Exception e) {
			logger.error("getOne失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}

	public HashMap<String, Object> getTransferList(PageData pd,ModelAndView mv) {
		HashMap<String, Object> getRes = null;
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil borrowMap = new WhereUtil();
		List<String> canSearchStatus=Arrays.asList("1", "2");
		//状态
		if(!Common.isBlankInMap(pd.get(), "transferStatus")&& canSearchStatus.contains(pd.get("transferStatus")))  borrowMap.getStringCondition("c.status", pd.get("transferStatus"),"=");
		else borrowMap.getStringCondition("c.status", "1,2","in");
		//期限
		if(!Common.isBlankInMap(pd.get(), "borrowDuration")) {
			String[] searchDuration = pd.get("borrowDuration").split(",");
			if(searchDuration.length==2){
				if("30".equals(searchDuration[1])){
					borrowMap.getStringCondition("b.borrow_duration", searchDuration[0]+" and "+searchDuration[1],"between");
					borrowMap.getStringCondition("b.repayment_type", "4","=");
				}
				else borrowMap.getStringCondition("b.borrow_duration", searchDuration[0]+" and "+searchDuration[1],"between");
			}
		}
		//金额
		if(!Common.isBlankInMap(pd.get(), "transferMoney")) {
			String[] searchMoney = pd.get("transferMoney").split(",");
			if(searchMoney.length==2) borrowMap.getStringCondition("c.credit_money", searchMoney[0]+" and "+searchMoney[1],"between");
		}
		//利率
		if(!Common.isBlankInMap(pd.get(), "borrowInterest")) {
			String[] searchRate = pd.get("borrowInterest").split(",");
			if(searchRate.length==2) borrowMap.getStringCondition("b.borrow_interest_rate", searchRate[0]+" and "+searchRate[1],"between");
		}
		//借款种类
		if(!Common.isBlankInMap(pd.get(), "borrowType")) 	 borrowMap.getStringCondition("b.borrow_type", pd.get("borrowType"),"=");
		
		HashMap<String, Object> parmHashMap = new HashMap<>();
		parmHashMap.put("whereMap", borrowMap.getParamConditionList());
		//parmHashMap.put("addFields", "b.borrow_pass,b.vouch_company_id,b.mortgage_id");
		parmHashMap.put("orderBy", "c.id DESC");
		parmHashMap.put("pageSize", 5);
		try {
			getRes = HomeData.getTransferList(conn, parmHashMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			logger.error("获取借款数据有误"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
		return getRes;
	}

	

	
}
