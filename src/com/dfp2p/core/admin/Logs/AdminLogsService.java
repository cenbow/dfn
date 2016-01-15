package com.dfp2p.core.admin.Logs;

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
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminLogsService")
public class AdminLogsService{

	private static Log logger = LogFactory.getLog(AdminLogsService.class);
	
	@Resource(name="adminLogsDao")
	private AdminLogsDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	


	public HashMap<String, Object> getLogsList(PageData pd, ModelAndView mv)
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("l","operationlog");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		mv.addObject("defaultMap",defaultMap);
		
		//时间
		//baseService.timeFrame("add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getLogsList(conn, rp);
		} catch (Exception e) {
			logger.error("getLogsList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public HashMap<String, Object> getLoginLogsList(PageData pd, ModelAndView mv)
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("l","loginlog");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		mv.addObject("defaultMap",defaultMap);
		
		//时间
		//baseService.timeFrame("add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getLoginLogsList(conn, rp);
		} catch (Exception e) {
			logger.error("getLoginLogsList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}




 

 
}












 


 

	

	

