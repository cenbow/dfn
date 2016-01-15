package com.dfp2p.core.admin.Tip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.PageData;

@Controller
public class AdminTipController extends BaseAdminController {
	public String tplPath = "Tip";
	
	public ModelAndView success(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String msgString = pd.get("msg");
		mv.addObject("message", msgString);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView error(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String msgString = pd.get("msg");
		mv.addObject("message", msgString);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void ajaxmsg(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String msgString = pd.get("msg");
		mv.addObject("message", msgString);
		ajaxmsg(msgString, "success", response);
	}
	
}
