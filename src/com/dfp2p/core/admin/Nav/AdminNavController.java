package com.dfp2p.core.admin.Nav;

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
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminNavController extends BaseAdminController {
	public String tplPath = "Nav";
	
	@Resource(name="adminNavService")
	private AdminNavService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getNavList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public  ModelAndView doEdit_sort_order(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.doEdit_sort_order(pd, mv);

		mv.setViewName("forward:/adminNav/index.do");
		return mv;
	}
	
	public ModelAndView menu_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> is_OpenSelect = new LinkedHashMap<String,String>();
		is_OpenSelect.put("","请选择");
		is_OpenSelect.put("0","否");
		is_OpenSelect.put("1","是");
		mv.addObject("is_OpenSelect",is_OpenSelect);
		
		Map<String, String> parentId_Select = new LinkedHashMap<String,String>();
		parentId_Select.put("0", "顶级菜单");
		mv.addObject("parentId_Select",parentId_Select);
		
		PageData pd = new PageData(request);
		String id = pd.get("id");
		if (id!=null)
			mv.addObject("this_id",id);
		Map<String,Object> data = thisService.getNavSelectList(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentId_Select.put(map.get("id"), map.get("text"));
		}
			
		
		mv.addObject("data", data);
		
		return this.getTplView(request,response, tplPath, mv);
	}

	
	
	public void addNav(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.addNav(pd, mv);
		
		if (flag)
			ajaxmsg("添加成功","success", response);
		else
			ajaxmsg("添加失败","fail", response);
	}	
	public void editNav(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.editNav(pd, mv);
		
		if (flag)
			ajaxmsg("修改成功","success", response);
		else
			ajaxmsg("修改失败","fail",  response);
	}	
	
	
	public ModelAndView menu_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> is_OpenSelect = new LinkedHashMap<String,String>();
		is_OpenSelect.put("","请选择");
		is_OpenSelect.put("0","否");
		is_OpenSelect.put("1","是");
		mv.addObject("is_OpenSelect",is_OpenSelect);
		
		Map<String, String> parentId_Select = new LinkedHashMap<String,String>();
		parentId_Select.put("0", "顶级菜单");
		mv.addObject("parentId_Select",parentId_Select);
		
		PageData pd = new PageData(request);
		
		Map<String,Object> data = thisService.getNavSelectList(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentId_Select.put(map.get("id"), map.get("text"));
		}
			
		
		HashMap<String, Object> data2 = thisService.getNavById(pd, mv);
		Tools.printData(data2);
		mv.addObject("data", data2);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView index_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	 
	public void deleteNav(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.deleteNav(pd, mv);
		
		if (flag)
			ajaxmsg(pd.get("id"),"success", response);
		else
			ajaxmsg("删除失败","fail", response);
	}	
	
	
}
