package com.dfp2p.core.admin.User_upload;

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

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.User_info.AdminUser_infoService;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminUser_uploadController extends BaseAdminController {
	public String tplPath = "User_upload";
	
	@Resource(name="adminUser_uploadService")
	private AdminUser_uploadService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	
		Map<String, Object> customerMap = thisService.getCustomerMap();
		mv.addObject("customerMap", customerMap);
		
		Map<String, Object> egroupMap = thisService.getEgroupMap();
		mv.addObject("egroupMap", egroupMap);
		
		Map<String, String> isVerifySelect = new LinkedHashMap<String,String>();
		isVerifySelect.put("", "所有");
		isVerifySelect.put("0", "待审核");
		isVerifySelect.put("1", "已审核");
		isVerifySelect.put("2", "未通过");
		mv.addObject("isVerifySelect",isVerifySelect);
		
		PageData pd = new PageData(request);
		Tools.printData(pd);
		
		HashMap<String, Object> list = thisService.getUploadList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	
	public ModelAndView user_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView editUser_upload(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.editUser_upload(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1", "是");
		statusSelect.put("2", "否");
		mv.addObject("statusSelect",statusSelect);
		
		Map<String, Object> egroupMap = thisService.getEgroupMap();
		mv.addObject("egroupMap", egroupMap);
		
		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getUploadList(pd, mv);
		
		if(list.get("data") !=null && ((List)list.get("data")).size()>0)
			mv.addObject("data", ((List)list.get("data")).get(0));
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView money_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView credit_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public void addEgroup(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = thisService.addEgroup(pd, mv);
		
		if (flag)
			ajaxmsg("添加成功","success", response);
		else
			ajaxmsg("添加失败","fail", response);
	}

	public ModelAndView egroup(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getEgroupList();
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView egroup_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getEgroupMap();
		
		mv.addObject("egroupMap", list);
		mv.addObject("id",pd.get("id"));
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView egroup_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, Object> egroupMap = thisService.getEgroupMap();
		mv.addObject("egroupMap", egroupMap);
		
		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getEgroupListById(pd,mv);
		Tools.printData(list);
		mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editEgroup(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String flag = thisService.editEgroup(pd, mv);
		
		if ("success".equals(flag))
			ajaxmsg("修改成功", "success", response);
		else
			ajaxmsg(flag, "fail", response);
	}
	public  void doEdit_sort_order(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.doEdit_sort_order(pd, mv);

		if (flag)
			ajaxmsg("排序成功", "success", response);
		else
			ajaxmsg("排序失败", "fail",  response);
	}
	public  void egroup_delete(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.do_delete_egroup(pd, mv);

		if (flag)
			ajaxmsg(pd.get("id"), "success", response);
		else
			ajaxmsg("删除失败", "fail",  response);
	}
	
	
}
