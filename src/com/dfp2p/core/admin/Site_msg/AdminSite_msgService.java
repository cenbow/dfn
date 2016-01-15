package com.dfp2p.core.admin.Site_msg;

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


@Service("adminSite_msgService")
public class AdminSite_msgService{

	private static Log logger = LogFactory.getLog(AdminSite_msgService.class);
	
	@Resource(name="adminSite_msgDao")
	private AdminSite_msgDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getSite_msgList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("i","site_msg");
			whereUtil.setAlias("m","user");
			whereUtil.setAlias("mi","user_info");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			
			 
		 
			
			//注册时间
			baseService.timeFrame("i.send_time",whereUtil, pd, mv);
			
			 
			
			
			try{
				
				list = thisDao.getSite_msgList(conn, rp);
			} catch (Exception e) {
				logger.error("getSite_msgList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public boolean deleteMsg(HashMap<String, Object> delMap) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			
			Long count = thisDao.deleteMsg(conn, delMap);
			MySQL.commit(conn);
			if (count > 0)	return true;
		} catch (Exception e) {
			logger.error("deleteMsg失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}

	 

	
}
