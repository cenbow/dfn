package com.dfp2p.core.home.Login;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.home.Register.RegisterService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class LoginController extends BaseHomeController {
	public String tplPath = "Login";
	@Resource(name="LoginService")
	private LoginService thisService;
	@Resource(name="RegisterService")
	private RegisterService regService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		Object userInfoMap =  Common.getSession("UserInfo");
		if(userInfoMap!=null){
			try {
				response.sendRedirect(sysConfig.getSysParm("webroot")+"/member");
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				//e.printStackTrace();
			}
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void doLogin(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HttpSession session = request.getSession();
		String vcode= pd.post("vcode");
		if(vcode==null || !vcode.toLowerCase().equals(session.getAttribute("code"))) {
			ajaxmsg("验证码错误", 0, response);
		}else{
			String res = thisService.checkLogin(pd,response);
			if("success".equals(res)){
				HashMap<String, String> userInfo = Common.getUserLoginInfo();
				if(StringUtils.isBlank(userInfo.get("third_uid"))){
					//绑定托管
					ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
					HashMap<String, Object> bindRes = tpsetController.create_activate_member(request, response, userInfo.get("id"));
					if ("success".equals(bindRes.get("df_res"))) {
						Map<String, Object> upinfoMap=new HashMap<>();
						upinfoMap.put("id", userInfo.get("id"));
						upinfoMap.put("third_account", bindRes.get("ex_info"));
						regService.updateUser(upinfoMap);
						session.setAttribute("third_uid", bindRes.get("ex_info"));
						session.setAttribute("third_account", bindRes.get("ex_info"));
					}
					//绑定托管end
				
				}
				ajaxmsg("登陆成功，跳转中...",1, response);
			}
			else	ajaxmsg(res,0, response);
		}
		
	}
	public void verifyCode(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		SiteVerifyCode(4,request, response);
	}
	
	public ModelAndView loginOut(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		HttpSession session = request.getSession();
		session.removeAttribute("UserInfo");		
		Cookie cookie = new Cookie("usl", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		return this.showTip(mv, "success", "3","已安全退出");
	}
	
}


