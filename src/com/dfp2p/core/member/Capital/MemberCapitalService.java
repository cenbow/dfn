package com.dfp2p.core.member.Capital;

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
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberCapitalService")
public class MemberCapitalService{

	private static Log logger = LogFactory.getLog(MemberCapitalService.class);
	
	@Resource(name="memberCapitalDao")
	private MemberCapitalDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	


	public HashMap<String, Object> getCapitalList(PageData pd, ModelAndView mv)
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
		if(pd.rqst().containsKey("info")&&!StringUtils.isBlank(pd.rqst("info"))) whereUtil.getStringCondition("info", pd.rqst("info"), "like");
		//选择时间
		if(!StringUtils.isBlank(pd.get("timespan"))){
			String[] timeSpan = pd.get("timespan").split(",");
			whereUtil.getMultiCondition("add_time", timeSpan[0]+"&"+timeSpan[1]);			
		}
		//以后动选择的时间优先
		if (pd.rqst().containsKey("startTime")&&pd.rqst().containsKey("endTime")&&!StringUtils.isBlank(pd.rqst("startTime"))&&!StringUtils.isBlank(pd.rqst("endTime")))  baseService.timeFrame("add_time", whereUtil, pd, mv);
		if(!StringUtils.isBlank(pd.get("moneyType"))&&!"0".equals(pd.get("moneyType")))		whereUtil.getStringCondition("type", pd.get("moneyType"));
		
		try{
			
			list = thisDao.getCapitalList(conn, rp);
		} catch (Exception e) {
			logger.error("getCapitalList失败", e);
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






 


 

 
}












 


 

	

	

