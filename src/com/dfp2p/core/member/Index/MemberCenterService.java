package com.dfp2p.core.member.Index;

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
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberCenterService")
public class MemberCenterService{

	private static Log logger = LogFactory.getLog(MemberCenterService.class);
	
	@Resource(name="memberCenterDao")
	private MemberCenterDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	


	public HashMap<String, Object> getMoneyLogPerMonth(PageData pd,ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, Object> returnMap = new HashMap<>();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		List<Map<String, String>> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		rp.put("whereMap",whereUtil.getParamConditionList());
		//指定ID
		whereUtil.getStringCondition("uid",userInfo.get("id"));
		whereUtil.getStringCondition("type","10");
		double max = 0;
		LinkedHashMap<String, String> needDataMonth= new LinkedHashMap<>();
		try{
			list = thisDao.getMoneyLogPermonth(conn, rp);
			Tools.printData(list);
			for(Map<String, String> map:list)
			{
				max=(max>DfMath.s2round(map.get("money")))?max:DfMath.s2round(map.get("money"));
			}
			needDataMonth = buildMonthList(list);
			
		} catch (Exception e) {
			logger.error("getMoneyLogPerMonth失败", e);
			return null;
		} finally {
			MySQL.closeConnection(conn);
		}
		returnMap.put("list", needDataMonth);
		returnMap.put("max", max);
		return returnMap;
	}

	private LinkedHashMap<String, String> buildMonthList(List<Map<String, String>> list) {
		LinkedHashMap<String, String> hasDataMonth=hashMapList(list);
		LinkedHashMap<String, String> listMap  =new LinkedHashMap<>();
		for (int i = 11; i >=0; i--) {
			String timeMoneyString = Tools.TimeStamp2Date(Tools.timeAddMonth(-i, Tools.getLongTime()+"")+"","yyyy-MM");
			if(!Common.isBlankInMap(hasDataMonth, timeMoneyString)) listMap.put(timeMoneyString, hasDataMonth.get(timeMoneyString));
			else listMap.put(timeMoneyString, "0");
		}
		return listMap;
	}
	
	private LinkedHashMap<String, String> hashMapList(List<Map<String, String>> list) {
		LinkedHashMap<String, String> listMap  =new LinkedHashMap<>();
		for(Map<String, String>map:list){
			String keyString= map.get("month");
			String valString= map.get("money");
			listMap.put(keyString, valString);
		}
		return listMap;
	}




	public HashMap<String, String> getInvestorTypeCount(PageData pd,ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, String> returnMap = new HashMap<>();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		List<Map<String, String>> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		rp.put("whereMap",whereUtil.getParamConditionList());
		//指定ID
		whereUtil.getStringCondition("investor_uid",userInfo.get("id"));
		LinkedHashMap<String, String> needDataMonth= new LinkedHashMap<>();
		try{
			list = thisDao.getInvestorTypeCount(conn, rp);
			returnMap = typeCounter(list);
		} catch (Exception e) {
			logger.error("getInvestorTypeCount失败", e);
			return null;
		} finally {
			MySQL.closeConnection(conn);
		}
		return returnMap;
	}

	private LinkedHashMap<String, String> typeCounter(List<Map<String, String>> list) {
		LinkedHashMap<String, String> listMap  =new LinkedHashMap<>();
		for(Map<String, String>map:list){
			String keyString= map.get("status");
			String valString= map.get("num");
			listMap.put(keyString, valString);
		}
		return listMap;
	}


 

 
}












 


 

	

	

