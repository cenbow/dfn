package com.dfp2p.core.admin.Login;

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
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminLoginService")
public class AdminLoginService{

	private static Log logger = LogFactory.getLog(AdminLoginService.class);
	
	@Resource(name="adminLoginDao")
	private AdminLoginDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	




	public Map<String, String> checkLogin(PageData pd, ModelAndView mv)
	{
		Connection conn = MySQL.getConnectionReadOnly(true);		
		Map<String, String> userInfo = null;

		
		HashMap<String,Object> map = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("user_name", pd.post("user_name"));
		whereUtil.getStringCondition("user_pass", borrowAndInvest.userPassCreate(pd.post("user_pass")));
		map.put("paramCondition",whereUtil.getParamConditionList());
		
		try{		
			userInfo = thisDao.getUserInfo(conn, map);
		} catch (Exception e) {
			logger.error("getLoginLogsList失败", e);
			return null;
		} finally {
			MySQL.closeConnection(conn);
		}
		return userInfo;
	}




 

 
}












 


 

	

	

