package com.dfp2p.core.admin.Menu;

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
import com.dfp2p.core.admin.Nav.AdminNavService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminMenuController extends BaseAdminController {
	public String tplPath = "Menu";
	
	@Resource(name="adminMenuService")
	private AdminMenuService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getMenuList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView edit_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","开启");
		statusSelect.put("0","关闭");
		mv.addObject("statusSelect",statusSelect);
	
		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("1","权限认证+菜单");
		typeSelect.put("0","只作为菜单");
		mv.addObject("typeSelect",typeSelect);
		
		Map<String, String> parentid_Select = new LinkedHashMap<String,String>();
		parentid_Select.put("0", "请选择");
		mv.addObject("parentid_Select",parentid_Select);
		
		PageData pd = new PageData(request);
		
		Map<String,Object> data = thisService.add_Menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentid_Select.put(map.get("id"), map.get("name"));
		}
		
		HashMap<String, Object> data2 = thisService.getMenuById(pd, mv);

		mv.addObject("data", data2);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView list_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView add_parent(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView add_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","开启");
		statusSelect.put("0","关闭");
		mv.addObject("statusSelect",statusSelect);
	
		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("1","权限认证+菜单");
		typeSelect.put("0","只作为菜单");
		mv.addObject("typeSelect",typeSelect);
		
		
		Map<String, String> parentid_Select = new LinkedHashMap<String,String>();
		parentid_Select.put("", "请选择");
		mv.addObject("parentid_Select",parentid_Select);
		
		PageData pd = new PageData(request);
		String id = pd.get("id");
		if (id!=null)
			mv.addObject("this_id",id);
		Map<String,Object> data = thisService.add_Menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentid_Select.put(map.get("id"), map.get("name"));
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void addMenu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.addMenu(pd, mv);
		
		if (flag){
			Common.getCacheMenuList(true);
			ajaxmsg("操作成功","success",response);
		}else
			ajaxmsg("操作失败","fail",response);
	}	
	public void editMenu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.editMenu(pd, mv);
		
		if (flag){
			Common.getCacheMenuList(true);
			ajaxmsg("操作成功","success",response);
		}else
			ajaxmsg("操作失败","fail",response);
	}	
	public void deleteMenu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		HashMap<String,Object> delHashMap = new HashMap<>();
		delHashMap.put("id",pd.get("id"));
		boolean flag = thisService.deleteMenu(delHashMap, mv);
		
		if (flag){
			Common.getCacheMenuList(true);
			ajaxmsg(pd.get("id"),"success",response);
		}else
			ajaxmsg("操作失败","fail",response);
	}	
	
	public  void doEdit_sort_order(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.doEdit_sort_order(pd, mv);

		if (flag)
			ajaxmsg("操作成功","success",response);
		else
			ajaxmsg("操作失败","fail",response);
	}
}
