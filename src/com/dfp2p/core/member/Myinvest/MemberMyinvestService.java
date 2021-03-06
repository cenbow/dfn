package com.dfp2p.core.member.Myinvest;

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
import javax.swing.text.MaskFormatter;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberMyinvestService")
public class MemberMyinvestService{

	private static Log logger = LogFactory.getLog(MemberMyinvestService.class);
	
	@Resource(name="memberMyinvestDao")
	private MemberMyinvestDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	





	public HashMap<String, Object> getMyinvestList(PageData pd, ModelAndView mv)
{
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		Tools.printData(pd.rqst());
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("i","borrow_investor");
		whereUtil.setAlias("b","borrow_info");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("mm","user_count");
		WhereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//指定ID
		whereUtil.getStringCondition("i.investor_uid", userInfo.get("id"));
		if(pd.rqst().containsKey("borrow_name")&&!StringUtils.isBlank(pd.rqst("borrow_name"))) whereUtil.getStringCondition("b.borrow_name", pd.rqst("borrow_name"), "like");
		//选择时间
		if(!StringUtils.isBlank(pd.get("timespan"))){
			String[] timeSpan = pd.get("timespan").split(",");
			whereUtil.getMultiCondition("i.add_time", timeSpan[0]+"&"+timeSpan[1]);			
		}
		//以后动选择的时间优先
		if (pd.rqst().containsKey("startTime")&&pd.rqst().containsKey("endTime")&&!StringUtils.isBlank(pd.rqst("startTime"))&&!StringUtils.isBlank(pd.rqst("endTime")))  baseService.timeFrame("i.add_time", whereUtil, pd, mv);
		if(!StringUtils.isBlank(pd.get("status")))		whereUtil.getStringCondition("i.status", pd.get("status"));
		
		try{
			list = thisDao.getMyinvestList(conn, rp);
		} catch (Exception e) {
			logger.error("getMyinvestList失败", e);
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


	public String doTransfer(PageData pd) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		String transferPrice=pd.rqst("price");
		
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("invest_id", pd.rqst("id"));
		whereUtil.getStringCondition("status", "7");
		
		HashMap<String, Object> whereMap = new HashMap<>();
		whereMap .put("paramCondition", whereUtil.getParamConditionList());
		List<Map<String, String>> detailList = new ArrayList<>();
		try {
			detailList = thisDao.getInvestorDetail(conn, whereMap);
		} catch (Exception e1) {
			logger.error("债权转让时获取投资明细出错："+e1.toString());
			MySQL.rollback(conn);
			MySQL.closeConnection(conn);
			return "获取投资明细出错";
		}
		
		WhereUtil whereUtil2 = new WhereUtil();
		whereUtil2.getStringCondition("invest_id", pd.rqst("id"));
		whereUtil2.getStringCondition("uid", userInfo.get("id"));
		
		HashMap<String, Object> whereMap2 = new HashMap<>();
		whereMap2 .put("paramCondition", whereUtil2.getParamConditionList());
		try {
			Map<String, String> hasTrans = thisDao.getTransferInfo(conn, whereMap2);
			if(hasTrans.size()>0){
				MySQL.rollback(conn);
				MySQL.closeConnection(conn);
				return "已转让过了";
			}
		} catch (Exception e) {
			//
		}
		
		//可转让明细
		int detailLen = detailList.size();
		String detail_ids = "";
		String borrowId = "";
		double allCapital = 0;
		for (int i = 0; i < detailLen; i++) {
			Map<String, String> thisDetail = detailList.get(i);
			detail_ids+=","+thisDetail.get("id");
			allCapital = Double.valueOf(DfMath.s2add(allCapital+"", thisDetail.get("capital")));
			if(i==0) borrowId=thisDetail.get("borrow_id");
		}
		detail_ids=detail_ids.substring(1);
		//转让手续费
		Map<String, Object> cacheBorrow = ConfigCache.getCacheList("cache_borrow");
		String feeRateString = (cacheBorrow==null)?"5":((HashMap<String, String>)cacheBorrow.get("other")).get("borrow_transfer");
		double feeRate = DfMath.s2div(feeRateString, "1000", 9);
		double siteFee = DfMath.s2round(DfMath.multi(allCapital, feeRate)+"");
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("uid", userInfo.get("id"));
		paramMap.put("borrow_id", borrowId);
		paramMap.put("invest_id", pd.rqst("id"));
		paramMap.put("detail_id", detail_ids);
		paramMap.put("credit_money", allCapital);
		paramMap.put("site_fee", siteFee);
		paramMap.put("transfer_fee", DfMath.s2sub(transferPrice, allCapital+""));
		paramMap.put("add_time", Tools.getLongTime());
		paramMap.put("add_ip",Tools.getClientIp());	
		try{
			Long res = T.load("credit_assignment", conn).I(paramMap);
			
			//更新被转让的详细
			WhereUtil deailWhere = new WhereUtil();
			deailWhere.getStringCondition("id", detail_ids, "in");
			HashMap<String, Object> upDetailHashMap = new HashMap<>();
			upDetailHashMap.put("transfer_id", res);
			T.load("investor_detail", conn).W(deailWhere.getParamConditionList()).U(upDetailHashMap);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("getMyinvestList失败", e);
			MySQL.rollback(conn);
			return "添加失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}



	public HashMap<String, Object> getTransferInfo(PageData pd) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		String transferPrice=pd.rqst("price");
		
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("invest_id", pd.rqst("id"));
		whereUtil.getStringCondition("status", "7");
		
		HashMap<String, Object> whereMap = new HashMap<>();
		whereMap .put("paramCondition", whereUtil.getParamConditionList());
		List<Map<String, String>> detailList = new ArrayList<>();
		try {
			detailList = thisDao.getInvestorDetail(conn, whereMap);
		} catch (Exception e1) {
			HashMap<String, Object> res = new HashMap<>();
			res.put("res", "error");
			res.put("msg", "获取投资明细出错");
			MySQL.closeConnection(conn);
			return res;
		}
		
		WhereUtil whereUtil2 = new WhereUtil();
		whereUtil2.getStringCondition("invest_id", pd.rqst("id"));
		whereUtil2.getStringCondition("uid", userInfo.get("id"));
		
		HashMap<String, Object> whereMap2 = new HashMap<>();
		whereMap2 .put("paramCondition", whereUtil2.getParamConditionList());
		int detailLen = detailList.size();
		try {
			Map<String, String> hasTrans = thisDao.getTransferInfo(conn, whereMap2);
			if(hasTrans.size()>0){
				HashMap<String, Object> res = new HashMap<>();
				res.put("res", "error");
				res.put("msg", "已转让过了");
				MySQL.closeConnection(conn);
				return res;
			}
		} catch (Exception e) {
			//logger.error("判断转让条件出错"+e.toString());
		}
		if (detailLen==0) {
			logger.info("可转期数"+detailLen);
			HashMap<String, Object> res = new HashMap<>();
			res.put("res", "error");
			res.put("msg", "无可转让期数");
			MySQL.closeConnection(conn);
			return res;
		}
		//logger.info("可转期数"+detailLen);
		//可转让明细
		
		String detail_ids = "";
		String borrowId = "";
		double allCapital = 0;
		for (int i = 0; i < detailLen; i++) {
			Map<String, String> thisDetail = detailList.get(i);
			detail_ids+=","+thisDetail.get("id");
			allCapital = Double.valueOf(DfMath.s2add(allCapital+"", thisDetail.get("capital")));
			if(i==0) borrowId=thisDetail.get("borrow_id");
		}
		detail_ids=detail_ids.substring(1);
		//转让手续费
		Map<String, Object> cacheBorrow = ConfigCache.getCacheList("cache_borrow");
		String feeRateString = (cacheBorrow==null)?"5":((HashMap<String, String>)cacheBorrow.get("other")).get("borrow_transfer");
		double feeRate = DfMath.s2div(feeRateString, "1000", 9);
		double siteFee = DfMath.s2round(DfMath.multi(allCapital, feeRate)+"");
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("borrow_id", borrowId);
		paramMap.put("invest_id", pd.rqst("id"));
		paramMap.put("detail_id", detail_ids);
		paramMap.put("credit_money", allCapital);
		paramMap.put("site_fee", siteFee);
		paramMap.put("transfer_fee", DfMath.s2sub(transferPrice, allCapital+""));
		paramMap.put("res", "success");
		
		MySQL.closeConnection(conn);
		return paramMap;
	}



 


 

 
}












 


 

	

	

