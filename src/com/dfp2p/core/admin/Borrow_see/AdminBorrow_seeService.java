package com.dfp2p.core.admin.Borrow_see;

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


@Service("adminBorrow_seeService")
public class AdminBorrow_seeService{

	private static Log logger = LogFactory.getLog(AdminBorrow_seeService.class);
	
	@Resource(name="adminBorrow_seeDao")
	private AdminBorrow_seeDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getBorrow_seeList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("bi","borrow_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		if (pd.get("id")!= null)
			whereUtil.getStringCondition("bi.id", pd.get("id"));
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//注册时间
		baseService.timeFrame("bi.add_time", whereUtil, pd, mv);
		
		 
		//影响积分
		baseService.compareNum("bi.borrow_money", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getBorrow_seeList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_seeList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	

	
}
