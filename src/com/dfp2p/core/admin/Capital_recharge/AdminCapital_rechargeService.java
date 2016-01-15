package com.dfp2p.core.admin.Capital_recharge;

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
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminCapital_rechargeService")
public class AdminCapital_rechargeService{

	private static Log logger = LogFactory.getLog(AdminCapital_rechargeService.class);
	
	@Resource(name="adminCapital_rechargeDao")
	private AdminCapital_rechargeDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getCapital_rechargeList(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("rv","recharge_view");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		baseService.compareNum("rv.totalMoney", whereUtil, pd, mv);
		
		//充值次数
		String cbjSign = pd.get("cbj");
		String totalTimes = pd.get("totalTimes");
		if (totalTimes != null && !"".equals(totalTimes.trim()))
		{
				whereUtil.getStringCondition("rv.totalTimes", totalTimes, cbjSign);
				mv.addObject("cbj", cbjSign);
				mv.addObject("totalTimes", totalTimes);
		}
		
		try{
			 list = thisDao.getRecharge_logList(conn, rp);
		} catch (Exception e) {
			logger.error("getRecharge_logList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}




	public HashMap<String, Object> getCapital_rechargeExcelList(PageData pd,
			ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		pd = Tools.convertDollar(pd);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("rv","recharge_view");
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		baseService.compareNum("rv.totalMoney", whereUtil, pd, mv);
		
		//充值次数
		String cbjSign = pd.get("cbj");
		String totalTimes = pd.get("totalTimes");
		if (totalTimes != null && !"".equals(totalTimes.trim()))
		{
				whereUtil.getStringCondition("rv.totalTimes", totalTimes, cbjSign);
				mv.addObject("cbj", cbjSign);
				mv.addObject("totalTimes", totalTimes);
		}
		
		try{
			 list = thisDao.getRecharge_logExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getRecharge_logList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	 



	  
	
}












 


 

	

	

