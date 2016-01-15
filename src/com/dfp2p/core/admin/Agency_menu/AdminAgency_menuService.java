package com.dfp2p.core.admin.Agency_menu;

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


@Service("adminAgency_menuService")
public class AdminAgency_menuService{

	private static Log logger = LogFactory.getLog(AdminAgency_menuService.class);
	
	@Resource(name="adminAgency_menuDao")
	private AdminAgency_menuDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getAgency_menuList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		
		
		
		try{
			
			list = thisDao.getAgency_menuList(conn, rp);
			List<Map<String,String>> datalist = (List<Map<String,String>>)list.get("data");
			List<Map<String, String>> strList = getTreeAgency_menu(datalist);
			list.put("data", strList);
		} catch (Exception e) {
			logger.error("getAgency_menuList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	private List<Map<String, String>> getTreeAgency_menu(
			List<Map<String, String>> datalist) {
		List<Map<String, String>> result = Tools.getTreeList(datalist,"0","id", "parentid", "name","&nbsp;&nbsp;");
		
		return result;
	}






	public Map<String, Object> add_menu(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String,Object> dataList = null;
		HashMap<String, Object> rp = new HashMap<String, Object>();
		
		
		try{
			 dataList = thisDao.getAgency_menuList(conn, rp);
			 List<Map<String,String>> list = (List<Map<String,String>>)dataList.get("data");
			 List<Map<String, String>> strList = getTreeAgency_menu(list);
			 dataList.put("data", strList);
			 
		} catch (Exception e) {
			logger.error("add_menu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return dataList;
	}






	public boolean addAgency_menu(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("agency_menu");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		Tools.printData(pd);
		try{
			Long key = thisDao.addAgency_menu(conn, paramMap);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addAgency_menu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}





 




	public boolean delAgency_menu(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			
			Long count = thisDao.delAgency_menu(conn, pd);
			if (count > 0)
				return true;
		} catch (Exception e) {
			logger.error("delAgency_menu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public boolean editAgency_menu(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("agency_menu" , nonRequired_str);
		
		 Tools.printData(map);

		try{
			 BaseDao.update(conn, "agency_menu", map, null);
			 MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editAgency_menu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public boolean doEdit_sort_order(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> pdMaps = pd.post();
		
		try {
			String[] nonRequired_str = {};
			baseService.sortOrderHandler(conn, pdMaps, "agency_menu", "id", "#sort#", "sort_order", nonRequired_str);
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






	public HashMap<String, Object> getAgency_menuById(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("am","agency_menu");
		if(pd.get("id")!= null)
			whereUtil.getStringCondition("am.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		try{
			
			list = thisDao.getAgency_menuList(conn, rp);
			if (list.get("data") != null && ((List)list.get("data")).size()>0)
				return (HashMap<String, Object>) (((List)list.get("data")).get(0));
		} catch (Exception e) {
			logger.error("getAgency_menuById失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
	}
	

 


 




	
 


 

	

	
}
