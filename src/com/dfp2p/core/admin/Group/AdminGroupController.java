package com.dfp2p.core.admin.Group;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.event.MenuListener;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminGroupController extends BaseAdminController {
	public String tplPath = "Group";
	@Resource(name="adminGroupService")
	private AdminGroupService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getRoleList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView list_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request, response, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","启用");
		statusSelect.put("0","禁用");
		mv.addObject("statusSelect",statusSelect);

		PageData pd = new PageData(request);
		
		Map<String, String> data = thisService.role_edit(pd, mv);

		ArrayList<String> hasMenu = new ArrayList<String>();
		hasMenu=(ArrayList<String>) JacksonUtil.objectFromJson(data.get("controller"));
		mv.addObject("hasMenu", hasMenu);
		mv.addObject("data", data);
		List<LinkedHashMap<String, Object>> MenuList = Common.getCacheMenuList(false);
		mv.addObject("menuList",MenuList);
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd =new PageData(request);
		List<LinkedHashMap<String, Object>> MenuList = Common.getCacheMenuList(false);
		
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","启用");
		statusSelect.put("0","禁用");
		mv.addObject("statusSelect",statusSelect);
		
		mv.addObject("menuList",MenuList);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void do_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.editGroup(pd,mv);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
	}
	
	public void do_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.addGroup(pd,mv);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg("添加成功","success", response);
		}	
	}
	
	public void do_delete(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.deleteGroup(pd,mv);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg(pd.get("id"),"success", response);
		}	
	}
}
