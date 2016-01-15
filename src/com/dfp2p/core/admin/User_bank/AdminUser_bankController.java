package com.dfp2p.core.admin.User_bank;

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
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminUser_bankController extends BaseAdminController {
	public String tplPath = "User_bank";
	
	@Resource(name="adminUser_bankService")
	private AdminUser_bankService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_bankList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView bank_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_bankExcelList(pd, mv);
		
		String[] arr = {"id","user_name","real_name","customer_name","idcard","bank_num","bank_name","bank_address","add_time","edit_time"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
