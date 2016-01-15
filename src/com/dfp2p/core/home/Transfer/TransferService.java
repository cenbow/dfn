package com.dfp2p.core.home.Transfer;

import java.sql.Connection;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Home.HomeData;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("TransferService")
public class TransferService{

	private static Log logger = LogFactory.getLog(TransferService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="TransferDao")
	private TransferDao thisDao;

	public HashMap<String, Object> getBorrowInfo(HashMap<String, String> pd,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//借款信息
		Map<String, String> borrowInfo = thisDao.getBorrowInfo(conn, pd);
		if(borrowInfo!=null){
			double Progress = ((DfMath.multi(DfMath.s2div(borrowInfo.get("has_borrow"), borrowInfo.get("borrow_money"),2),100)));
			borrowInfo.put("need", DfMath.s2sub(borrowInfo.get("borrow_money"), borrowInfo.get("has_borrow"))+"");
			borrowInfo.put("leftdays", Tools.getLeftTime(borrowInfo.get("collect_time"), 2));
			borrowInfo.put("leftSecond", DfMath.s2sub(borrowInfo.get("collect_time")+"", Tools.getLongTime()+"")+"");
			borrowInfo.put("progress",Progress+"");
			borrowInfo.put("duration_unit", ("1".equals(borrowInfo.get("repayment_type"))?"天":"个月"));
			borrowInfo.put("url", Common.getBorrowUrlString(borrowInfo.get("id")));	
			getRes.put("borrowInfo", borrowInfo);
		}
		//借款人信息
		Map<String, String> borrowUserInfo = thisDao.getBorrowUserInfo(conn,borrowInfo.get("borrow_uid"));
		getRes.put("borrowUserInfo", borrowUserInfo);
		
		//投标信息
		HashMap<String, Object> parm=new HashMap<>();
		parm.put("whereMap", Tools.BuildWhereMap("bi.borrow_id", pd.get("borrow_id"), "="));
		Map<String, Object> listInvestor = thisDao.getInvestorList(conn, parm);
		if(listInvestor!=null)		getRes.put("investorList", listInvestor);

		MySQL.closeConnection(conn);

		return getRes;
	}

	public HashMap<String, Object> getTransferInfo(PageData pd,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		logger.info("######FFFFFFFFFFF");
		Connection conn = MySQL.getConnectionReadOnly(true);
		//借款信息
		Map<String, String> transferInfo = thisDao.getTransferInfo(conn, pd);
		Tools.printData(transferInfo);
		if(transferInfo!=null){
			double tranPrice = DfMath.s2add(transferInfo.get("credit_money"), transferInfo.get("transfer_fee"));
			double Progress = ((DfMath.multi(DfMath.s2div(transferInfo.get("has_transfer"), tranPrice+"",2),100)));
			transferInfo.put("need", DfMath.s2sub(tranPrice+"", transferInfo.get("has_transfer"))+"");
			transferInfo.put("progress",Progress+"");
			transferInfo.put("url", Common.getTransferUrlString(transferInfo.get("id")));
			getRes.put("transferInfo", transferInfo);
		}
		//转让人信息
		Map<String, String> transferUserInfo = thisDao.getBorrowUserInfo(conn,transferInfo.get("uid"));
		getRes.put("transferUserInfo", transferUserInfo);

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


	public List<Map<String, String>> getTransferDetailList(HashMap<String, String> pd,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//投标信息
		HashMap<String, Object> parm=new HashMap<>();
		WhereUtil whereMapUtil = new WhereUtil();
		whereMapUtil.getStringCondition("id", pd.get("detail_id"),"in");
		parm.put("whereMap",whereMapUtil.getParamConditionList());
		List<Map<String, String>> transferDetailList = thisDao.getTransferDetailList(conn, parm);

		MySQL.closeConnection(conn);

		return transferDetailList;
	}


	public HashMap<String, Object> getAcceptDetailList(HashMap<String, String> pd,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//投标信息
		HashMap<String, Object> parm=new HashMap<>();
		parm.put("whereMap",Tools.BuildWhereMap("cd.t_id", pd.get("id"), "="));
		HashMap<String, Object> transferDetailList = thisDao.getAcceptDetailList(conn, parm);

		MySQL.closeConnection(conn);

		return transferDetailList;
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
		if(!Common.isBlankInMap(pd.get(), "transferInterest")) {
			String[] searchRate = pd.get("transferInterest").split(",");
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
