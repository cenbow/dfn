package com.dfp2p.baseController;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import chinapnr.SecureLink;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.sina.MD5;
import com.dfp2p.util.sina.RSA;
import com.dfp2p.util.sina.Base64;

public class BaseThirdpartyController extends MultiActionController{
	protected static HashMap<String, String> MerInfo=new HashMap<>();
	protected static HashMap<String, String> ActionType=new HashMap<>();
	protected static HashMap<String, String> MerAccount=new HashMap<>();
	protected static HashMap<String, String> BankName=new HashMap<>();
	protected static int orderIdSN = 0;
	private static Log logger = LogFactory.getLog(BaseThirdpartyController.class);
	
	public String sinaUid(String uid) {
		return (uid.length()>8)?uid:"dfp2p"+uid;
	}
	public static String getActionTypeAlias(String type) {
		if(ActionType.size()==0){
			ActionType.put("create_activate_member", "1");
			ActionType.put("set_real_name", "2");
			ActionType.put("binding_verify", "3");
			ActionType.put("binding_bank_card", "4");
			ActionType.put("binding_bank_card_advance", "5");
			ActionType.put("unbinding_bank_card", "6");
			ActionType.put("query_balance", "7");
			ActionType.put("create_hosting_deposit", "8");
			ActionType.put("create_hosting_collect_trade", "9");
			ActionType.put("create_single_hosting_pay_trade", "10");
			ActionType.put("create_hosting_withdraw", "11");
			ActionType.put("create_p2p_hosting_borrowing_target", "12");
			ActionType.put("advance_hosting_pay", "13");
			ActionType.put("create_batch_hosting_pay_trade", "14");
			ActionType.put("query_account_details", "15");
			ActionType.put("create_hosting_refund", "16");
			ActionType.put("query_hosting_refund", "17");
			ActionType.put("create_single_hosting_pay_to_card_trade", "18");
			ActionType.put("create_hosting_transfer", "19");
			ActionType.put("unfreeze", "20");
			ActionType.put("accountInfo", "21");
			ActionType.put("creditAssign", "22");
		}
		return ((!Common.isBlankInMap(ActionType, type))?ActionType.get(type):"0");
	}
	
	public static HashMap<String, String> getRechargeStatus() {
		HashMap<String, String> rechargeStatusMap=new HashMap<>();
		rechargeStatusMap.put("SUCCESS", "1");
		rechargeStatusMap.put("PROCESSING", "0");
		rechargeStatusMap.put("FAILED", "3");
		return rechargeStatusMap;
	}
	
