package com.dfp2p.core.admin.Agency_list;

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

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminAgency_listService")
public class AdminAgency_listService{

	private static Log logger = LogFactory.getLog(AdminAgency_listService.class);
	
	@Resource(name="adminAgency_listDao")
	private AdminAgency_listDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getAgency_list(PageData pd,
			ModelAndView mv) {
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("au","agency_user");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			if (pd.get("id")!=null)
				whereUtil.getStringCondition("au.id", pd.get("id"));
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			
			
			//最后登录时间
			baseService.timeFrame("au.last_log_time", whereUtil, pd, mv);
			
			try{
				
				list = thisDao.getAgency_list(conn, rp);
			} catch (Exception e) {
				logger.error("getAgency_list失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public boolean editAgency_list(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("agency_user" , nonRequired_str);
		

		try{
			 BaseDao.update(conn, "agency_user", map, null);
			 MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editAgency_list失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}



	public boolean addAgency_list(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("agency_user");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		Tools.printData(pd);
		try{
			Long key = thisDao.addAgency_list(conn, paramMap);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addAgency_list失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}



	public boolean delAgency_list(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			
			Long count = thisDao.delAgency_list(conn, pd);
			if (count > 0)
				return true;
		} catch (Exception e) {
			logger.error("delAgency_list失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}


 

	
}
