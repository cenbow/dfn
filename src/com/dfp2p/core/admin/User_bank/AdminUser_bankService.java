package com.dfp2p.core.admin.User_bank;

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


@Service("adminUser_bankService")
public class AdminUser_bankService{

	private static Log logger = LogFactory.getLog(AdminUser_bankService.class);
	
	@Resource(name="adminUser_bankDao")
	private AdminUser_bankDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getUser_bankList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("m","user");
			whereUtil.setAlias("v","UserVerify");
			whereUtil.setAlias("mi","user_info");
			whereUtil.setAlias("mb","user_banks");
			whereUtil.setAlias("mm","user_count");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			
			 
			String isVip = pd.post("isVip");
			
			//是否VIP
			if (isVip !=null && !"".equals(isVip) && Integer.parseInt(isVip.trim()) > 0)
			{
				whereUtil.getStringCondition("m.user_leve",	isVip, ">");
				mv.addObject("isVip", isVip);
			}
			else if (isVip !=null && !"".equals(isVip) && Integer.parseInt(isVip.trim()) == 0)
			{
				whereUtil.getStringCondition("m.user_leve",	isVip);
				mv.addObject("isVip", isVip);
			}
			 
			//注册时间
			baseService.timeFrame("mb.add_time", whereUtil, pd, mv);
			 
			
			try{
				
				list = thisDao.getUser_bankList(conn, rp);
			} catch (Exception e) {
				logger.error("getUser_bankList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public HashMap<String, Object> getUser_bankExcelList(PageData pd,
			ModelAndView mv) {
		pd = Tools.convertDollar(pd);
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("v","UserVerify");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("mb","user_banks");
		whereUtil.setAlias("mm","user_count");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		 
		String isVip = pd.post("isVip");
		
		//是否VIP
		if (isVip !=null && !"".equals(isVip) && Integer.parseInt(isVip.trim()) > 0)
		{
			whereUtil.getStringCondition("m.user_leve",	isVip, ">");
			mv.addObject("isVip", isVip);
		}
		else if (isVip !=null && !"".equals(isVip) && Integer.parseInt(isVip.trim()) == 0)
		{
			whereUtil.getStringCondition("m.user_leve",	isVip);
			mv.addObject("isVip", isVip);
		}
		 
		//注册时间
		baseService.timeFrame("mb.add_time", whereUtil, pd, mv);
		 
		
		try{
			
			list = thisDao.getUser_bankExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_bankList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	 

	
}