	public ModelAndView ckUser(HashMap<String, String> userInfo,String actionType,HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		if(userInfo==null) return showTip(mv, "error", "3", "请先登陆",tplCommon.U("home/login/index"));
		return null;
	}
	
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}

	public String getOrderId() {
		orderIdSN++;
		String orderID=Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyyMMddHHmmss")+Tools.getDoubleStrings(orderIdSN+"");
		return orderID;
	}
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/*输入json字符串*/
	public void echoJson (HashMap<String,Object> jsonMap, HttpServletResponse response) {
		String jsonString = JSON.toJSONString(jsonMap);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getOutputStream().write(jsonString.getBytes("UTF-8"));
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			logger.error("输出json出错");
		}
	}
	
	public void echo(String showString, HttpServletResponse response,boolean notEcho) {
		if(notEcho==true) return ;
		try {
			PageData pd = new PageData(getRequest());
			String echoValueString = (!StringUtils.isBlank(pd.rqst("OrdId")))?pd.rqst("OrdId"):pd.rqst("TrxId");
			if(!StringUtils.isBlank(pd.rqst("ProId"))) echoValueString= pd.rqst("ProId");
			showString = "RECV_ORD_ID_"+echoValueString;
			
			response.setContentType("text/html;charset=UTF-8");
			response.getOutputStream().write(showString.getBytes("UTF-8"));
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			logger.error("输出echo出错");
		}
	}

	
	public void ajaxmsg(String msg,int status, HttpServletResponse response){
		HashMap<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("status", status);
		jsonMap.put("msg",msg);
		this.echoJson(jsonMap, response);
		return ;
	}

	public void ajaxmsg(Object obj,HttpServletResponse response)
	{
		String json_result = "";
		if (obj != null)
			JSON.toJSONString(obj, true);
		json_result = JSON.toJSONString(obj);
		logger.info("AJAX JSON:  "+json_result+"");
		PrintWriter printWriter = null;
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			printWriter = response.getWriter();
			printWriter.write(json_result);
			printWriter.flush();
		} catch (IOException e) {
			logger.error("AJAX JSON: 失败",e);
		}finally{
			if(printWriter!=null)
				printWriter.close();
		}
	}

	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg) {
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String jumpUrl = WEB_ROOT+"/";
		return this.showTip(mv, tipType, showSecond,msg, jumpUrl);
	}

	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg,Connection conn) {
		MySQL.closeConnection(conn);
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String jumpUrl = WEB_ROOT+"/";
		return this.showTip(mv, tipType, showSecond,msg, jumpUrl);
	}

	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg,String jumpUrl) {
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		
		mv.addObject("MemberStatics",WEB_ROOT+"/Statics/Member/");
		mv.addObject("HomeStatics",WEB_ROOT+"/Statics/Home");
		mv.addObject("SiteStatics",WEB_ROOT+"/Statics/");
		mv.addObject("_WEB_ROOT_", WEB_ROOT);
		mv.addObject("showSecond", showSecond);
		mv.addObject("jumpUrl", jumpUrl);
		mv.addObject("msg", msg);
		String tplPath = "/Home/Common/tip_"+tipType;
		mv.setViewName(tplPath);
		return mv;
	}

	
	
	
	
	
	//托管相关
	protected String getReturnUrl(String type){
		HttpServletRequest Request = getRequest();
		String port=(Request.getLocalPort()==80)?"":":"+Request.getLocalPort();
		return "http://"+Request.getServerName()+port+tplCommon.U("thirdparty/Tpreturn/"+type);
	}
	
	protected String getNoticeUrl(String type){
		HttpServletRequest Request = getRequest();
		String port=(Request.getLocalPort()==80||Request.getLocalPort()==8080)?"":":"+Request.getLocalPort();
		return "http://"+Request.getServerName()+port+tplCommon.U("thirdparty/Tpnotice/"+type);
	}
	
	protected String getSubmitUrl(){
		return "https://gate.pay.sina.com.cn/mgs/gateway.do";//"http://mertest.chinapnr.com/muser/publicRequests";//
		//return "https://testgate.pay.sina.com.cn/mgs/gateway.do";
	}
	protected String getSubmitUrl(String type){
		//return "https://testgate.pay.sina.com.cn/mas/gateway.do";//"http://mertest.chinapnr.com/muser/publicRequests";//
		return "https://gate.pay.sina.com.cn/mas/gateway.do";
	}
	
	
	public String getMerAccountType(String type){
		if(MerAccount.size()==0){
				MerAccount.put("trans_out", "MDT000001");
				MerAccount.put("fee_in", "BASEDT");
				MerAccount.put("transfer_fee_in", "BASEDT");
				MerAccount.put("reward_out", "PAY");
				MerAccount.put("tran_gr_out", "MDT000001");
		}
		if(!Common.isBlankInMap(MerAccount, type))		return MerAccount.get(type);
		else return "MDT000001";
	}
	
	protected String getBankName(String type){
		if(BankName.size()==0){
			BankName.put("ABC ","农业银行");
			BankName.put("BCCB","北京银行");
			BankName.put("BJRCB","北京农商行");
			BankName.put("BOC","中国银行");
			BankName.put("BOS","上海银行");
			BankName.put("CBHB","渤海银行");
			BankName.put("CCB","建设银行");
			BankName.put("CCQTGB","重庆三峡银行");
			BankName.put("CEB","光大银行");
			BankName.put("CIB","兴业银行");
			BankName.put("CITIC","中信银行");
			BankName.put("CMB ","招商银行");
			BankName.put("CMBC","民生银行");
			BankName.put("COMM","交通银行");
			BankName.put("CSCB","长沙银行");
			BankName.put("CZB","浙商银行");
			BankName.put("CZCB","浙江稠州商业银行");
			BankName.put("GDB","广东发展银行");
			BankName.put("GNXS","广州市农信社");
			BankName.put("GZCB","广州市商业银行");
			BankName.put("HCCB","杭州银行");
			BankName.put("HKBCHINA","汉口银行");
			BankName.put("HSBANK ","徽商银行");
			BankName.put("HXB","华夏银行");
			BankName.put("ICBC","工商银行");
			BankName.put("NBCB","宁波银行");
			BankName.put("NJCB","南京银行");
			BankName.put("PSBC","中国邮储银行");
			BankName.put("SHRCB","上海农村商业银行");
			BankName.put("SNXS","深圳农村商业银行");
			BankName.put("SPDB","浦东发展银行");
			BankName.put("SXJS","晋城市商业银行");
			BankName.put("SZPAB","平安银行");
			BankName.put("UPOP","银联在线支付");
			BankName.put("WZCB","温州市商业银行");
		}
		if(!Common.isBlankInMap(BankName, type))		return BankName.get(type);
		else return type;
	}
	
	public static String getThirdPartyInfos(String type){
		if(MerInfo.size()==0){
			Map<String, Object> list = ConfigCache.getCacheList("cache_pay");
			if(list!=null){
				MerInfo = (HashMap<String, String>) list.get("chinapnr");
				MerInfo.put("CharSet", "utf-8");
				MerInfo.put("Version", "1.0");
				Tools.printData(MerInfo);
			}
		}
		if(!Common.isBlankInMap(MerInfo, type))		return MerInfo.get(type);
		else return "";
	}
	
	public String getThirdPartyInfo(String type){
		if(MerInfo.size()==0){
			Map<String, Object> list = ConfigCache.getCacheList("cache_pay");
			if(list!=null){
				MerInfo = (HashMap<String, String>) list.get("chinapnr");
				MerInfo.put("CharSet", "utf-8");
				MerInfo.put("Version", "1.0");
				Tools.printData(MerInfo);
			}
		}
		if(!Common.isBlankInMap(MerInfo, type))		return MerInfo.get(type);
		else return "";
	}
	
	
	protected HashMap<String, Object> LogInfoReturn(String actionType){
		HashMap<String, Object> resInfo = new HashMap<>();
		PageData pd = this.getPageData();
		boolean verifyRes = this.verifySign(actionType, pd);
		String resDes="";
		try {
			resDes = Tools.hrefDecode(pd.rqst("RespDesc"));
		} catch (UnsupportedEncodingException e1) {
			// TODO 自动生成的 catch 块
			resDes="解析失败";
		}
		
		if(verifyRes==false){
			resInfo.put("res", false);
			resInfo.put("info", "本地验签出错");
		}else{
			if("000".equals(pd.rqst("RespCode"))){
				resInfo.put("res", true);
				resInfo.put("info", "操作成功");
			}else if("999".equals(pd.rqst("RespCode"))){
				resInfo.put("res", true);
				resInfo.put("info", "操作成功,处理中");
			}else{
				resInfo.put("res", false);
				resInfo.put("info", resDes);
			}
		}
		return resInfo;
	}


	protected HashMap<String, String> MapObj2HasH(Map<String, Object>JO) {
		HashMap<String, String> rMap=new HashMap<>();
		for(Map.Entry<String, Object>entry:JO.entrySet()){
			rMap.put(entry.getKey(), entry.getValue()+"");
		}
		return rMap;
	}
	
	protected HashMap<String, Object> LogInfoSave(String actionType,Map<String, Object>jsonRes,String sendId){
		HashMap<String, String> xMap= new HashMap<>();
		boolean isBG=false;
		if(jsonRes==null){//异步通知
			xMap= new PageData(this.getRequest()).post();
			isBG=true;
		}else{
			xMap=this.MapObj2HasH(jsonRes);	
		}
		logger.info("LogInfoSave:"+actionType+"返s回数据:"+xMap);
		HashMap<String, Object> resInfo = new HashMap<>();
		boolean verifyRes =this.verifySign(actionType, xMap);
		//String sysKeyString = xMap.get("sign");
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> logVo= new HashMap<>();
		try {
			if(StringUtils.isBlank(sendId)){
				logVo=null;
			}else{
				DataSet logVoDataSet;
				if(isBG==true) {
					List<Object[]> smap = (xMap.containsKey("out_trade_no"))?Tools.BuildWhereMap("sign", xMap.get("out_trade_no"), "="):Tools.BuildWhereMap("sign", xMap.get("outer_trade_no"), "=");
					logVoDataSet = T.load("thirdparty_send", conn).W(smap).Lock().Q("id,uid,status,type,local_data");
				}
				else  logVoDataSet = T.load("thirdparty_send", conn).W(Tools.BuildWhereMap("id", sendId, "=")).Lock().Q("id,uid,status,type,local_data");
				logVo = BeanMapUtils.dataSetToListMap(logVoDataSet).get(0);
				logger.info("LOGVO^^^^^^^^^^^^^^^"+logVo);
			}
		} catch (Exception e) {
			logger.error("数据查询出错LogInfoSave"+e.toString());
			logVo = null;
		}
		
		HashMap<String, Object> saveLog = new HashMap<>();
		HashMap<String, Object> addLog = new HashMap<>();
		String resDes ="";
		try {
			resDes = xMap.get("response_message");
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			resDes="解析失败";
		}
		if(logVo==null){
			resInfo.put("res", false);
			resInfo.put("info", "数据有误");
		}else if(verifyRes==false){
			resInfo.put("res", false);
			resInfo.put("info", "本地签验出错");
			//保存日志
			saveLog.put("status", "2");
			addLog.put("log_info", "本地签验出错");
		}else{
			if("1".equals(logVo.get("status"))&&!canSecondDeal(actionType,conn)){
				resInfo.put("res", false);
				resInfo.put("info", "已处理过了，结果："+logVo.get("status"));
				resInfo.put("logVo", logVo);
				//保存日志
				saveLog.put("status", "1");
				addLog.put("log_info", "已处理过了，结果："+logVo.get("status"));
			}else{		
				if("APPLY_SUCCESS".equals(xMap.get("response_code"))){
					Tools.writeTxtFile(JSON.toJSONString(xMap),actionType+".txt");
					resInfo.put("res", true);
					resInfo.put("info", "二次处理操作成功");
					resInfo.put("logVo", logVo);
					//保存日志
					saveLog.put("status", "1");
					addLog.put("log_info", "成功:"+logVo.get("status"));
				}else if("SUCCESS".equals(xMap.get("deposit_status"))){//充值二次处理
					resInfo.put("res", true);
					resInfo.put("info", "二次处理操作成功");
					resInfo.put("logVo", logVo);
					//保存日志
					saveLog.put("status", "1");
					addLog.put("log_info", "成功:"+logVo.get("status"));
				}else if("SUCCESS".equals(xMap.get("withdraw_status"))){//提现二次处理
					resInfo.put("res", true);
					resInfo.put("info", "二次处理操作成功");
					resInfo.put("logVo", logVo);
					//保存日志
					saveLog.put("status", "1");
					addLog.put("log_info", "成功:"+logVo.get("status"));
				}else if("SUCCsssESS".equals(xMap.get("deposit_status"))){
					if("4".equals(logVo.get("status")))  resInfo.put("res", false);
					else resInfo.put("res", true);
					
					resInfo.put("info", "操作成功");
					resInfo.put("logVo", logVo);
					//保存日志
					saveLog.put("status", "4");
					addLog.put("log_info", "处理中");
				}else{
					resInfo.put("res", false);
					resInfo.put("info", resDes);
					//保存日志
					saveLog.put("status", "3");
					addLog.put("log_info", resDes);
				}
			}
		}
		if(logVo!=null){
			saveLog.put("id", logVo.get("id"));
			addLog.put("send_id", logVo.get("id"));
			addLog.put("uid", logVo.get("uid"));
			addLog.put("data", JSON.toJSONString(xMap));
			addLog.put("add_time", Tools.getLongTime());
			addLog.put("type", logVo.get("type"));
		}
		try {
			BaseDao.update(conn, "thirdparty_send", saveLog, null);
			BaseDao.insert(conn, "thirdparty_data", addLog);
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("返回日志保存出错"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
		return resInfo;
	}
	
	protected boolean canSecondDeal(String actionType,Connection conn) {
		boolean can=false;
		PageData pd = new PageData(this.getRequest());
		switch (actionType) {
		case "create_hosting_deposit"://充值
		{
			String rechargeS="1";
			try {
				DataSet ds= T.load("recharge", conn).W(Tools.BuildWhereMap("nid", pd.rqst("outer_trade_no"), "=")).Q("status");
				Map<String, String> rechargeInf = BeanMapUtils.dataSetToListMap(ds).get(0);
				rechargeS = rechargeInf.get("status");
			} catch (Exception e) {
				logger.error("create_hosting_deposit充值二次操作查询失败:"+e.toString());
			}
			if("0".equals(rechargeS)&&("SUCCESS".equals(pd.rqst("deposit_status"))||"FAILED".equals(pd.rqst("deposit_status")))) can=true;
		}
		break;
		case "create_hosting_withdraw"://提现
		{
			String withdrasS="0";
			try {
				DataSet ds= T.load("withdraw", conn).W(Tools.BuildWhereMap("t_tran_id", pd.rqst("outer_trade_no"), "=")).Q("withdraw_status");
				Map<String, String> withdrawInf = BeanMapUtils.dataSetToListMap(ds).get(0);
				withdrasS = withdrawInf.get("withdraw_status");
			} catch (Exception e) {
				logger.error("create_hosting_withdraw提现二次操作查询失败:"+e.toString());
			}
			if("1".equals(withdrasS)&&("SUCCESS".equals(pd.rqst("withdraw_status"))||"FAILED".equals(pd.rqst("withdraw_status")))) can=true;
		}
		break;
			
			default:
			break;
		}
		
		return can;
	}

	protected String getQueryStr(HashMap<String, String>signData, boolean encode) {
		//准备签名数据
        List<String> keys = new ArrayList<String>(signData.keySet());
        Collections.sort(keys);
        String prestr = "";
        String charset = signData.get("_input_charset");
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = signData.get(key);
            if("sign_type".equalsIgnoreCase(key)||"".equals(value)||"sign_version".equalsIgnoreCase(key)||"sign".equalsIgnoreCase(key)) continue;
            if (encode) {
                try {
                    value = URLEncoder.encode(URLEncoder.encode(value, charset),charset);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    logger.error("获取签名字符串出错");
                }
            }
           prestr = prestr + key + "=" + value + "&";
          }
        prestr=prestr.substring(0,prestr.length()-1);
        return prestr;
		
	}
	
	
	protected  String getSign(HashMap<String, String> signData){
		String MsgData=this.getQueryStr(signData, false);
		String signKey = this.getThirdPartyInfo("PubFile");
		String signValue;
		try {
			logger.info("SignStr:"+MsgData+"=Key:"+signKey);
			signValue = MD5.sign(MsgData, signKey, signData.get("_input_charset"));
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			signValue="";
			logger.equals("生成签名失败:"+MsgData);
		}
		return signValue;
	}
	

	protected String getSinaRas(String needEn_str) {
		byte[] needEn_byte = null;
		try {
			needEn_byte = RSA.encryptByPublicKey(needEn_str.getBytes("utf-8"),this.getThirdPartyInfo("PriFile"));
			logger.info("RAS加密信息:"+needEn_str+"=="+this.getThirdPartyInfo("PriFile"));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String base64_needEn_byte_encrypt = Base64.encode(needEn_byte);
		logger.info("RAS加密后:"+base64_needEn_byte_encrypt);
		return base64_needEn_byte_encrypt;
	}
	
	
	protected boolean verifySign(String type,HashMap<String, String>resData){
//		return true;
		String MsgData=this.getQueryStr(resData, false);
		boolean signRes;
		try {
			signRes = MD5.verify(MsgData, resData.get("sign"), this.getThirdPartyInfo("PubFile"), resData.get("_input_charset"));
			logger.info("验签字符串："+MsgData);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			signRes=false;
			logger.error("签名出错"+e.toString());
		}
		return signRes;
	}
	
	protected String getSysKey(String info) {
		info+="$#FRE$#TGDEFqw324324";
		return borrowAndInvest.md5(info);
	}
	
	protected Long logSend(HashMap<String, String>sendData,HashMap<String, String>localData,String actionType) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, Object>save=new HashMap<>();
		save.put("status","0");
		save.put("add_time",Tools.getLongTime());
		save.put("type",getActionTypeAlias(actionType));
		save.put("add_ip",Tools.getClientIp());
		save.put("sign",localData.get("OrdId"));
		save.put("uid",(!Common.isBlankInMap(userInfo, "id")?userInfo.get("id"):(!Common.isBlankInMap(localData, "_send_uid")?localData.get("_send_uid"):"0")));
		save.put("send_data",JSON.toJSONString(sendData));
		save.put("local_data",JSON.toJSONString(localData));
		save.put("nkey",(!Common.isBlankInMap(localData, "OrdId"))?localData.get("OrdId"):"");
		Long newid=0L;
		try {
			newid = BaseDao.insert(conn, "thirdparty_send", save);
			MySQL.commit(conn);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("第三方托管发送日志保存失败");
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}
		return newid;
	}
	
	
}
