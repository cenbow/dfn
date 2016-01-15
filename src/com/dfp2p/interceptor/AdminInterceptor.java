package com.dfp2p.interceptor;

import java.lang.ProcessBuilder.Redirect;
import java.lang.ref.Reference;
import java.net.URI;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.Logger;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

public class AdminInterceptor implements HandlerInterceptor {
	private static Log logger = LogFactory.getLog(borrowAndInvest.class);
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("ADMIN最后执行！！！一般用于释放资源！！");

	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("ADMINAction执行之后，生成视图之前执行！！");
	}

	@SuppressWarnings("unused")
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		System.out.println("ADMINaction之前执行！！！");
		String methodName = "";
		String controllerName = "";
		MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
		

		
		try {
			controllerName = handler.getClass().getSimpleName().replace("Controller", "").substring(5).toLowerCase();
			methodName = methodNameResolver.getHandlerMethodName(request).toLowerCase();
		} catch (NoSuchRequestHandlingMethodException e) {
			//TODO 权限菜单获取出错
			return false;
		}

		//防止跨站攻击
		String ReferUrl = request.getHeader("referer");
		String referHost ="";
		if(ReferUrl!=null){
			URI referUri = new URI(ReferUrl);
			referHost = referUri.getHost();
		}else{
			referHost = "";
		}
		String currentHost = request.getServerName();
		String ReferRootDoamin = Tools.getRootDomain(referHost);
		String mainRootDoamin = Tools.getRootDomain(currentHost);
		if(ReferUrl!=null&&!"login".equals(controllerName)&&!mainRootDoamin.equals(ReferRootDoamin)){
			logger.error("校验不通过，来源网址："+ReferUrl);
			response.sendRedirect(tplCommon.U("admin/login/index"));
			return false;
		}
		//防止跨站攻击

		String adminRoleId = "0";
		//是否已登陆
		HttpSession session = request.getSession();
		Object adminInfo= session.getAttribute("AdminInfo");
		if(adminInfo!=null){
			adminRoleId = ((HashMap<String, String>)adminInfo).get("u_group_id");
		}else if(!"login".equals(controllerName)){
			response.sendRedirect(tplCommon.U("admin/login/index"));
			return false;
		}

		//判断免权限菜单
		HashMap<String, Object> method = Common.authPassport();
		if(method.containsKey(controllerName)){//如果是例外访问
			    if("1".equals(method.get(controllerName)+"")) return true;//整个模块例外
				HashMap<String, Object> methodHashMap = (HashMap<String, Object>) method.get(controllerName);
				if(methodHashMap.containsKey(methodName)&&"1".equals(methodHashMap.get(methodName))) return true;
		}
		
		//其他一切校验过了以后访问权限
		PageData pd = new PageData(request);
		boolean permissionRes = Common.getPermission(adminRoleId, "admin", controllerName, methodName, pd);
		//System.out.print("#######################################CTL:"+controllerName+"MTD:"+methodName+"RES:"+permissionRes);
		if(permissionRes) return true;// 继续执行action
		else{
			//return true;
			String msgString = Tools.hrefEncode("对不起，您所在的用户组没有权限访问该页！");
			response.sendRedirect(tplCommon.U("admin/tip/error")+"?msg="+msgString);
			return false; 
		}
	}

}
