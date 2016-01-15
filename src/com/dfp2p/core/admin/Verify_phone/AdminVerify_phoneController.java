package com.dfp2p.core.admin.Verify_phone;

import java.util.HashMap;
import java.util.LinkedHashMap;
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

@Controller
public class AdminVerify_phoneController extends BaseAdminController {
	public String tplPath = "Verify_phone";
	
	@Resource(name="adminVerify_phoneService")
	private AdminVerify_phoneService thisService;
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		
		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("","全部");
		vipSelect.put("1","是");
		vipSelect.put("0","否");
		mv.addObject("vipSelect",vipSelect);
		
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getVerify_phoneList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
}
