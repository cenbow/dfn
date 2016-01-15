package com.dfp2p.core.admin.Credit_assignment;

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
import javax.servlet.http.HttpSession;

import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminCredit_assignmentService")
public class AdminCredit_assignmentService{

	private static Log logger = LogFactory.getLog(AdminCredit_assignmentService.class);
	
	@Resource(name="adminCredit_assignmentDao")
	private AdminCredit_assignmentDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getCredit_assignmentList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("c","credit_assignment");
		whereUtil.setAlias("b","borrow_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		baseService.compareNum("c.credit_money", whereUtil, pd, mv);
		
		//交易时间
		baseService.timeFrame("c.add_time", whereUtil, pd, mv);
		
		try{
			 list = thisDao.getCredit_assignmentList(conn, rp);
		} catch (Exception e) {
			logger.error("getCredit_assignmentList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public HashMap<String, Object> getCredit_assignment(PageData pd,String id) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> returnObj=new HashMap<>();
		HashMap<String, Object> list = null;
		try{
			 list = thisDao.getCredit_assignment(conn, id);
			 HashMap<String, String> vo = (HashMap<String, String>) list.get("data");
			 HashMap<String, Object> detailList = thisDao.getCredit_assignmentDetailList(conn,vo.get("detail_id")+"");
			 returnObj.put("vo", vo);
			 returnObj.put("list", detailList.get("data"));
		} catch (Exception e) {
			logger.error("getCredit_assignment失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return returnObj;
	}

	public String doedit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> data = null;
		String id = pd.post("id");
		HashMap<String, Object> updateMap=new HashMap<>();
		updateMap.put("id", id);
		updateMap.put("deal_info", pd.post("deal_info"));
		updateMap.put("deal_time", Tools.getLongTime());
		HttpSession session = pd.getRequest().getSession();
		HashMap<String, String> adminInfo= (HashMap<String, String>) session.getAttribute("AdminInfo");
		updateMap.put("deal_uid", adminInfo.get("id"));
		updateMap.put("status", pd.post("status"));
		if(!StringUtils.isBlank(pd.post("site_fee"))) updateMap.put("site_fee", pd.post("site_fee"));
		
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("deal_info","处理说明不能为空", !StringUtils.isBlank(updateMap.get("deal_info")+"")));
		if(!StringUtils.isBlank(pd.post("site_fee"))) validatorMap.add(Tools.buildValidatorObject("site_fee","手续费只能是数字", ValidatorUtil.isNumeric(updateMap.get("site_fee")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
	
		Map<String, String> oldCre = BaseDao.getOne("credit_assignment", Tools.BuildWhereMap("id", id, "="), "re_tran_id", conn);
		
		try{
			if(fieldCheck.size()==0){
				 BaseDao.update(conn, "credit_assignment", updateMap, null);
				// if("5".equals(updateMap.get("status"))){
					// HashMap<String, Object> ivMap=new HashMap<>();
					// ivMap.put("", value)
					// BaseDao.update(conn, "borrow_investor", updateMap, null);
				// }
					if(oldCre!=null&&DfMath.toIntValue(oldCre.get("re_tran_id"))>0){
						Map<String,Object> upcI = new HashMap<>();
						upcI.put("id", oldCre.get("re_tran_id"));
						if("1".equals(pd.post("status"))) upcI.put("status", "3");
						else upcI.put("status", pd.post("status"));
						BaseDao.update(conn, "credit_assignment_investor", upcI, null);
					}
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			logger.error("债权转让doedit更新失败", e);
			return "保存失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public HashMap<String, Object> getCredit_assignmentExcelList(PageData pd,
			ModelAndView mv) {
		pd = Tools.convertDollar(pd);

		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("l","user_moneylog");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		baseService.compareNum("l.affect_money", whereUtil, pd, mv);
		
		//交易时间
		baseService.timeFrame("l.add_time", whereUtil, pd, mv);
		
		try{
			 list = thisDao.getCredit_assignmentExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getCredit_assignmentList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	  
	
}












 


 

	

	

