package com.dfp2p.interceptor;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.util.Tools;

public class MemberInterceptor implements HandlerInterceptor {
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("Member最后执行！！！一般用于释放资源！！");

	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("MemberAction执行之后，生成视图之前执行！！");
	}

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		System.out.println("Memberaction之前执行！！！");
		//是否已登陆
		HttpSession session = request.getSession();
		Object userInfo= session.getAttribute("UserInfo");
		
//		****************************
		MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
		String methodName = "";
		String controllerName = "";
		
		try {
			controllerName = handler.getClass().getSimpleName().replace("Controller", "").substring(5).toLowerCase();
			methodName = methodNameResolver.getHandlerMethodName(request).toLowerCase();
		} catch (NoSuchRequestHandlingMethodException e) {
			//TODO 权限菜单获取出错
			return false;
		}
//		****************************
		if(userInfo!=null){
			if(StringUtils.isBlank(((HashMap<String, String>)userInfo).get("third_uid"))){
				//response.sendRedirect(tplCommon.U("thirdparty/tpsend/register"));
				//return "forward:/order/add";
				return true;
			}else{
				return true;
			}
		}
		else if(methodName.equals("retemail"))
		{
			return true;
		}
		else{
			//String msgString = Tools.hrefEncode("对不起，您所在的用户组没有权限访问该页！");
			response.sendRedirect(tplCommon.U("home/login/index"));
			return false;
		}
		
	}

}
