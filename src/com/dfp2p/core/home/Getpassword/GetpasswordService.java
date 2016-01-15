package com.dfp2p.core.home.Getpassword;

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

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("GetpasswordService")
public class GetpasswordService{

	private static Log logger = LogFactory.getLog(GetpasswordService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="GetpasswordDao")
	private GetpasswordDao thisDao;
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	public long checkAccount(String account) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil whereMap = new WhereUtil();
		if(account.contains("@")) whereMap.getStringCondition("user_email", account);
		else whereMap.getStringCondition("user_phone", account);
		long accountId = 0;
		try {
			DataSet userDataSet = T.load("user", conn).W(whereMap.getParamConditionList()).Q("id");
			Map<String, String> userInfo = BeanMapUtils.dataSetToListMap(userDataSet).get(0);
			accountId = Long.valueOf(userInfo.get("id"));
		} catch (Exception e) {
			accountId=0;
		}
		
		
		MySQL.closeConnection(conn);
		
		return accountId;
	}

	
	public long setNewPass(String uid,String newpass) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		HashMap<String, Object> savePass = new HashMap<>();
		savePass.put("id", uid);
		savePass.put("user_pass",borrowAndInvest.userPassCreate(newpass));
		Long res=0l;
		try {
			res = BaseDao.update(conn, "user", savePass, null);
			MySQL.commit(conn);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}	
		
		return res;
	}

 

	

	
}
