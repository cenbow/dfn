package com.dfp2p.core.app.member;

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
import com.dfp2p.core.admin.User.AdminUserDao;
import com.dfp2p.core.admin.User.AdminUserService;
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


@Service("appMemberService")
public class AppMemberService{

	private static Log logger = LogFactory.getLog(AppMemberService.class);
	
	 
	@Resource(name="baseService")
	private BaseService baseService;
	
	@Resource(name="adminUserDao")
	private AdminUserDao adminUserDao;
	
	@Resource(name="appMemberDao")
	private AppMemberDao thisDao;

	public Map<String, Object> getBorrow_infoList() {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("b","borrow_info");
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		whereUtil.getStringCondition("b.borrow_status", "2");
		whereUtil.getStringCondition("b.collect_time", Tools.getLongTime()+"",">");
		 		
		try{			
			list = thisDao.getBorrow_infoList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_infoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	public Map<String, String> getUser_login(String userId) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("u.uid", userId);
		 		
		try{			
			list = thisDao.getUser_login(conn, whereUtil);
		} catch (Exception e) {
			logger.error("getUser_login失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	

	public List<Map<String, String>> getBankListByUid(String userId) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		List<Map<String, String>> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("b","user_banks");
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		whereUtil.getStringCondition("b.uid", userId);
		 		
		try{			
			list = thisDao.getBankListByUid(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_infoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	public Map<String, String> getUserByUid(String userId) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mm","user_count");
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		whereUtil.getStringCondition("m.id", userId);
		 		
		try{			
			list = thisDao.getUserByUid(conn, whereUtil);
		} catch (Exception e) {
			logger.error("getUserByUid失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	
	public List<Map<String, String>> getLlpay_logList(String userId) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		List<Map<String, String>> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("l","llpay_log");
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		whereUtil.getStringCondition("l.uid", userId);
		whereUtil.getStringCondition("status", "1");
		 		
		try{			
			list = thisDao.getLlpay_logList(conn, rp);
		} catch (Exception e) {
			logger.error("getLlpay_logList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	 

	public void saveLlpay_log(Map<String, Object> save) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{			
			BaseDao.update(conn, "llpay_log", save, null);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("saveLlpay_log失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		
	}

	 

	public Long updateUser_info(Map<String, Object> result) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long count = 0l;
		try{			
			count = BaseDao.update(conn, "user_info", result, null);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("updateUser_info失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return count;
	}

	public Long addUser_info(Map<String, Object> result) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long count = 0l;
		try{			
			count = BaseDao.insert(conn, "user_info", result);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("updateUser_info失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return count;
	}

	public boolean updateUser_verify(Map<String, Object> result) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long count = 0l;
		try{			
			count = BaseDao.update(conn, "user_verify", result, null);
			MySQL.commit(conn);
			if(count>0)
				return true;
		} catch (Exception e) {
			logger.error("updateUser_verify失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}
	
	public long addUserWithdraw(Map<String, Object> moneydata, String bank) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		moneydata.put("bank_name", bank);
		Long count = 0l;
		try{			
			count = BaseDao.insert(conn, "withdraw", moneydata);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("addUserWithdraw失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return count;
	}

	public Long addUserWithdraw(Map<String, Object> moneydata) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long count = 0l;
		try{			
			count = BaseDao.insert(conn, "withdraw", moneydata);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("addUserWithdraw失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return count;
	}

	
	 


 

	 
	
}
