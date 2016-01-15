package com.dfp2p.core.admin.Sms_msg;

import java.sql.Connection;
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

import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.WhereUtil;


@Service("adminSms_msgService")
public class AdminSms_msgService{

	private static Log logger = LogFactory.getLog(AdminSms_msgService.class);
	
	@Resource(name="adminSms_msgDao")
	private AdminSms_msgDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getSms_msgList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("s","sms_msg");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			
			 
			//发送时间
			baseService.timeFrame("s.send_time",whereUtil, pd, mv);
			
			try{
				
				list = thisDao.getSms_msgList(conn, rp);
			} catch (Exception e) {
				logger.error("getSms_msgList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public boolean addUser(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("user");
		Map<String, Object> paramMap2 = pd.getFormHandler("user_info");
		
		try{
			Long key = thisDao.addUser(conn, paramMap);
			paramMap2.put("uid", key);
			thisDao.addUser_info(conn, paramMap2);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}


	public Map<String, String> User_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getUser_edit(conn, rp);
		} catch (Exception e) {
			logger.error("addUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}


	public boolean editUser(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);	
		
		
		Map<String, Object> userMap = pd.getFormHandler("user");
		
		String[] nonRequired_str = {"city,area_now","city_now","sex","id_time","up_time","education","info","user_video","zy","income"
				,"id_status","card_img","marry"};
		Map<String, Object> user_infoMap = pd.getFormHandler("user_info" , nonRequired_str);
		user_infoMap.put("uid", userMap.get("id"));
		
//		List<String> errorList_user = pd.getError(userMap);
//		if( errorList_user!= null)
//		{
//			pd.put("errorList_user", errorList_user);
//		}
//		
//		List<String> errorList_user_info = pd.getError(userMap);
//		if( errorList_user_info!= null)
//		{
//			pd.put("errorList_user_info", errorList_user_info);
//		}
		
		
		
		try{
			thisDao.doEdit(conn,"user", userMap,null);
			thisDao.doEdit(conn,"user_info", user_infoMap,null);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}



	public Map<String, String> credit_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mm", "user_count");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getCredit_edit(conn, rp);
		} catch (Exception e) {
			logger.error("credit_edit失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}



	public Map<String, String> money_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mm", "user_count");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getMoney_edit(conn, rp);
		} catch (Exception e) {
			logger.error("money_edit失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}



	public Map<String, Object> getUser_nameList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, Object> list = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mm", "user_count");
		whereUtil.setAlias("mi", "user_info");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			list = thisDao.getUser_nameList(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_nameList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	



	

	
}
