package com.dfp2p.core.admin.Reward_log;

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

import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminReward_logService")
public class AdminReward_logService{

	private static Log logger = LogFactory.getLog(AdminReward_logService.class);
	
	@Resource(name="adminReward_logDao")
	private AdminReward_logDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getReward_logList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("l","reward_log");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		baseService.compareNum("l.affect_money", whereUtil, pd, mv);
		
		//交易时间
		baseService.timeFrame("l.add_time", whereUtil, pd, mv);
		
		try{
			 list = thisDao.getReward_logList(conn, rp);
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	public HashMap<String, Object> getReward_logExcelList(PageData pd,
			ModelAndView mv) {
		pd = Tools.convertDollar(pd);
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("l","reward_log");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		baseService.compareNum("l.affect_money", whereUtil, pd, mv);
		
		//交易时间
		baseService.timeFrame("l.add_time", whereUtil, pd, mv);
		
		try{
			 list = thisDao.getReward_logExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

  
	
}












 


 

	

	

