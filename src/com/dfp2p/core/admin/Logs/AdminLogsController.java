package com.dfp2p.core.admin.Logs;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Management.AdminManagementService;
import com.dfp2p.util.PageData;

@Controller
public class AdminLogsController extends BaseAdminController {
	@Resource(name="adminLogsService")
	private AdminLogsService thisService;
	public String tplPath = "Logs";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> List = thisService.getLogsList(pd, mv);
		mv.addObject("List",List);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView loginlog(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> List = thisService.getLoginLogsList(pd, mv);
		mv.addObject("List",List);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView loginlog_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return loginlog(request,response, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
}
