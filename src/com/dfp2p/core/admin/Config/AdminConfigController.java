package com.dfp2p.core.admin.Config;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminConfigController extends BaseAdminController {
	public String tplPath = "Config";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String,Object> isClose_select = new LinkedHashMap<String, Object>();
		isClose_select.put("1", "是");
		isClose_select.put("0", "否");
		mv.addObject("isClose_select",isClose_select);
		
		Map<String, Object> list = ConfigCache.getCacheList("cache_configIndex");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editIndex(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_configIndex",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	
	public ModelAndView attach(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String,Object> waterShow_select = new LinkedHashMap<String, Object>();
		waterShow_select.put("yes", "是");
		waterShow_select.put("no", "否");
		mv.addObject("waterShow_select",waterShow_select);
		
		Map<String, Object> list = ConfigCache.getCacheList("cache_configAttach");
		if (list != null)
			mv.addObject("data", list);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editAttach(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		boolean flag = ConfigCache.doEditCache("cache_configAttach",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public ModelAndView email(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, Object> list = ConfigCache.getCacheList("cache_configEmail");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editEmail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_configEmail",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public ModelAndView borrow(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String,Object> editBank_select = new LinkedHashMap<String, Object>();
		editBank_select.put("yes", "允许");
		editBank_select.put("no", "不允许");
		mv.addObject("editBank_select",editBank_select);
		
		Map<String,Object> withdrawVerify_select = new LinkedHashMap<String, Object>();
		withdrawVerify_select.put("yes", "是");
		withdrawVerify_select.put("no", "否");
		mv.addObject("withdrawVerify_select",withdrawVerify_select);
		
		Map<String, Object> list = ConfigCache.getCacheList("cache_configBorrow");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editBorrow(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_configBorrow",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public ModelAndView changegroup(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, Object> list = ConfigCache.getCacheList("cache_configChangegroup");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editChangegroup(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_configChangegroup",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public ModelAndView sms(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, Object> list = ConfigCache.getCacheList("cache_configSms");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void editSms(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_configSms",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	
}
