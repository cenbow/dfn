package com.dfp2p.core.admin.User_refer_log;

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


@Service("adminUser_refer_logService")
public class AdminUser_refer_logService{

	private static Log logger = LogFactory.getLog(AdminUser_refer_logService.class);
	
	@Resource(name="adminUser_refer_logDao")
	private AdminUser_refer_logDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	

	public HashMap<String, Object> getUser_refer_logList(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("rw","refer_user_view");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		//影响金额
		baseService.compareNum("rw.num", whereUtil, pd, mv);
				 		
		try{	
			list = thisDao.getUser_referList(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_refer_logList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	 




	 


	 

	
}
