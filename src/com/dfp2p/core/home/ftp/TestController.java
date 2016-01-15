package com.dfp2p.core.home.ftp;

import java.security.MessageDigest;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class TestController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(TestController.class);
	
	protected PageData getThisPageData(HttpServletRequest request,HttpServletResponse response) {
		PageData pd = new PageData(request);
		return pd;
	}
	
	public  void index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws Exception {
/*		String cookieKey = "要地有f we257&*03！@#）（7s f fe#sf!@E$b";
		byte[] buffer = null;
        String stringToMd5 = ".dbxcf.com"; 
		try {
			MessageDigest md5=MessageDigest.getInstance("MD5");
			md5.update((stringToMd5+cookieKey).getBytes());  
    		buffer = md5.digest();
        } catch (Exception e) {
			//return usernameMD5;
		} 
	    StringBuffer sb = new StringBuffer(buffer.length * 2);  
	    for (int i = 0; i < buffer.length; i++) {  
	            sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));  
	            sb.append(Character.forDigit(buffer[i] & 15, 16));  
	      }  

	    
	    String md5Res = sb.toString();
		Cookie[] cookies = request.getCookies();
		String authString ="";
*/

		String cookieKey = "要地有f we257&*03！@#）（7s f fe#sf!@E$b";
		byte[] buffer = null;
        String stringToMd5 = ".rongsheng360.com"; 
		try {
			MessageDigest md5=MessageDigest.getInstance("MD5");
			md5.update((stringToMd5+cookieKey).getBytes());  
    		buffer = md5.digest();
        } catch (Exception e) {
			//return usernameMD5;
		} 
	    StringBuffer sb = new StringBuffer(buffer.length * 2);  
	    for (int i = 0; i < buffer.length; i++) {  
	            sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));  
	            sb.append(Character.forDigit(buffer[i] & 15, 16));  
	      }  

	    String md5Res = sb.toString();
		
		logger.debug("md5值："+md5Res);
		
		
		
	}
	
}
