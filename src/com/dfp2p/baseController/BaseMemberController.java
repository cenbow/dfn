package com.dfp2p.baseController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.alibaba.fastjson.JSON;
import com.dfp2p.core.sysConfig;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

public class BaseMemberController extends MultiActionController{
	protected static Map<String, Object> _SiteInfo_=new HashMap<>();

	public String getTplPath(HttpServletRequest request, String mPath) {
		String actionName = "";
		MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
		try {
			actionName = methodNameResolver.getHandlerMethodName(request);
		} catch (NoSuchRequestHandlingMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String tplPath = "/Member/" + mPath + "/" + actionName;
		// System.out.print(tplPath);
		return tplPath;
	}

	
	public ModelAndView getTplView(HttpServletRequest request, HttpServletResponse response, String mPath, ModelAndView mv) {
		String actionName = "";
		MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
		try {
			actionName = methodNameResolver.getHandlerMethodName(request);
		} catch (NoSuchRequestHandlingMethodException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}

		//是否已登陆
		HttpSession session = request.getSession();
		Object userInfo= session.getAttribute("UserInfo");
		if(userInfo!=null){
			mv.addObject("_USERINFO_",userInfo);
		}		
		//页面表单属性
		if(mv.getModelMap().get("dfForm_class")==null)			mv.addObject("dfForm_class","member_myselect");
		if(mv.getModelMap().get("dfForm_style")==null)			mv.addObject("dfForm_style","width:100px;");
		if(mv.getModelMap().get("dfForm_others")==null)		mv.addObject("dfForm_others",""); 
		
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		//网站配置信息【模板】
		if(_SiteInfo_.size()==0){
			Map<String, Object> siteInfo = ConfigCache.getCacheList("cache_configIndex");		
			if (siteInfo != null){
				_SiteInfo_=siteInfo;
				mv.addObject("_siteInfo_", siteInfo);
			}
		}else{
			mv.addObject("_siteInfo_", _SiteInfo_);
		}
		
		//基础变量赋值
		mv.addObject("MemberStatics",WEB_ROOT+"/Statics/Member");
		mv.addObject("HomeStatics",WEB_ROOT+"/Statics/Home");
		mv.addObject("SiteStatics",WEB_ROOT+"/Statics/");
		mv.addObject("_WEB_ROOT_", WEB_ROOT);
		String tplPath = "/Member/" + mPath + "/" + actionName;
		mv.addObject("_thisUrl_","Member/" + mPath + "/");
//		System.out.println("tplPath="+tplPath);
		mv.setViewName(tplPath);
		return mv;
	}

	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg) {
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String jumpUrl = WEB_ROOT+"/";
		return this.showTip(mv, tipType, showSecond,msg, jumpUrl);
	}
	
	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg,String jumpUrl) {
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		HttpServletRequest request = this.getRequest();
		
		mv.addObject("MemberStatics",WEB_ROOT+"/Statics/Member/");
		mv.addObject("HomeStatics",WEB_ROOT+"/Statics/Home/");
		mv.addObject("SiteStatics",WEB_ROOT+"/Statics/");
		mv.addObject("_WEB_ROOT_", WEB_ROOT);
		mv.addObject("showSecond", showSecond);
		mv.addObject("jumpUrl", jumpUrl);
		mv.addObject("msg", msg);
		String tplPath = (Common.isMob(request))?"/Home/Common/tip_mob_"+tipType:"/Home/Common/tip_"+tipType;
		mv.setViewName(tplPath);
		return mv;
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void ajaxmsg(String msg,int status, HttpServletResponse response){
		HashMap<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("status", status);
		jsonMap.put("msg",msg);
		this.echoJson(jsonMap, response);
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
}
