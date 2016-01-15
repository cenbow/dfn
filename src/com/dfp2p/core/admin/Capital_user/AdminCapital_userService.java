package com.dfp2p.core.admin.Capital_user;

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


@Service("adminCapital_userService")
public class AdminCapital_userService{

	private static Log logger = LogFactory.getLog(AdminCapital_userService.class);
	
	@Resource(name="adminCapital_userDao")
	private AdminCapital_userDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getCapital_userList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mm","user_count");
		whereUtil.setAlias("rv","recharge_view");
		whereUtil.setAlias("wv","withdraw_view");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			

		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		mv.addObject("balanceType", pd.get("balanceType"));
		
		//交易时间
		baseService.timeFrame("m.reg_time", whereUtil, pd, mv);
		baseService.compareNum(pd.get("balanceType").replace("#", "."), whereUtil, pd, mv);
		//提现金额
		String tbjSign = pd.get("tbj");
		String tbjNum = pd.get("tmoney");
		if (tbjNum != null && !"".equals(tbjNum.trim()))
		{
				whereUtil.getStringCondition("wv.totalWithdrawMoney", tbjNum, tbjSign);
				mv.addObject("tbj", tbjSign);
				mv.addObject("tmoney", tbjNum);
		}
		//充值金额
		String cbjSign = pd.get("cbj");
		String cbjNum = pd.get("cmoney");
		if (cbjNum != null && !"".equals(cbjNum.trim()))
		{
				whereUtil.getStringCondition("rv.totalMoney", cbjNum, cbjSign);
				mv.addObject("cbj", cbjSign);
				mv.addObject("cmoney", cbjNum);
		}
		
		try{
			list = thisDao.getCapital_userList(conn, rp);
		} catch (Exception e) {
			logger.error("getCapital_userList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
 

	public HashMap<String, Object> getCapital_userExcelList(PageData pd,
			ModelAndView mv) 
		{
		pd = Tools.convertDollar(pd);
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mm","user_count");
		whereUtil.setAlias("rv","recharge_view");
		whereUtil.setAlias("wv","withdraw_view");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			

		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		mv.addObject("balanceType", pd.get("balanceType"));
		
		//交易时间
		baseService.timeFrame("m.reg_time", whereUtil, pd, mv);
		baseService.compareNum(pd.get("balanceType").replace("#", "."), whereUtil, pd, mv);
		//提现金额
		String tbjSign = pd.get("tbj");
		String tbjNum = pd.get("tmoney");
		if (tbjNum != null && !"".equals(tbjNum.trim()))
		{
				whereUtil.getStringCondition("wv.totalWithdrawMoney", tbjNum, tbjSign);
				mv.addObject("tbj", tbjSign);
				mv.addObject("tmoney", tbjNum);
		}
		//充值金额
		String cbjSign = pd.get("cbj");
		String cbjNum = pd.get("cmoney");
		if (cbjNum != null && !"".equals(cbjNum.trim()))
		{
				whereUtil.getStringCondition("rv.totalMoney", cbjNum, cbjSign);
				mv.addObject("cbj", cbjSign);
				mv.addObject("cmoney", cbjNum);
		}
		
		try{
			list = thisDao.getCapital_userExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getCapital_userList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
 



	  
	
}












 


 

	

	

