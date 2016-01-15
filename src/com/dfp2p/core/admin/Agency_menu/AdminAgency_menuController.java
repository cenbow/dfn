package com.dfp2p.core.admin.Agency_menu;

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
public class AdminAgency_menuController extends BaseAdminController {
	public String tplPath = "Agency_menu";
	
	@Resource(name="adminAgency_menuService")
	private AdminAgency_menuService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getAgency_menuList(pd, mv);
		Tools.printData(list);
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		Map<String, String> is_showSelect = new LinkedHashMap<String,String>();
		is_showSelect.put("1", "显示");
		is_showSelect.put("0", "不显示");
		mv.addObject("is_showSelect",is_showSelect);
		
		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("1", "仅门店代理可见");
		typeSelect.put("2", "仅省级代理可见");
		typeSelect.put("0", "公共菜单");
		mv.addObject("typeSelect",typeSelect);
		
		
		Map<String, String> parentid_Select = new LinkedHashMap<String,String>();
		parentid_Select.put("", "请选择");
		mv.addObject("parentid_Select",parentid_Select);
		
		PageData pd = new PageData(request);
		
		String id = pd.get("id");
		if (id!=null)
			mv.addObject("this_id",id);
		Map<String,Object> data = thisService.add_menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentid_Select.put(map.get("id"), map.get("name"));
		}
			
		HashMap<String, Object> this_data = thisService.getAgency_menuById(pd, mv);
		
		mv.addObject("data", this_data);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView add_menu(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		Map<String, String> is_showSelect = new LinkedHashMap<String,String>();
		is_showSelect.put("1", "显示");
		is_showSelect.put("0", "不显示");
		mv.addObject("is_showSelect",is_showSelect);
		
		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("1", "仅门店代理可见");
		typeSelect.put("2", "仅省级代理可见");
		typeSelect.put("0", "公共菜单");
		mv.addObject("typeSelect",typeSelect);
		
		
		Map<String, String> parentid_Select = new LinkedHashMap<String,String>();
		parentid_Select.put("", "请选择");
		mv.addObject("parentid_Select",parentid_Select);
		
		PageData pd = new PageData(request);
		
		String id = pd.get("id");
		if (id!=null)
			mv.addObject("this_id",id);
		Map<String,Object> data = thisService.add_menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentid_Select.put(map.get("id"), map.get("name"));
		}
			
		 
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public  void doEdit_sort_order(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.doEdit_sort_order(pd, mv);

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public  void addAgency_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.addAgency_menu(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public  void editAgency_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.editAgency_menu(pd);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public  void delAgency_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.delAgency_menu(pd);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
}
