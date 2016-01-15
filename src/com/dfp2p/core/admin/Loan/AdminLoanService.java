package com.dfp2p.core.admin.Loan;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminLoanService")
public class AdminLoanService{

	private static Log logger = LogFactory.getLog(AdminLoanService.class);
	
	@Resource(name="adminLoanDao")
	private AdminLoanDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getLoanList(PageData pd, ModelAndView mv) 
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
//		WhereUtil whereUtil = new WhereUtil();
//		whereUtil.setAlias("l","loan_info");
//		whereUtil.getStringCondition("a.id", pd.get("id"));
//		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		
		
		try{
				list = thisDao.getLoanList(conn, rp);
		} catch (Exception e) {
			logger.error("getLoanList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



 



	public HashMap<String, Object> getLoan(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("l","loan_info");
		whereUtil.getStringCondition("l.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		
		
		try{
				list = thisDao.getLoan(conn, rp);
		} catch (Exception e) {
			logger.error("getLoan失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}







	public String editLoan(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("l","loan_info");
		whereUtil.getStringCondition("l.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		Map<String,Object> userMap = pd.getFormHandler("loan_info",null);
		
		try{
				Long count = BaseDao.update(conn, "loan_info", userMap, null);
				if (count >0)
				{
					MySQL.commit(conn);
					return "success";
				}
		} catch (Exception e) {
			logger.error("getLoan失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return "修改失败";
	}







	 

 


 




	
 


 

	

	
}
