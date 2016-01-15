package com.dfp2p.other.message;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dfp2p.other.DfHttpClient;
import com.dfp2p.other.message.EmailSend.MailSenderInfo;
import com.dfp2p.other.message.EmailSend.SimpleMailSender;
import com.dfp2p.util.ConfigCache;

public class SendToEmail {
	private static Log logger = LogFactory.getLog(SendToEmail.class);
	public static boolean sendTplEmail(String email,String event,Map<String,String> map)
	{
		try {
			Map<String, Object> EmailTPL = (Map<String, Object>) ConfigCache.getCacheList("msg_email").get("msgEmail");
			String thisTpl = "";
			String title = "";
			String body = "";
			if(EmailTPL!=null&&EmailTPL.containsKey(event)){
				body=MessageManager.replaceHandler(((Map<String, String>)EmailTPL.get(event)).get("content")+"",map);
				title=MessageManager.replaceHandler(((Map<String, String>)EmailTPL.get(event)).get("title")+"",map);
			}
			String res = sendEmail(email,title,body);

			if("success".equalsIgnoreCase(res))	return true;
		} catch (Exception e) {
			logger.error("模板邮件发送失败"+e.toString());
		}  
		
		return false;
		
	}
	
	public static String sendEmail(String email,String title,String body) {
		Map<String, Object> emailConfig = ConfigCache.getCacheList("cache_configEmail");
		String smtpPort="";
		String smtpPassword="";
		String smtpServer="";
		String smtpUser="";
		if(emailConfig!=null){
			smtpUser=emailConfig.get("smtpUser")+"";
			smtpServer=emailConfig.get("smtpServer")+"";
			smtpPassword=emailConfig.get("smtpPassword")+"";
			smtpPort=emailConfig.get("smtpPort")+"";
		}
		MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost(smtpServer);    
	      mailInfo.setMailServerPort(smtpPort);    
	      mailInfo.setValidate(true);  
	      mailInfo.setUserName(smtpUser);    
	      mailInfo.setPassword(smtpPassword);//您的邮箱密码    
	      mailInfo.setFromAddress(smtpUser);    
	      mailInfo.setToAddress(email);    
	      mailInfo.setSubject(title);    
	      mailInfo.setContent(body);    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
	      boolean sendSuccess =  sms.sendHtmlMail(mailInfo);//发送文体格式    
	      //sms.sendHtmlMail(mailInfo);//发送html格式   
		if(sendSuccess) return "success";
		else return "fail";
	}
	
}
