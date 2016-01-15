package com.dfp2p.core.admin.Borrow_expired;

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


@Service("adminBorrow_expiredService")
public class AdminBorrow_expiredService{

	private static Log logger = LogFactory.getLog(AdminBorrow_expiredService.class);
	
	@Resource(name="adminBorrow_expiredDao")
	private AdminBorrow_expiredDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getBorrow_expiredList(PageData pd,
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
		whereUtil.getStringCondition("d.deadline", Tools.getLongTime()+"","<");
		whereUtil.getStringCondition("d.status", "7");
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//注册时间
		baseService.timeFrame("b.deadline", whereUtil, pd, mv);
		
		 
		//借款总金额
		baseService.compareNum("b.borrow_money", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getBorrow_expiredList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_expiredList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	public HashMap<String, Object> getBorrow_expiredExcelList(PageData pd,
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
		
		//注册时间
		baseService.timeFrame("b.deadline", whereUtil, pd, mv);
		
		 
		//借款总金额
		baseService.compareNum("b.borrow_money", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getBorrow_expiredExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_expiredList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	

	
}
