package com.dfp2p.core.admin.Borrow_expired_user;

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

import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminBorrow_expired_userService")
public class AdminBorrow_expired_userService{

	private static Log logger = LogFactory.getLog(AdminBorrow_expired_userService.class);
	
	@Resource(name="adminBorrow_expired_userDao")
	private AdminBorrow_expired_userDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getBorrow_expired_userList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("b","borrow_info");
		whereUtil.setAlias("d","investor_detail");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		try{
			
			list = thisDao.getBorrow_expired_userList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_expired_userList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	public HashMap<String, Object> getBorrow_expired_userExcelList(PageData pd,
			ModelAndView mv) {

		pd = Tools.convertDollar(pd);
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("b","borrow_info");
		whereUtil.setAlias("d","investor_detail");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		try{
			
			list = thisDao.getBorrow_expired_userExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_expired_userList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	

	
}
