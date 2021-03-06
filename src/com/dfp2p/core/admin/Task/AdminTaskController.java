package com.dfp2p.core.admin.Task;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller
public class AdminTaskController extends BaseAdminController {
	public String tplPath = "Task";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView index_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView add_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView exeaction(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}

	
	
}
