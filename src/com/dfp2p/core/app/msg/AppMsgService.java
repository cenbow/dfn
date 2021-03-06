package com.dfp2p.core.app.msg;

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


@Service("appMsgService")
public class AppMsgService{

	private static Log logger = LogFactory.getLog(AppMsgService.class);
	
	@Resource(name="appMsgDao")
	private AppMsgDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getUserList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("b","borrow_info");

			rp.put("paramCondition",whereUtil.getParamConditionList());
			
			//status
			whereUtil.getStringCondition("b.borrow_status", "2,4,6,7","in");
			 		
			try{			
				list = thisDao.getList(conn, rp);
			} catch (Exception e) {
				logger.error("getList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public Map<String, String> getDetail(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("s","site_msg");

		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//id
		whereUtil.getStringCondition("s.id", pd.get("id"));
		 		
		try{			
			list = thisDao.getDetail(conn, rp);
		} catch (Exception e) {
			logger.error("getDetail失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public Object getFieldByUid(String string, String string2) {
		// TODO Auto-generated method stub
		return null;
	}



	public HashMap<String, Object> getInvestinfo(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("bi","borrow_investor");

		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//status
		whereUtil.getStringCondition("bi.borrow_id", pd.get("id"));
		 		
		try{			
			list = thisDao.getInvestinfo(conn, rp);
		} catch (Exception e) {
			logger.error("getInvestinfo失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public Map<String, Object> getSite_msgByUidList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("s","site_msg");
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//status
		whereUtil.getStringCondition("s.id", "5");
		
		try{			
			list = thisDao.getSite_msgList(conn, rp);
		} catch (Exception e) {
			logger.error("getSite_msgList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	
	public Map<String, Object> getSite_msgList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("s","site_msg");

		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//status
		whereUtil.getStringCondition("s.id", pd.get("id"));
		 		
		try{			
			list = thisDao.getSite_msgList(conn, rp);
		} catch (Exception e) {
			logger.error("getSite_msgList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public int getSite_msgByHas_readCount(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		int count = 0;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("s","site_msg");
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//status
		whereUtil.getStringCondition("s.has_read", "0");
		
		try{			
			count = thisDao.getSite_msgByHas_readCount(conn, rp);
		} catch (Exception e) {
			logger.error("getSite_msgList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return count;
	}



	public void save(Map<String, Object> value) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{			
			BaseDao.update(conn, "site_msg", value, null);
		} catch (Exception e) {
			logger.error("save失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		
	}



	 
	
}
