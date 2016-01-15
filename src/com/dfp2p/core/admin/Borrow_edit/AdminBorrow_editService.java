package com.dfp2p.core.admin.Borrow_edit;

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


@Service("adminBorrow_editService")
public class AdminBorrow_editService{

	private static Log logger = LogFactory.getLog(AdminBorrow_editService.class);
	
	@Resource(name="adminBorrow_editDao")
	private AdminBorrow_editDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	

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
		String[] onlycanEditField = {"id","vouch_fee","investor_contract_id","can_auto","vouch_company_id","mortgage_id","collect_time","collect_day","borrow_pass","borrow_max","borrow_info","borrow_use","borrow_name","deal_info","start_time"};
		Map<String, Object> borrowInfoMap = pd.getFormHandlerCan("borrow_info",onlycanEditField);
				
/*		List<String> canEditStatus=Arrays.asList("1", "2", "10");
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("deal_info","处理说明不能为空", !StringUtils.isBlank(pd.post("deal_info")+"")));
		validatorMap.add(Tools.buildValidatorObject("borrow_status","处理状态不正确", canEditStatus.contains(borrowInfoMap.get("borrow_status")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	

		if(fieldCheck.size()>0) return fieldCheck.get(0);
*/
		//密码标
		String password = borrowInfoMap.get("borrow_pass").toString();
		if(StringUtils.isBlank(password))		borrowInfoMap.remove("borrow_pass");
		else	borrowInfoMap.put("borrow_pass", borrowAndInvest.md5(password));
		
		//logger.info("############"+borrowInfoMap.get("start_time")+"");
		//预约标开标时间
		if(!Common.isBlankInMap(borrowInfoMap,"start_time")) borrowInfoMap.put("start_time", Tools.strToTime(borrowInfoMap.get("start_time")+""));
		//初审通过或者预发布
		borrowInfoMap.put("collect_time", Tools.strToTime(borrowInfoMap.get("collect_time")+""));

		
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
		try{
				thisDao.eidtBorrowInfo(conn,borrowInfoMap);
				if(borrowAddInfo.size()>1) BaseDao.update(conn, "borrow_addinfo", borrowAddInfo, null);
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
