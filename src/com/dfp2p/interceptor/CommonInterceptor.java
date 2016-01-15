package com.dfp2p.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.MysqlThreadConstant;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.TokenHandler;
import com.dfp2p.util.Tools;
import com.dfp2p.util.AuthCode.AuthCode;
import com.sun.mail.imap.protocol.UID;

public class CommonInterceptor implements HandlerInterceptor {
	
	@Resource(name="baseService")
	private BaseService baseService;
	private static Log logger = LogFactory.getLog(CommonInterceptor.class);
	private static final String CHARSET = "utf-8";
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		Connection oldConnection = MysqlThreadConstant.CURRENT_GET_CONNECTION.get();
		if(oldConnection!=null){
			try {
				logger.warn("有未关的connection:在ACTION最后关闭资源:"+oldConnection);
				if(oldConnection.getAutoCommit()!=true) MySQL.rollback(oldConnection);
				MySQL.closeConnection(oldConnection);
			} catch (Exception e) {
				logger.error("关闭老的connection失败:afterCompletion");
			}
		}
		
		logger.debug("Common最后执行！！！一般用于释放资源！！");

	}

	@Override
	public void postHandle(HttpServletRequest request,	HttpServletResponse response, Object handler,	ModelAndView modelAndView) throws Exception {
		if(modelAndView!=null){
			TokenHandler.generateTokenValue(request);
			logger.debug("CommonAction执行之后，生成视图之前执行！！"+modelAndView.getViewName() );
		}
		//return ;
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		request.setCharacterEncoding(CHARSET);
		response.setCharacterEncoding(CHARSET);
		response.setContentType("text/html; charset="+CHARSET);
		Common.getLics(response);
		Object obj_token = request.getParameter(TokenHandler.DEFAULT_TOKEN_NAME);
		if (obj_token != null && !"".equalsIgnoreCase((String)obj_token))
		{
			boolean flag = TokenHandler.validToken(request);
			if(!flag)
			{
				PrintWriter printWriter = null;
				logger.debug("提交表单，验证失败");
				try {
					printWriter = response.getWriter();
					printWriter.write("表单验证失败，请勿重复提交");
					printWriter.flush();
				} catch (IOException e) {
					//
				}finally{
					if(printWriter!=null)
						printWriter.close();
				}
				return false;
			}
		}
		
		//是否已登陆
		HttpSession session = request.getSession();
		Object userInfo= session.getAttribute("UserInfo");
		Cookie[] cookies = request.getCookies();

		if(userInfo==null&&cookies!=null){
			String authString ="";
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				String cookieName = cookie.getName();
				String cookieValue = cookie.getValue();
				logger.info(cookieName+"="+cookieValue+"|CK");
				if("usl".equals(cookieName)){
					authString = cookieValue;
					//break;
				}
			}
			//有cookie
			if(!"".equals(authString)){
				String cookieKey = "";
				Map<String, Object> cacheConfigSite = ConfigCache.getCacheList("cache_configIndex");
				if(cacheConfigSite!=null&&!Common.isBlankInMap(cacheConfigSite, "cookieKey"))  cookieKey=cacheConfigSite.get("cookieKey")+"";
				String uidString = AuthCode.authcodeDecode(authString, cookieKey);
				try{
					long uid = Long.valueOf(uidString); 
					if(uid>0){
						Connection conn = MySQL.getConnectionReadOnly(false);
						try{
							baseService.memberLogin(uid+"", conn, 0, response);
							MySQL.commit(conn);	
						}catch(Exception e){
							MySQL.rollback(conn);
						}finally{
							MySQL.closeConnection(conn);
						}
					}
				}catch(Exception e){
					Cookie cookie = new Cookie("usl", null);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					logger.error("解析COOKIEUID出错："+e.toString());
				}
			}
		}//判断是否已登陆
		logger.debug("Commonaction之前执行！！！");
		return true; // 继续执行action
	}

}
