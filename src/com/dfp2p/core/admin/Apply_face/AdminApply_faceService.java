package com.dfp2p.core.admin.Apply_face;

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


@Service("adminApply_faceService")
public class AdminApply_faceService{

	private static Log logger = LogFactory.getLog(AdminApply_faceService.class);
	
	@Resource(name="adminApply_faceDao")
	private AdminApply_faceDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getApply_faceList(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mm","user_count");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("v","apply_face");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//是否VIP
		baseService.isVip("isVip", whereUtil, pd, mv);		
		 
		//注册时间
		baseService.timeFrame("m.reg_time",whereUtil, pd, mv);		
		
		try{
			
			list = thisDao.getApply_faceList(conn, rp);
		} catch (Exception e) {
			logger.error("getApply_faceList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	



	

	
}
