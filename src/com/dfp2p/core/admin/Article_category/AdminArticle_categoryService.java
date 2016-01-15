package com.dfp2p.core.admin.Article_category;

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


@Service("adminArticle_categoryService")
public class AdminArticle_categoryService{

	private static Log logger = LogFactory.getLog(AdminArticle_categoryService.class);
	
	@Resource(name="adminArticle_categoryDao")
	private AdminArticle_categoryDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getArticle_categoryList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
//		WhereUtil whereUtil = new WhereUtil();
//		whereUtil.setAlias("c","article_category");
//		whereUtil.parseSearchMap(pd,whereUtil,conn);			
//		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
//		
//		rp.put("paramCondition",whereUtil.getParamConditionList());
//		mv.addObject("defaultMap",defaultMap);
		
		
		
		try{
			
			list = thisDao.getArticle_categoryList(conn, rp);
			List<Map<String,String>> datalist = (List<Map<String,String>>)list.get("data");
			List<Map<String, String>> strList = baseService.getTreeArticle_category(datalist);
			list.put("data", strList);
		} catch (Exception e) {
			logger.error("getArticle_categoryList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	public Map<String, Object> add_Menu(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String,Object> dataList = null;
		HashMap<String, Object> rp = new HashMap<String, Object>();
		
		
		try{
			 dataList = thisDao.getArticle_categoryList(conn, rp);
			 List<Map<String,String>> list = (List<Map<String,String>>)dataList.get("data");
			 List<Map<String, String>> strList = baseService.getTreeArticle_categorySelect(list);
			 dataList.put("data", strList);
			 
		} catch (Exception e) {
			logger.error("add_menu失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return dataList;
	}






	public boolean addArticle_category(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("article_category");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());

		try{
			Long key = thisDao.addArticle_category(conn, paramMap);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addArticle_category失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public HashMap<String, Object> getArticle_categoryById(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("c","article_category");
		whereUtil.getStringCondition("c.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		try{
			
			list = thisDao.getArticle_categoryList(conn, rp);
			if (list.get("data") != null && ((List)list.get("data")).size()>0)
				return (HashMap<String, Object>) (((List)list.get("data")).get(0));
		} catch (Exception e) {
			logger.error("getArticle_categoryById失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
	}






	public boolean deleteArticle_category(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			
			Long count = thisDao.deleteArticle_category(conn, pd);
			MySQL.commit(conn);
			if (count > 0)		return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("deleteArticle_category失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}






	public boolean editArticle_category(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("article_category" , nonRequired_str);
		
		 Tools.printData(map);

		try{
			 BaseDao.update(conn, "article_category", map, null);
			 MySQL.commit(conn);
			 return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editArticle失败", e);
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
			baseService.sortOrderHandler(conn, pdMaps, "article_category", "id", "#sort#", "sort_order", nonRequired_str);
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
	

 


 




	
 


 

	

	
}
