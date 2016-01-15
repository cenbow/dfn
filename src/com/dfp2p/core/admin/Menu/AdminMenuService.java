package com.dfp2p.core.admin.Menu;

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
import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;


@Service("adminMenuService")
public class AdminMenuService{

	private static Log logger = LogFactory.getLog(AdminMenuService.class);
	
	@Resource(name="adminMenuDao")
	private AdminMenuDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getMenuList(PageData pd, ModelAndView mv) 
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","menu");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		
		try{
			 list = thisDao.getMenuList(conn, rp);
			 List<Map<String,String>> datalist = (List<Map<String,String>>)list.get("data");
			 List<Map<String, String>> strList = baseService.getTreeMenu(datalist);
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
			baseService.sortOrderHandler(conn, pdMaps, "menu", "id", "#sort#", "sort_order", nonRequired_str);
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






	public Map<String, Object> add_Menu(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String,Object> dataList = null;
		HashMap<String, Object> rp = new HashMap<String, Object>();
		
		
		try{
			 dataList = thisDao.getMenuList(conn, rp);
			 List<Map<String,String>> list = (List<Map<String,String>>)dataList.get("data");
			 List<Map<String, String>> strList = baseService.getTreeMenuSelect(list);
			 dataList.put("data", strList);
			 
		} catch (Exception e) {
			logger.error("add_menu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return dataList;
	}






	public boolean addMenu(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("menu");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		Tools.printData(pd);
		try{
			Long key = thisDao.addMenu(conn, paramMap);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addMenu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public HashMap<String, Object> getMenuById(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","menu");
		whereUtil.getStringCondition("m.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		try{
			
			list = thisDao.getMenuList(conn, rp);
			if (list.get("data") != null && ((List)list.get("data")).size()>0)
				return (HashMap<String, Object>) (((List)list.get("data")).get(0));
		} catch (Exception e) {
			logger.error("getMenuById失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
	}






	public boolean editMenu(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("menu" , nonRequired_str);

		try{
			 BaseDao.update(conn, "menu", map, null);
			 MySQL.commit(conn);
			 return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editMenu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public boolean deleteMenu(HashMap<String,Object>delMap, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			
			Long count = thisDao.deleteMenu(conn, delMap);
			MySQL.commit(conn);
			if (count > 0)		return true;
		} catch (Exception e) {
			logger.error("deleteArticle_category失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;


	}



 
	
}












 


 

	

	

