package com.dfp2p.core.app.login;

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
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;

import org.apache.commons.lang.StringUtils;


@Service("appLoginService")
public class AppLoginService{

	private static Log logger = LogFactory.getLog(AppLoginService.class);
	
	@Resource(name="appLoginDao")
	private AppLoginDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;

	public boolean getUser(PageData pd, HttpServletResponse response) {
		boolean isLogin =false;
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");

		String user_pass = pd.post("pass_word");
		whereUtil.getStringCondition("user_pass", user_pass);
		String userName = pd.post("user_name");
		
		if (userName.contains("@"))
			whereUtil.getStringCondition("user_email", userName);
		else
			whereUtil.getStringCondition("user_name", userName);
		
		try{			
			list = thisDao.getUser(conn, whereUtil);
			if(list!=null){
				Map<String, String> userIn = list;
				isLogin = baseService.memberLogin(userIn.get("id"), conn, 0, response);
			}
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("getDetail失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return isLogin;
	}
	
	


	 
	
}
