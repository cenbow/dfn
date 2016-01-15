package com.dfp2p.core.admin.Agency_list;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminAgency_listController extends BaseAdminController {
	public String tplPath = "Agency_list";
	
	@Resource(name="adminAgency_listService")
	private AdminAgency_listService thisService;
	
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		 
		Map<String, String> roleSelect = new LinkedHashMap<String,String>();
		roleSelect.put("","所有权限");
		roleSelect.put("52","网站测试");
		roleSelect.put("51","所有权限");
		roleSelect.put("62","财务人员");
		roleSelect.put("54","客服经理");
		roleSelect.put("60","风控经理");
		roleSelect.put("58","运营经理");
		roleSelect.put("61","客服专员");
		mv.addObject("roleSelect",roleSelect);
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getAgency_list(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response,  mv);
	}
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		 
		Map<String, String> roleSelect = new LinkedHashMap<String,String>();
		roleSelect.put("","所有权限");
		roleSelect.put("52","网站测试");
		roleSelect.put("51","所有权限");
		roleSelect.put("62","财务人员");
		roleSelect.put("54","客服经理");
		roleSelect.put("60","风控经理");
		roleSelect.put("58","运营经理");
		roleSelect.put("61","客服专员");
		mv.addObject("roleSelect",roleSelect);
		
		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getAgency_list(pd, mv);
		if (list.get("data") != null && ((List)list.get("data")).size()>0)
			mv.addObject("data",(((List)list.get("data")).get(0)));
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editAgency_list(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.editAgency_list(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public void addAgency_list(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.addAgency_list(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public void delAgency_list(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.delAgency_list(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public ModelAndView add_menu(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		 
		Map<String, String> roleSelect = new LinkedHashMap<String,String>();
		roleSelect.put("","所有权限");
		roleSelect.put("52","网站测试");
		roleSelect.put("51","所有权限");
		roleSelect.put("62","财务人员");
		roleSelect.put("54","客服经理");
		roleSelect.put("60","风控经理");
		roleSelect.put("58","运营经理");
		roleSelect.put("61","客服专员");
		mv.addObject("roleSelect",roleSelect);
		return this.getTplView(request,response, tplPath, mv);
	}
	
}
