package com.dfp2p.core.app.register;

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
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AppRegisterController extends BaseAppController {
	public String tplPath = "Register";
	
	@Resource(name="appRegisterService")
	private AppRegisterService thisService;
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	public void dologin(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	
		PageData pd = new PageData(request);
		if(StringUtils.isBlank(pd.rqst("user_name"))) ajaxmsg("用户名不能为空","0",response);
		else	if(StringUtils.isBlank(pd.rqst("pass_word"))) ajaxmsg("密码不能为空","0",response);
		else	if(StringUtils.isBlank(pd.rqst("user_phone"))) ajaxmsg("手机不能为空","0",response);
		else
		{
			String userCK = ckuser(request, response);
			String phoneCK = ckphone(request, response);
			String verifyphoneCK = verifyphone(request, response);
			if(!"success".equals(userCK)) ajaxmsg(userCK,"0",response);
			else if(!"success".equals(phoneCK))  ajaxmsg(phoneCK,"0",response);
			else if(!"success".equals(verifyphoneCK))  ajaxmsg(verifyphoneCK,"0",response);
			else{
				Map<String, Object> data = new HashMap<String,Object>();
				data.put("user_name", pd.rqst("user_name"));
				data.put("user_phone", pd.rqst("user_phone"));
				data.put("user_pass", pd.rqst("pass_word"));
				data.put("reg_time",Tools.getLongTime());
				data.put("reg_ip",Tools.getClientIp());

				String flag = thisService.addUserAndUserVerify(pd,data,response);
			    if("success".equals(flag))
				{
						 ajaxmsg("注册成功","1",response);
			    }
			   else		ajaxmsg(flag,"0",response);
			}
		}
		
	}
	
	public String ckuser(HttpServletRequest request,HttpServletResponse response) {
		PageData pd = new PageData(request);
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("user_name", pd.post("user_name"));
		Map<String, String> map = thisService.ckuser(pd,mapUtil);
		if(map==null) return "success"; 
		else return "用户名已被人使用";
	}
	public String ckphone(HttpServletRequest request,HttpServletResponse response) {
		PageData pd = new PageData(request);
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("user_phone", pd.post("user_phone"));
		Map<String, String> map = thisService.ckuser(pd,mapUtil);
		if(map==null) return "success"; 
		else return "手机已被人使用";
	}
	public String verifyphone(HttpServletRequest request,HttpServletResponse response) {
		PageData pd = new PageData(request);
		String flag = borrowAndInvest.is_verify(pd.post("user_phone"), pd.post("phone_code"), "1", false);
		if (StringUtils.isBlank(flag)) return "手机验证码不对，请重新输入！";
		else return "success";
	}
	
	public void sendphone(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("user_phone", pd.get("cellphone"));
		Map<String, String> map = thisService.ckuser(pd,mapUtil);
		if(map==null){
			String Code = borrowAndInvest.rand_string(pd.get("cellphone"), "1", 1, 6);
			boolean flag = false;
			if(!"_fail".equals(Code)){
				Map<String,Object> config_map = new HashMap<String,Object>();
				config_map.put("#UserName#", "新注册用户");
				config_map.put("#scode#", Code);
				
				Map<String, Object> list = ConfigCache.getCacheList("msg_phone");
				if (list != null)
				{
					String content = ((Map<String, Object>) list.get("msgPhone")).get("verify")+"";
					//flag =SendToPhone.sendText(pd.get("cellphone"), content, config_map);
					flag=true;
				}
			}
			
			if(flag){
				ajaxmsg("短信验证码发送成功，请注意查收"+Code,"1",response);
			}
			else ajaxmsg("验证码发送失败，请重试"+Code,"0",response);
		}
		else ajaxmsg("此手机号已被人使用，请使用别的手机号", "0", response);
	}
	
	 
}
