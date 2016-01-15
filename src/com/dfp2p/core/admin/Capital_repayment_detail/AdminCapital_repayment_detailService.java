package com.dfp2p.core.admin.Capital_repayment_detail;

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

import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminCapital_repayment_detailService")
public class AdminCapital_repayment_detailService{

	private static Log logger = LogFactory.getLog(AdminCapital_repayment_detailService.class);
	
	@Resource(name="adminCapital_repayment_detailDao")
	private AdminCapital_repayment_detailDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getCapital_repayment_detailList(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("b","borrow_info");
		whereUtil.setAlias("bv","borrow_view");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		//baseService.compareNum("b.borrow_money", whereUtil, pd, mv);
		//注册时间
		baseService.timeFrame("bv.deadline",whereUtil, pd, mv);		
		
		
		try{
			 list = thisDao.getBorrowList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrowList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	public HashMap<String, Object> getCapital_repayment_detailExcelList(PageData pd,
			ModelAndView mv) {
		pd = Tools.convertDollar(pd);
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("b","borrow_info");
		whereUtil.setAlias("d","investor_detail");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		//baseService.compareNum("b.borrow_money", whereUtil, pd, mv);
		//注册时间
		baseService.timeFrame("d.deadline",whereUtil, pd, mv);		
		
		
		
		try{
			 list = thisDao.getCapital_repayment_detailExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrowList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	 



	  
	
}












 


 

	

	

