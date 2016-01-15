package com.dfp2p.core.admin.Sms_msg;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.util.PageData;

@Controller
public class AdminSms_msgController extends BaseAdminController {
	public String tplPath = "Sms_msg";
	
	@Resource(name="adminSms_msgService")
	private AdminSms_msgService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getSms_msgList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
}
