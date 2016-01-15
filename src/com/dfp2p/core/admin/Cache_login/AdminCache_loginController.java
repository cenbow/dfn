package com.dfp2p.core.admin.Cache_login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller
public class AdminCache_loginController extends BaseAdminController {
	public String tplPath = "Cache_login";
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
}
