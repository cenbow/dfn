package com.dfp2p.core.admin.Security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller
public class AdminSecurityController extends BaseAdminController {
	public String tplPath = "Security";
	
	public ModelAndView filetest(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView filescan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
}
