package com.dfp2p.core.app.about;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.baseController.BaseAppController;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DfMath;

 

@Controller
public class AppAboutController extends BaseAppController {
	public String tplPath = "About";
	
	 
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		mv.addObject("jumpUrl", "http://www.baidu.com");
		mv.addObject("msg", "恭喜注册成功");
		return this.getTplView(request,response, tplPath, mv);
	}
	
	 
	 
}
