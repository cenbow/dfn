package com.dfp2p.core.thirdparty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.mrbean.BeanUtil;
import org.springframework.orm.hibernate3.LocalDataSourceConnectionProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseThirdpartyController;
import com.dfp2p.core.home.Borrow.BorrowController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.other.DfHttpClient;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.lowagie.text.xml.xmp.PdfA1Schema;
import com.mchange.v1.db.sql.DriverManagerDataSource.DmdsObjectFactory;
import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

@Controller
public class ThirdpartyTpqueryController extends BaseThirdpartyController {
	private static Log logger = LogFactory.getLog(ThirdpartyTpqueryController.class);
	
	public HashMap<String, Object> query_balance(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "query_balance";
/*		BASIC	基本户
		ENSURE	保证金户
		RESERVE	准备金
		SAVING_POT	存钱罐*/
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",this.sinaUid(userInfo.get("id")));
		submitdata.put("identity_type","UID");
		submitdata.put("account_type",userInfo.get("account_type"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		Map<String, Object> resJson = JSON.parseObject(httpRes.get("jsonStr"));
		resMap.put("ex_account_money", resJson.get("available_balance"));
		
		return resMap;
	}
	public HashMap<String, Object> query_account_details(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "query_account_details";
/*		BASIC	基本户
		ENSURE	保证金户
		RESERVE	准备金
		SAVING_POT	存钱罐*/
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",sinaUid(userInfo.get("id")));
		submitdata.put("identity_type","UID");
		submitdata.put("account_type",userInfo.get("account_type"));
		submitdata.put("start_time", userInfo.get("start_time"));
		submitdata.put("end_time", userInfo.get("end_time"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		
		return resMap;
	}
		
	public HashMap<String, Object> query_hosting_refund(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "query_hosting_refund";
/*		BASIC	基本户
		ENSURE	保证金户
		RESERVE	准备金
		SAVING_POT	存钱罐*/
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",sinaUid(userInfo.get("id")));
		submitdata.put("identity_type","UID");
//		submitdata.put("account_type",userInfo.get("account_type"));
		submitdata.put("start_time", userInfo.get("start_time"));
		submitdata.put("end_time", userInfo.get("end_time"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}
		
	private HashMap<String, Object> dealRes(String actionType,HashMap<String, String>httpRes) {
		HashMap<String, Object> resMap=  new HashMap<>();
		if("success".equals(httpRes.get("df_res"))){
			Map<String, Object> jsonCacheData= new HashMap<>();
			jsonCacheData = JSON.parseObject(httpRes.get("jsonStr"));
			HashMap<String, Object> logRes = this.LogInfoSave(actionType,jsonCacheData,httpRes.get("send_id"));
			resMap.put("send_id", httpRes.get("send_id"));
			if((boolean)logRes.get("res")==false){
				resMap.put("df_res", "error");
				resMap.put("df_msg", logRes.get("info"));
			}else{
				resMap.put("df_res", "success");
				resMap.put("df_msg", "成功");
				resMap.put("df_logVo", logRes.get("logVo"));
				resMap.put("df_responseVo", httpRes);
			}
		}else{
			resMap.put("df_res", "error");
			resMap.put("df_msg", httpRes.get("df_msg"));
			resMap.put("http_info", httpRes.get("http_info"));
		}
		return resMap;
	}
	
	private HashMap<String, String> create(String actionType,HashMap<String, String> submitData,HashMap<String, String> localData) {
		HashMap<String, String>	resMap = new HashMap<>();
		List<String> orderMap=Arrays.asList("query_hosting_refund");
		String Url = (orderMap.contains(actionType))?this.getSubmitUrl(actionType):this.getSubmitUrl();
		
		submitData.put("service", actionType);
		submitData.put("request_time", Tools.TimeStamp2Date(Tools.getLongTime()+"","yyyyMMddHHmmss"));
		submitData.put("partner_id", this.getThirdPartyInfo("MerCustId"));
		submitData.put("_input_charset",  this.getThirdPartyInfo("CharSet"));
		submitData.put("sign_type",  "MD5");
		submitData.put("sign",this.getSign(submitData));
		logger.info("提交的SUBMIT数据ＹＬＫ：：：："+submitData);
		
		String responseHtml = DfHttpClient.doPost(Url,submitData);
		try {
			responseHtml = Tools.hrefDecode(responseHtml);
			resMap.put("jsonStr", responseHtml);
			resMap.put("df_res", "success");
			logger.info("新浪接口返回文本:"+responseHtml);
		} catch (Exception e) {
			resMap.put("df_res", "error");
			resMap.put("df_msg", "http请求获取内容有误");
			resMap.put("http_info", responseHtml);
			logger.error("返回数据URLDECODE解析出错"+e.toString());
		}
		if(localData==null) localData=new HashMap<>();
		if(!localData.containsKey("OrdId")){
			if(submitData.containsKey("out_trade_no")) localData.put("OrdId", submitData.get("out_trade_no"));
			else localData.put("OrdId", this.getOrderId());
		}
		long sendID = this.logSend(submitData, localData, actionType);
		resMap.put("send_id", sendID+"");	
		return resMap;
	}

}
