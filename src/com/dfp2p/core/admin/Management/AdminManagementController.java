package com.dfp2p.core.admin.Management;

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
import com.dfp2p.core.admin.Apply_video.AdminApply_videoService;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminManagementController extends BaseAdminController {
	public String tplPath = "Management";
	
	@Resource(name="adminManagementService")
	private AdminManagementService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		
		
		Map<String, String> iskfSelect = new LinkedHashMap<String,String>();
		iskfSelect.put("","全部");
		iskfSelect.put("0","否");
		iskfSelect.put("1","是");
		iskfSelect.put("2","推广员");
		mv.addObject("iskfSelect",iskfSelect);
		
		
		
		PageData pd = new PageData(request);
		 
		Map<String, String> roleSelect = thisService.getRoleList(pd, mv);
		roleSelect.put("", "请选择");
		mv.addObject("roleSelect",roleSelect);
		
		HashMap<String, Object> list = thisService.getManagementList(pd, mv);

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
		
		
		Map<String, String> iskfSelect = new LinkedHashMap<String,String>();
		iskfSelect.put("","全部");
		iskfSelect.put("1","是");
		iskfSelect.put("0","否");
		mv.addObject("iskfSelect",iskfSelect);
		
		 
		PageData pd = new PageData(request);
		Map<String, String> roleSelect = thisService.getRoleList(pd, mv);
		mv.addObject("roleSelect",roleSelect);

		HashMap<String, Object> list = thisService.getManagementList(pd, mv);
		Tools.printData(list);
		if (list.get("data") != null && ((List)list.get("data")).size()>0)
			mv.addObject("data",(((List)list.get("data")).get(0)));
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editManagement(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		String flag = thisService.editManagement(pd, mv);
		
		if ("success".equals(flag))
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg(flag, "fail", response);
	}
	public ModelAndView user_add(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		
		
		Map<String, String> iskfSelect = new LinkedHashMap<String,String>();
		iskfSelect.put("","全部");
		iskfSelect.put("1","是");
		iskfSelect.put("0","否");
		mv.addObject("iskfSelect",iskfSelect);
		
		PageData pd = new PageData(request);
		Map<String, String> roleSelect = thisService.getRoleList(pd, mv);
		mv.addObject("roleSelect",roleSelect);

		return this.getTplView(request,response, tplPath, mv);
	}
	public void addManagement(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String flag = thisService.addManagement(pd, mv);
		
		if ("success".equals(flag))
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg(flag, "fail", response);
	}
	public void delManagement(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> delMap= new HashMap<>();
		delMap.put("id", pd.get("id"));
		boolean flag = thisService.delManagement(delMap, mv);
		
		if (flag)
			ajaxmsg(pd.get("id"), "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	
	
	
}
