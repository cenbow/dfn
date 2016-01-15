package com.dfp2p.core.admin.capital_all;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller
public class AdminCapital_allController extends BaseAdminController {
	public String tplPath = "Capital_all";
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
}
