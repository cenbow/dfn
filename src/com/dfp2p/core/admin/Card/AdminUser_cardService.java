package com.dfp2p.core.admin.Card;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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


@Service("adminUser_cardService")
public class AdminUser_cardService{

	private static Log logger = LogFactory.getLog(AdminUser_cardService.class);
	
	@Resource(name="adminUser_cardDao")
	private AdminUser_cardDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getUser_cardList(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("c","user_card");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//注册时间
		baseService.timeFrame("c.add_time", whereUtil, pd, mv);
		
		
		 	
 		try{
			
			list = thisDao.getUser_cardList(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_cardList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	public HashMap<String, Object> getUser_creditExcelList(PageData pd0,
			ModelAndView mv) {
		PageData pd = Tools.convertDollar(pd0);
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("l","user_creditslog");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//注册时间
		baseService.timeFrame("l.add_time", whereUtil, pd, mv);
		
		
		//影响积分
		baseService.compareNum("l.affect_credits", whereUtil, pd, mv);		
 		try{
			
			list = thisDao.getUser_creditExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_creditExcelList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	





	 


 




 





	

 

	

	
}
