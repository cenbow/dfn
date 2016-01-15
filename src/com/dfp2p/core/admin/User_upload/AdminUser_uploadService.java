package com.dfp2p.core.admin.User_upload;

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
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminUser_uploadService")
public class AdminUser_uploadService{

	private static Log logger = LogFactory.getLog(AdminUser_uploadService.class);
	
	@Resource(name="adminUser_uploadDao")
	private AdminUser_uploadDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	 
	/**获取客服MAP
	 * @return
	 */
	public  LinkedHashMap<String, Object> getCustomerMap() {
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("is_kf", "1");
		rp.put("paramCondition",whereUtil.getParamConditionList());
		LinkedHashMap<String,Object> pageVar = new LinkedHashMap<String,Object>();
		pageVar.put("", "所有");
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		try{
			DataSet ds = T.load("admin_user u", conn).W(paramCondition).Q(null); 
			List<Map<String,String>> result = BeanMapUtils.dataSetToListMap(ds);
			
			if (result != null && result.size()>0)
			{
				for (Map<String,String> map:result)
					pageVar.put(map.get("id"), map.get("user_name"));
			}
		} catch (Exception e) {
			logger.error("getCustomerMap失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return pageVar;

	}



	public  HashMap<String, Object> getEgroupList() {
		Connection conn = MySQL.getConnectionReadOnly(true);
		LinkedHashMap<String,Object> pageVar = new LinkedHashMap<String,Object>();
		try{
			DataSet ds = T.load("egroup", conn).O("sort_order asc").Q(null); 
			List<Map<String,String>> result = BeanMapUtils.dataSetToListMap(ds);
			
			List<Map<String, String>> strList = Tools.getTreeList(result,"0","id", "parent_id", "text","&nbsp;");
			pageVar.put("data", strList);
		} catch (Exception e) {
			logger.error("getEgroupMap失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return pageVar;
	}
	/**上传资料map
	 * @return
	 */
	public  LinkedHashMap<String, Object> getEgroupMap() {
		Connection conn = MySQL.getConnectionReadOnly(true);
		LinkedHashMap<String,Object> pageVar = new LinkedHashMap<String,Object>();
		pageVar.put("", "所有");
		try{
			DataSet ds = T.load("egroup", conn).Q(null); 
			List<Map<String,String>> result = BeanMapUtils.dataSetToListMap(ds);
			
			List<Map<String, String>> strList = Tools.getTreeList(result,"0","id", "parent_id", "text","&nbsp;");
			if (strList != null && strList.size()>0)
			{
				for (Map<String,String> map:strList)
					pageVar.put(map.get("id"), map.get("text"));
			}
		} catch (Exception e) {
			logger.error("getEgroupMap失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return pageVar;
	}


	 


	public HashMap<String, Object> getUploadList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("u","user_upload");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		if (pd.get("id")!= null)
			whereUtil.getStringCondition("u.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		 
		 //时间
		baseService.timeFrame("u.add_time", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getUploadList(conn, rp);
			Tools.printData(list);
		} catch (Exception e) {
			logger.error("getUser_bankList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public HashMap<String, Object> getEgroupListById(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("e","egroup");
		whereUtil.getStringCondition("e.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		try{
			
			list = thisDao.getEgroupList(conn, rp);
			if (list.get("data") != null && ((List)list.get("data")).size()>0)
				return (HashMap<String, Object>) (((List)list.get("data")).get(0));
		} catch (Exception e) {
			logger.error("getArticle_categoryById失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
	}



	public String editEgroup(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("egroup" , nonRequired_str);
		
		 Tools.printData(map);

		try{
			 BaseDao.update(conn, "egroup", map, null);
			 MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editEgroup失败", e);
			return  "修改失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}



	public boolean doEdit_sort_order(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> pdMaps = pd.post();
		
		try {
			String[] nonRequired_str = {};
			baseService.sortOrderHandler(conn, pdMaps, "egroup", "id", "#sort#", "sort_order", nonRequired_str);
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



	public boolean editUser_upload(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("user_upload" , nonRequired_str);
		
		 Tools.printData(map);

		try{
			 BaseDao.update(conn, "user_upload", map, null);
			 MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editUser_upload失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;

 
 

	 

	}


	public boolean do_delete_egroup(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long list = null;
		

		String id = pd.get("id");
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("id",id); 
		
		try{
			list = thisDao.delete_egroup(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_nameList失败", e);
			list=0l;
		} finally {
			MySQL.closeConnection(conn);
		}
		return (list>0)?true:false;
	}
	


	public boolean addEgroup(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("egroup");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		Tools.printData(pd);
		try{
			Long key = thisDao.addEgroup(conn, paramMap);
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
}
