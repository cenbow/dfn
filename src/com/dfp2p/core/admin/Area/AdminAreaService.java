package com.dfp2p.core.admin.Area;

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


@Service("adminAreaService")
public class AdminAreaService{

	private static Log logger = LogFactory.getLog(AdminAreaService.class);
	
	@Resource(name="adminAreaDao")
	private AdminAreaDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getAreaList(PageData pd, ModelAndView mv) 
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("a","area");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		
		
		try{
			 list = thisDao.getAreaList(conn, rp);
			 List<Map<String,String>> datalist = (List<Map<String,String>>)list.get("data");
			 List<Map<String, String>> strList = baseService.getTreeArea(datalist);
			 list.put("data", strList);
			 
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	public boolean doEdit_sort_order(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> pdMaps = pd.post();
		
		try {
			String[] nonRequired_str = {};
			baseService.sortOrderHandler(conn, pdMaps, "menu", "id", "#sort#", "sort_order", nonRequired_str);
			MySQL.commit(conn);
			return true;
		} catch (ClassNotFoundException | SQLException | IOException e) {
			logger.error("doEdit_sort_order失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}

		
		return false;
	}





 


 
	
}












 


 

	

	

