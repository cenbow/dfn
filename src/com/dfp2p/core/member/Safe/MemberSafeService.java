package com.dfp2p.core.member.Safe;

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
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberSafeService")
public class MemberSafeService{

	private static Log logger = LogFactory.getLog(MemberSafeService.class);
	
	@Resource(name="memberSafeDao")
	private MemberSafeDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;

	public boolean updateUser(Map<String, Object> userMap) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			Long key = thisDao.updateUser(conn, userMap);
			if (key>0)
			{
				MySQL.commit(conn);
				return true;
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("updateUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}

	public boolean updateUser_info(Map<String, Object> userMap) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			Long key = thisDao.updateUser_info(conn, userMap);
			if (key>0)
			{
				MySQL.commit(conn);
				return true;
			}
			else
			{
				Long count = BaseDao.insert(conn, "user_info", userMap);
				if (count >0)
				{
					MySQL.commit(conn);
					return true;
				}
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("updateUser_info失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}

	
	public String upVerify(Map<String, Object>upmap) {
		String reString="fail";
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			BaseDao.update(conn, "user_verify", upmap, null);
			MySQL.commit(conn);
			reString="success";
		} catch (Exception e) {
			logger.error("upVerify失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		
		return reString;
	}
	
	public Map<String, String> getUser(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mi", "user_info");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getUser(conn, rp);
		} catch (Exception e) {
			logger.error("getUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}

	public Map<String, String> findUserByPhone(String phone){
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		try{
			DataSet das = T.load("user", conn).W(Tools.BuildWhereMap("user_phone", phone, "=")).Q("id");
			data = BeanMapUtils.dataSetToListMap(das).get(0);
		} catch (Exception e) {
			logger.error("findUserByPhone失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}

	public Map<String, String> findUserByIdCard(String idcard){
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		try{
			DataSet das = T.load("user_info", conn).W(Tools.BuildWhereMap("idcard", idcard, "=")).Q("uid");
			data = BeanMapUtils.dataSetToListMap(das).get(0);
		} catch (Exception e) {
			logger.error("findUserById失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}

	public Map<String, String> getVerifyStatus(String uid) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		try{
			DataSet das = T.load("user_verify", conn).W(Tools.BuildWhereMap("uid", uid, "=")).Q(null);
			data = BeanMapUtils.dataSetToListMap(das).get(0);
		} catch (Exception e) {
			logger.error("getVerifyStatus失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}
	 
}












 


 

	

	

