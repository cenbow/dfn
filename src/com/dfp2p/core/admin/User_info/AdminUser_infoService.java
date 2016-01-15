package com.dfp2p.core.admin.User_info;

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


@Service("adminUser_infoService")
public class AdminUser_infoService{

	private static Log logger = LogFactory.getLog(AdminUser_infoService.class);
	
	@Resource(name="adminUser_infoDao")
	private AdminUser_infoDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getUser_infoList(PageData pd, ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("m","user");
			whereUtil.setAlias("mi","user_info");
			whereUtil.setAlias("mci","user_common_info");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			 
			 
			
			try{
				
				list = thisDao.getUser_infoList(conn, rp);
			} catch (Exception e) {
				logger.error("getUser_bankList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}


	public HashMap<String, Object> getUser_info(PageData pd,ModelAndView mv){
		Connection conn=MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> list=null;
		HashMap<String, Object> rp=new HashMap<String, Object>();
		WhereUtil whereUtil=new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mi", "user_info");
		whereUtil.setAlias("mci", "user_common_info");
		whereUtil.getStringCondition("m.id", pd.get("id"));
		whereUtil.parseSearchMap(pd, whereUtil, conn);
		rp.put("paramCondition", whereUtil.getParamConditionList());
        try {
			list=thisDao.getUser_info(conn, rp);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("getUser_info失败", e);
		}finally{	
			MySQL.closeConnection(conn);
		}
        return list;
	}

 

	 

	
}
