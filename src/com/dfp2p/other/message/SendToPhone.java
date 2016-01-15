package com.dfp2p.other.message;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dfp2p.other.DfHttpClient;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.Tools;

public class SendToPhone {
	private static Log logger = LogFactory.getLog(SendToPhone.class);
	public static boolean sendTplText(String mobile,String event,Map<String,String> map)
	{
		try {
			Map<String, Object> PhoneTPL = (Map<String, Object>) ConfigCache.getCacheList("msg_phone").get("msgPhone");
			String thisTpl = "";
			String sendText = "";
			if(PhoneTPL!=null&&PhoneTPL.containsKey(event)) thisTpl=PhoneTPL.get(event)+"";
			
			sendText =  MessageManager.replaceHandler(thisTpl, map);
			


			String res = sendSMS(sendText,mobile);

			if("success".equalsIgnoreCase(res))	return true;
		} catch (Exception e) {
			logger.error("模板短信发送失败"+e.toString());
		}  
		
		return false;
		
	}
	
	public static String sendSMS(String content,String mob) {
		Map<String, Object> smsConfig = ConfigCache.getCacheList("cache_configSms");
		String userNameString="";
		String passString="";
		String signString="";
		if(smsConfig!=null){
			userNameString=smsConfig.get("smsUser")+"";
			passString=smsConfig.get("smsPass")+"";
			signString=smsConfig.get("sign")+"";
		}
		
		String Url = "http://q.hl95.com:8061/";
		HashMap<String, String> submitData=new HashMap<>();
		submitData.put("username", userNameString);
		submitData.put("password", passString);
		submitData.put("subcode", "");
		submitData.put("epid", "120652");
		submitData.put("linkid", "");
		try {
			content = new String(content.getBytes("GB2312"),"GB2312");
			logger.debug("短信内容:"+content);
			submitData.put("message", Tools.hrefDecode(content));
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			submitData.put("message", "error");
		}
		submitData.put("phone", mob);
	
		String responseHtml = DfHttpClient.doPost(Url,submitData,"GB2312");
		logger.debug("短信返回内容"+responseHtml);
		//String[] responseHtmls = responseHtml.split(",");
		if("00".equals(responseHtml)) return "success";
		else return "fail";
	}
	
}
