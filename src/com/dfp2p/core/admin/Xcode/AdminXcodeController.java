package com.dfp2p.core.admin.Xcode;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.Validate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;

@Controller
public class AdminXcodeController extends BaseAdminController {
	public String tplPath = "Xcode";
	
	@Resource(name="adminXcodeService")
	private AdminXcodeService thisService;
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	
		
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("","全部");
		statusSelect.put("1","有效");
		statusSelect.put("0","无效");
		mv.addObject("statusSelect",statusSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCodeList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request, response, mv);
	}
	public ModelAndView edit_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","有效");
		statusSelect.put("0","无效");
		mv.addObject("statusSelect",statusSelect);
		PageData pd = new PageData(request);
		
		Map<String, String> data = thisService.edit_page(pd, mv);
		mv.addObject("data", data);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void do_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		String flag = thisService.doEdit(pd);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag+"请检查推广码是否重复","fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
	}
	
	public ModelAndView xcode_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request, response, mv);
	}
	
	public void add_xcode(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.addXcode(pd);
		if (!"success".equals(flag))
		{
			ajaxmsg(flag+"请检查推广码是否重复","fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
	}
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getXcodeExcelList(pd, mv);
		
		String[] arr = {"id","user_name","xcode","add_time","expired_time","status","use_time","type"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
	
	 
}
