package com.dfp2p.core.member.Card;

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


@Service("memberCardService")
public class MemberCardService{

	private static Log logger = LogFactory.getLog(MemberCardService.class);
	
	@Resource(name="memberCardDao")
	private MemberCardDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	

	public HashMap<String, Object> getMyCardList(PageData pd, ModelAndView mv)
{
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		WhereUtil.parseSearchMap(pd,whereUtil,conn);
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//指定ID
		whereUtil.getStringCondition("uid", userInfo.get("id"));		
		try{
			list = thisDao.getMyCardList(conn, rp);
		} catch (Exception e) {
			logger.error("getMyCardList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public HashMap<String, Object> getCardDetail(PageData pd)
	{
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil parmMap = new WhereUtil();
		parmMap.getStringCondition("uid", userInfo.get("id"));
		parmMap.getStringCondition("status","0");
		parmMap.getStringCondition("expired_time",Tools.getLongTime()+"",">");
		
		WhereUtil parmMap2 = new WhereUtil();
		parmMap2.getStringCondition("uid", userInfo.get("id"));
		parmMap2.getStringCondition("expired_time",Tools.getLongTime()+"","<=");
		
		WhereUtil parmMap3 = new WhereUtil();
		parmMap3.getStringCondition("uid", userInfo.get("id"));
		parmMap3.getStringCondition("status","1");
		Map<String, String> list = new HashMap<>();
		Map<String, String> list2 = new HashMap<>();
		Map<String, String> list3 = new HashMap<>();
		HashMap<String, Object> returnMap = new HashMap<>();
		try{
			list = thisDao.getCardDetail(conn, parmMap);
			list2 = thisDao.getCardDetail(conn, parmMap2);
			list3 = thisDao.getCardDetail(conn, parmMap3);
			returnMap.put("no_expired", list);
			returnMap.put("expired", list2);
			returnMap.put("used", list3);
		} catch (Exception e) {
			logger.error("getCardDetail失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return returnMap;
	}

 
	public String getUserXCode(String uid) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		HashMap<String, String> returnMap;
		String xcode="";
		try{
			xcode = thisDao.getUserXcode(conn, uid);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("getUserXCode失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return xcode;
	}

	
	public HashMap<String, Object> getRecommendList(String uid) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> returnMap=new HashMap<>();
		try{
			returnMap = thisDao.getRecommendList(conn, uid);
		} catch (Exception e) {
			logger.error("getRecommendList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return returnMap;
	}

 

 
}












 


 

	

	

