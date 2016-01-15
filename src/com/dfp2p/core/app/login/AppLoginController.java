package com.dfp2p.core.app.login;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.baseController.BaseAppController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AppLoginController extends BaseAppController {
	public String tplPath = "Invest";
	
	@Resource(name="appLoginService")
	private AppLoginService thisService;
	@Resource(name="baseService")
	private BaseService baseService;
	public void dologin(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.getUser(pd,response);
		//boolean flag = map.get("user_pass").equals(user_pass);
		Map<String,String>  result = new HashMap<String,String>();
		//result.put("remoteHost","http://demo5.dfp2p.com/app");
		//result.put("remoteAPP","");
		//result.put("status","1");
		if (flag){
			result.put("status","1");
		}else{
			result.put("status","0");
			result.put("message", "密码有误");
		}
		ajaxmsg(result, response);
	}	 
}
