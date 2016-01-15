package com.dfp2p.core.home.Index;

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
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.fun.Home.HomeData;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("IndexService")
public class IndexService{

	private static Log logger = LogFactory.getLog(IndexService.class);
	@Resource(name="baseService")
	private BaseService baseService;

	public HashMap<String, Object> getBorrowList(PageData pd,ModelAndView mv) {
		HashMap<String, Object> getRes = null;
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil borrowMap = new WhereUtil();
		borrowMap.getStringCondition("b.borrow_status", "2,4,6,7","in");
		borrowMap.getStringCondition("borrow_type", "6","<>");
		
		HashMap<String, Object> parmHashMap = new HashMap<>();
		parmHashMap.put("whereMap", borrowMap.getParamConditionList());
		parmHashMap.put("addFields", "b.borrow_pass,b.vouch_company_id,b.mortgage_id,b.xtype,b.is_show_invest");
		parmHashMap.put("orderBy", "field(b.borrow_status,'2','4','6','7'),b.id DESC");
		parmHashMap.put("pageSize", 5);
		try {
			getRes = HomeData.getBorrowList(conn, parmHashMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			logger.error("获取借款数据有误"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
		return getRes;
	}

 
	public HashMap<String, Object> getXBorrowList() {
		HashMap<String, Object> getRes = null;
		Connection conn = MySQL.getConnectionReadOnly(true);
		WhereUtil borrowMap = new WhereUtil();
		borrowMap.getStringCondition("b.borrow_status", "2,4,6,7","in");
		borrowMap.getStringCondition("b.borrow_type", "6","=");
		
		HashMap<String, Object> parmHashMap = new HashMap<>();
		parmHashMap.put("whereMap", borrowMap.getParamConditionList());
		parmHashMap.put("addFields", "b.borrow_pass,b.vouch_company_id,b.mortgage_id");
		parmHashMap.put("orderBy", "field(b.borrow_status,'2','4','6','7'),b.id DESC");
		parmHashMap.put("pageSize", 1);
		try {
			getRes = HomeData.getBorrowList(conn, parmHashMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			logger.error("获取借款数据有误"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
		return getRes;
	}

 

	

	
}
