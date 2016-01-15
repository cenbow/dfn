package com.dfp2p.core.admin.Cache_pay;

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
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminCache_payService")
public class AdminCache_payService{

	private static Log logger = LogFactory.getLog(AdminCache_payService.class);
	
	@Resource(name="adminCache_payDao")
	private AdminCache_payDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
 


	public boolean editCache_pay(PageData pd, ModelAndView mv) {
			
		
		
		//修改信息
		Map<String, Object> rv = new HashMap<String, Object>();
		String enable = pd.post("enable");
		String name = pd.post("name");
		String feerate = pd.post("feerate");
		String MerCode = pd.post("MerCode");
		String MerKey = pd.post("MerKey");
		rv.put("enable",enable );
		rv.put("name",name );
		rv.put("feerate",feerate );
		rv.put("MerCode", MerCode);
		rv.put("MerKey",MerKey );
		
		ConfigCache.doEditCache("cache_pay", rv);
		return false;
	}






	public Map<String, Object> getCache_payList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		Map<String, Object> list = null;
		 
		try{
			
			list = ConfigCache.getCacheList("cache_pay");
			 
		} catch (Exception e) {
			logger.error("getCache_payList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	
}












 


 

	

	

