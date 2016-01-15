package com.dfp2p.core.admin.Parameter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller
public class AdminParameterController extends BaseAdminController {
	public String tplPath = "Parameter";
	
	public ModelAndView bank(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView borrow_fee(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView cache_msgset(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView contract(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView level(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView mortgage_menuid(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView msg_email(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView msg_phone(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView msg_site(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView net_menuid(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView normal_menuid(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView pay(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView second_menuid(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView site_msg(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView sms_msg(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView vouch_menuid(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
}
