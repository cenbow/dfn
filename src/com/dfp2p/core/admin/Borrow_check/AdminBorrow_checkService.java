package com.dfp2p.core.admin.Borrow_check;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminBorrow_checkService")
public class AdminBorrow_checkService{

	private static Log logger = LogFactory.getLog(AdminBorrow_checkService.class);
	
	@Resource(name="adminBorrow_checkDao")
	private AdminBorrow_checkDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getBorrow_checkList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("bi","borrow_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);	
		whereUtil.getStringCondition("borrow_status", "0,10", "in");
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//注册时间
		baseService.timeFrame("bi.add_time", whereUtil, pd, mv);
		
		 
		//影响积分
		baseService.compareNum("bi.borrow_money", whereUtil, pd, mv);
		
		try{
			
			list = thisDao.getBorrow_checkList(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrow_checkList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}


	public Map<String, String> getBorrowInfo(PageData pd,ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();		
		rp.put("paramCondition",Tools.BuildWhereMap("b.id", pd.rqst("id"), "="));

		try{		
			list = thisDao.getBorrowInfo(conn, rp);
		} catch (Exception e) {
			logger.error("getBorrowInfo失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	public String editBorrow(PageData pd,Map<String, String>thisBorrowInfo) {
		//些标种相关信息
		Map<String, Object> borrowTypeConfig = (Map<String, Object>) ((Map<String, Object>)borrowAndInvest.getBorrowTypeConfig(thisBorrowInfo.get("borrow_type"))).get("borrow");		
		Connection conn = MySQL.getConnectionReadOnly(false);	
		String[] onlycanEditField = {"id","vouch_fee","investor_contract_id","xtype","can_auto","deposit_fee","borrow_fee","vouch_company_id","mortgage_id","collect_time","collect_day","borrow_pass","borrow_max","borrow_min","borrow_money","borrow_status","borrow_info","borrow_use","borrow_name","deal_info","start_time"};
		Map<String, Object> borrowInfoMap = pd.getFormHandlerCan("borrow_info",onlycanEditField);
				
		List<String> canEditStatus=Arrays.asList("1", "2", "10");
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("deal_info","处理说明不能为空", !StringUtils.isBlank(pd.post("deal_info")+"")));
		validatorMap.add(Tools.buildValidatorObject("borrow_status","处理状态不正确", canEditStatus.contains(borrowInfoMap.get("borrow_status")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	

		if(fieldCheck.size()>0) return fieldCheck.get(0);

		//密码标
		String password = borrowInfoMap.get("borrow_pass").toString();
		if(StringUtils.isBlank(password))		borrowInfoMap.remove("borrow_pass");
		else	borrowInfoMap.put("borrow_pass", borrowAndInvest.md5(password));
		
		//logger.info("############"+borrowInfoMap.get("start_time")+"");
		//预约标开标时间
		if(!Common.isBlankInMap(borrowInfoMap,"start_time")) borrowInfoMap.put("start_time", Tools.strToTime(borrowInfoMap.get("start_time")+""));
		//初审通过或者预发布
		if("2".equals(borrowInfoMap.get("borrow_status"))||"10".equals(borrowInfoMap.get("borrow_status"))){//初审通过
			borrowInfoMap.put("collect_time", Tools.strToTime(borrowInfoMap.get("collect_time")+""));
			//保证金
			String depositFeeRateString = (borrowTypeConfig!=null)?(String) ((Map<String, Object>)borrowTypeConfig.get("borrowFee")).get("deposit"):"5";
			double depositFeeRate = DfMath.s2div(depositFeeRateString, "100",9);
			double depositFee = DfMath.round((DfMath.s2multi(depositFeeRate+"", borrowInfoMap.get("borrow_money")+"")));
			borrowInfoMap.put("deposit_fee", depositFee);
		}else{
			borrowInfoMap.remove("collect_time");
		}
		//初审时间
		borrowInfoMap.put("check_time", Tools.getLongTime());
		if("10".equals(thisBorrowInfo.get("borrow_type"))){
			borrowInfoMap.put("deadline", Tools.timeAddMonth(DfMath.toIntValue(thisBorrowInfo.get("borrow_duration")), Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"))+""));
		}
	
		
		//附加表信息
		HashMap<String, Object> borrowAddInfo = new HashMap<>();
		Map<String, Object> swfUploadImg = PageData.sortRequestMap(pd.post());
		Map<String, String> swfImgTypeList = (Map<String, String>) swfUploadImg.get("swfimgtype");
		HashMap<String, String> swfImgInfoList = (HashMap<String, String>) swfUploadImg.get("picinfo");
		HashMap<String, String> swfImgUrlList = (HashMap<String, String>) swfUploadImg.get("swfimglist");
		List<HashMap<String, String>>imgType_1= new ArrayList<>();
		List<HashMap<String, String>>imgType_2= new ArrayList<>();
		if(swfImgTypeList!=null&&swfImgTypeList.size()>0){
			for( Entry<String, String> e : swfImgTypeList.entrySet())
			{
				    HashMap<String, String> thisImgInfo = new HashMap<>();
				  	String imgKey= e.getKey();
				  	String imgValue =e.getValue();
				  	thisImgInfo.put("img", swfImgUrlList.get(imgKey));
				  	thisImgInfo.put("info", swfImgInfoList.get(imgKey));
				  	if("1".equals(imgValue)) imgType_1.add(thisImgInfo);
				  	else if("2".equals(imgValue)) imgType_2.add(thisImgInfo);
		    }
			borrowAddInfo.put("img_type_1", JSON.toJSONString(imgType_1));
			borrowAddInfo.put("img_type_2", JSON.toJSONString(imgType_2));
		}
		borrowAddInfo.put("borrow_id", borrowInfoMap.get("id"));
		
		
		HashMap<String, String> AdminInfo = (HashMap<String, String>)Common.getSession("AdminInfo");
		//初审记录
		HashMap<String, Object> verifyLogMap = new HashMap<>();
		verifyLogMap.put("borrow_id", borrowInfoMap.get("id"));
		verifyLogMap.put("deal_info", pd.post("deal_info"));
		verifyLogMap.put("deal_user", AdminInfo.get("id"));
		verifyLogMap.put("deal_time", Tools.getLongTime());
		verifyLogMap.put("deal_status", borrowInfoMap.get("borrow_status"));
		
		try{
				thisDao.eidtBorrowInfo(conn,borrowInfoMap);
				if(borrowAddInfo.size()>1) BaseDao.update(conn, "borrow_addinfo", borrowAddInfo, null);
				thisDao.addVerify(conn,verifyLogMap);
				MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("borrow_check失败", e);
			return "数据修改失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	

	
}
