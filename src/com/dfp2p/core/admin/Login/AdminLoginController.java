package com.dfp2p.core.admin.Login;

import java.util.Map;

import javax.annotation.Resource;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Logs.AdminLogsDao;
import com.dfp2p.core.admin.Logs.AdminLogsService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.util.PageData;

	@Controller
public class AdminLoginController extends BaseAdminController {
		public String tplPath = "Login";
		@Resource(name="adminLoginService")
		private AdminLoginService thisService;
		
		
		public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

			return this.getTplView(request,response, tplPath, mv);
		}
	
		public void dologin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
			PageData pd = new PageData(request);
			HttpSession session = request.getSession();
			String vcode= pd.post("code");
			if(vcode==null || !vcode.toLowerCase().equals(session.getAttribute("code"))) {
				ajaxmsg("验证码错误", "fail", response);
			}else{
				Map<String, String> userInfo = thisService.checkLogin(pd, mv);
				if(userInfo==null) ajaxmsg("用户名或者密码错误","fail", response);
				else{
					session.setAttribute("AdminInfo", userInfo);
					ajaxmsg(tplCommon.U("admin/index/index"), "success", response);
				}
			}
		}
		
		public void verifyCode(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			SiteVerifyCode(4,request, response);
		}
		
		public ModelAndView loginOut(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			HttpSession session = request.getSession();
			session.removeAttribute("AdminInfo");		
			return this.showTip(mv, "success", "3","已安全退出");
		}

}
