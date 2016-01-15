package com.dfp2p.core.app.recycle;

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


@Service("appRecycleService")
public class AppRecycleService{

	private static Log logger = LogFactory.getLog(AppRecycleService.class);
	
	@Resource(name="appRecycleDao")
	private AppRecycleDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	


	public Map<String, Object> getInvestorByUidList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("i","borrow_investor");
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//status
		whereUtil.getStringCondition("i.investor_uid", "6");
		
		try{			
			list = thisDao.getInvestorByUidList(conn, rp);
		} catch (Exception e) {
			logger.error("getInvestorByUidList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	
	public Map<String,String> getInvestorList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String,String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("i","borrow_investor");

		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//status
		whereUtil.getStringCondition("i.id", pd.get("id"));
		 		
		try{			
			list = thisDao.getDetail(conn, rp);
		} catch (Exception e) {
			logger.error("getInvestorList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	 


	 
	
}
