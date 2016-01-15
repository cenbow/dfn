package com.dfp2p.core.admin.Nav;

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


@Service("adminNavService")
public class AdminNavService{

	private static Log logger = LogFactory.getLog(AdminNavService.class);
	
	@Resource(name="adminNavDao")
	private AdminNavDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getNavList(PageData pd, ModelAndView mv) 
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		List<Map<String,String>> datalist=  null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("v","nav");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
	 
		
		try{
			
			list = thisDao.getNavList(conn, rp);
			datalist = (List<Map<String,String>>)list.get("data");
			List<Map<String, String>> strList = baseService.getTreeNavList(datalist);
			list.put("data", strList);
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	public boolean doEdit_sort_order(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> pdMaps = pd.post();
		
		try {
			String[] nonRequired_str = {};
			baseService.sortOrderHandler(conn, pdMaps, "nav", "id", "#sort#", "sort_order", nonRequired_str);
			MySQL.commit(conn);
			return true;
		} catch (ClassNotFoundException | SQLException | IOException e) {
			logger.error("doEdit_sort_order失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}

		
		return false;
	}






	 





	public boolean addNav(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("nav");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		Tools.printData(pd);
		try{
			Long key = thisDao.addNav(conn, paramMap);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addNav失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public HashMap<String, Object> getNavById(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("v","nav");
		whereUtil.getStringCondition("v.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		try{
			
			list = thisDao.getNavList(conn, rp);
			if (list.get("data") != null && ((List)list.get("data")).size()>0)
				return (HashMap<String, Object>) (((List)list.get("data")).get(0));
		} catch (Exception e) {
			logger.error("getNavById失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
	}






	public Map<String, Object> getNavSelectList(PageData pd, ModelAndView mv) {
Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		List<Map<String,String>> datalist=  null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("v","nav");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
	 
		
		try{
			
			list = thisDao.getNavList(conn, rp);
			datalist = (List<Map<String,String>>)list.get("data");
			List<Map<String, String>> strList = baseService.getTreeNavSelectList(datalist);
			list.put("data", strList);
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	public boolean editNav(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("nav" , nonRequired_str);
		
		 Tools.printData(map);

		try{
			 BaseDao.update(conn, "nav", map, null);
			 MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editNav失败", e);
			return false;
		} finally {
			MySQL.closeConnection(conn);
		}
		return true;
	}






	public boolean deleteNav(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			HashMap<String, Object> rd = new HashMap<String, Object>();
			rd.put("id", pd.get("id"));
			Long count = thisDao.deleteNav(conn, rd);
			if (count > 0)
				return true;
		} catch (Exception e) {
			logger.error("deleteArticle_category失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;

	}
	
}












 


 

	

	

