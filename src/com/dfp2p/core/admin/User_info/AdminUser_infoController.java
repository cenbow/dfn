package com.dfp2p.core.admin.User_info;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.User_bank.AdminUser_bankService;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminUser_infoController extends BaseAdminController {
	public String tplPath = "User_info";
	
	@Resource(name="adminUser_infoService")
	private AdminUser_infoService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_infoList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView view(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		Map<String, Object> predata = thisService.getUser_info(pd, mv);
		Map<String, Object> data=null;
		data=(Map<String, Object>) (((List) predata.get("data")).get(0));
		if (data!=null && data.size()>0){
		if (predata.get("PHP_contact")!=null) {
			mv.addObject("contact", predata.get("PHP_contact"));
		}
		if (predata.get("PHP_department")!=null) {
			mv.addObject("department", predata.get("PHP_department"));
		}
		if (predata.get("PHP_financial")!=null) {
			mv.addObject("financial", predata.get("PHP_financial"));
		}
		if (predata.get("PHP_house")!=null) {
			mv.addObject("house", predata.get("PHP_house"));
		}
		if (predata.get("PHP_ensure")!=null) {
			mv.addObject("ensure", predata.get("PHP_ensure"));
		}
		mv.addObject("data",data);
		}
//		Tools.printData(((List)data.get("data")).get(0));
		Tools.printData(data);
		return this.getTplView(request, response, tplPath, mv);
	}
}
