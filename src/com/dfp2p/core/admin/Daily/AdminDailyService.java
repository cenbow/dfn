package com.dfp2p.core.admin.Daily;

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
import java.util.Map.Entry;

import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
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
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminDailyService")
public class AdminDailyService{

	private static Log logger = LogFactory.getLog(AdminDailyService.class);
	
	@Resource(name="adminDailyDao")
	private AdminDailyDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getDailyList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("f","financing");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		mv.addObject("defaultMap",defaultMap);
		
		//影响金额
		//baseService.compareNum("f.credit_money", whereUtil, pd, mv);
		
		//交易时间
		baseService.timeFrame("f.end_count_time", whereUtil, pd, mv);
		
		try{
			 list = thisDao.getDailyList(conn, rp);
		} catch (Exception e) {
			logger.error("getDailyList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public HashMap<String, String> getDaily(PageData pd,String id) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, String> vo=new HashMap<>();
		try{
			 HashMap<String, Object> list = thisDao.getDaily(conn, id);
			 vo = (HashMap<String, String>) list.get("data");
		} catch (Exception e) {
			logger.error("getDaily失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return vo;
	}

	public String doadd(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("financing");
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("product_name","产品名称不能为空", !StringUtils.isBlank(paramMap.get("product_name")+"")));
		validatorMap.add(Tools.buildValidatorObject("expect_interest_rate","年化利率只能是数字", ValidatorUtil.isNumeric(paramMap.get("expect_interest_rate")+"")));
		validatorMap.add(Tools.buildValidatorObject("product_money","产品总金额只能是整数", ValidatorUtil.isDigits(paramMap.get("product_money")+"")));
		validatorMap.add(Tools.buildValidatorObject("invest_min","起投金额只能是整数", ValidatorUtil.isDigits(paramMap.get("invest_min")+"")));
		validatorMap.add(Tools.buildValidatorObject("invest_min_duration","最小投标金额只能是整数", ValidatorUtil.isDigits(paramMap.get("invest_min_duration")+"")));
		validatorMap.add(Tools.buildValidatorObject("step_money","递增金额只能是整数", ValidatorUtil.isDigits(paramMap.get("step_money")+"")));
		validatorMap.add(Tools.buildValidatorObject("end_count_time","募集结束时间不能为空", !StringUtils.isBlank(paramMap.get("end_count_time")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		//注册时间
		paramMap.put("end_count_time", Tools.strToTime(paramMap.get("end_count_time")+""));

		
		//图片信息
		Map<String, Object> swfUploadImg = PageData.sortRequestMap(pd.post());
		Map<String, String> swfImgTypeList = (Map<String, String>) swfUploadImg.get("swfimgtype");
		HashMap<String, String> swfImgInfoList = (HashMap<String, String>) swfUploadImg.get("picinfo");
		HashMap<String, String> swfImgUrlList = (HashMap<String, String>) swfUploadImg.get("swfimglist");
		List<HashMap<String, String>>imgType_1= new ArrayList<>();
		if(swfImgTypeList!=null&&swfImgTypeList.size()>0){
			for( Entry<String, String> e : swfImgTypeList.entrySet())
			{
				    HashMap<String, String> thisImgInfo = new HashMap<>();
				  	String imgKey= e.getKey();
				  	String imgValue =e.getValue();
				  	thisImgInfo.put("img", swfImgUrlList.get(imgKey));
				  	thisImgInfo.put("info", swfImgInfoList.get(imgKey));
				  	imgType_1.add(thisImgInfo);
		    }
			paramMap.put("img_type_1", JSON.toJSONString(imgType_1));
		}
		
		//Tools.printData(pd);
		try{
			if(fieldCheck.size()==0){
				Long key = BaseDao.insert(conn, "financing", paramMap);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);
			}
			//return "success";
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("doadd失败", e);
			return "添加失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}

	
	public String doedit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> data = null;
		String id = pd.post("id");
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("financing");
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("product_name","产品名称不能为空", !StringUtils.isBlank(paramMap.get("product_name")+"")));
		validatorMap.add(Tools.buildValidatorObject("expect_interest_rate","年化利率只能是数字", ValidatorUtil.isNumeric(paramMap.get("expect_interest_rate")+"")));
		validatorMap.add(Tools.buildValidatorObject("product_money","产品总金额只能是整数", ValidatorUtil.isNumeric(paramMap.get("product_money")+"")));
		validatorMap.add(Tools.buildValidatorObject("invest_min","起投金额只能是整数", ValidatorUtil.isDigits(paramMap.get("invest_min")+"")));
		validatorMap.add(Tools.buildValidatorObject("invest_min_duration","最小投标金额只能是整数", ValidatorUtil.isDigits(paramMap.get("invest_min_duration")+"")));
		validatorMap.add(Tools.buildValidatorObject("step_money","递增金额只能是整数", ValidatorUtil.isDigits(paramMap.get("step_money")+"")));
		validatorMap.add(Tools.buildValidatorObject("end_count_time","募集结束时间不能为空", !StringUtils.isBlank(paramMap.get("end_count_time")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		//注册时间
		paramMap.put("end_count_time", Tools.strToTime(paramMap.get("end_count_time")+""));

		
		//图片信息
		Map<String, Object> swfUploadImg = PageData.sortRequestMap(pd.post());
		Map<String, String> swfImgTypeList = (Map<String, String>) swfUploadImg.get("swfimgtype");
		HashMap<String, String> swfImgInfoList = (HashMap<String, String>) swfUploadImg.get("picinfo");
		HashMap<String, String> swfImgUrlList = (HashMap<String, String>) swfUploadImg.get("swfimglist");
		List<HashMap<String, String>>imgType_1= new ArrayList<>();
		if(swfImgTypeList!=null&&swfImgTypeList.size()>0){
			for( Entry<String, String> e : swfImgTypeList.entrySet())
			{
				    HashMap<String, String> thisImgInfo = new HashMap<>();
				  	String imgKey= e.getKey();
				  	String imgValue =e.getValue();
				  	thisImgInfo.put("img", swfImgUrlList.get(imgKey));
				  	thisImgInfo.put("info", swfImgInfoList.get(imgKey));
				  	imgType_1.add(thisImgInfo);
		    }
			paramMap.put("img_type_1", JSON.toJSONString(imgType_1));
		}
		paramMap.put("id", id);
		try{
			if(fieldCheck.size()==0){
				 BaseDao.update(conn, "financing", paramMap, null);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			logger.error("doedit更新失败", e);
			return "修改失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public HashMap<String, Object> getDailyExcelList(PageData pd,
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
			 list = thisDao.getDailyExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getDailyList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}






	  
	
}












 


 

	

	

