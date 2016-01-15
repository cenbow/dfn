package com.dfp2p.core.admin.Tool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;

@Controller("adminTool")
public class ToolController extends BaseAdminController {
	public String tplPath = "Tool";
	
	public ModelAndView ad(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView plugin(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
		
	public ModelAndView slide_cat(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView slide(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	
	public ModelAndView backup(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView storage(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView link(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView oauthadmin(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
}
