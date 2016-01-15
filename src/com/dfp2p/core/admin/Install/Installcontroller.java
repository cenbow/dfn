package com.dfp2p.core.admin.Install;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller("adminInstall")
public class Installcontroller extends BaseAdminController {
	public String tplPath = "Install";

	public ModelAndView maileractive(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView site(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
		
	public ModelAndView userinfo(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
}
