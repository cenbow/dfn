package com.dfp2p.core.home.Register;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;

@Controller
public class RegisterController extends BaseHomeController {
	public String tplPath = "Register";
	@Resource(name="RegisterService")
	private RegisterService thisService;
	
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
		PageData pd = new PageData(request);
		if(!StringUtils.isBlank(pd.get("referrer"))&&ValidatorUtil.isDigits(pd.get("referrer"))&&pd.get("referrer").length()<10){
			mv.addObject("xcode", pd.get("referrer"));
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void doRegister(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		HttpSession session = request.getSession();
		String vcode= pd.post("vcode");
		if(vcode==null || !vcode.toLowerCase().equals(session.getAttribute("code"))) {
			ajaxmsg("验证码错误", 0, response);
		}else{
			String res = thisService.registerUser(pd,response);
			if("success".equals(res)){
				//绑定托管
				HashMap<String, String> userInfo = Common.getUserLoginInfo();
				ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
				HashMap<String, Object> bindRes = tpsetController.create_activate_member(request, response, userInfo.get("id"));
				if ("success".equals(bindRes.get("df_res"))) {
					Map<String, Object> upinfoMap=new HashMap<>();
					upinfoMap.put("id", userInfo.get("id"));
					upinfoMap.put("third_account", bindRes.get("ex_info"));
					thisService.updateUser(upinfoMap);
				}
				//绑定托管end
				ajaxmsg("注册成功",1, response);
			}
			else	ajaxmsg(res,0, response);
		}
	}
	
	public void verifyCode(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		SiteVerifyCode(4,request, response);
	}
}
