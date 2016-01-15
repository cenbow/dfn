package com.dfp2p.core.admin.BorrowType;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminBorrow_typeController extends BaseAdminController {
	public String tplPath = "Borrow_type";
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("1","是");
		vipSelect.put("0","不限制");
		mv.addObject("vipSelect",vipSelect);
		
		Map<String, String> phoneSelect = new LinkedHashMap<String,String>();		
		phoneSelect.put("1","是");
		phoneSelect.put("0","不限制");
		mv.addObject("phoneSelect",phoneSelect);
		
		Map<String, String> videoSelect = new LinkedHashMap<String,String>();
		videoSelect.put("1","是");
		videoSelect.put("0","不限制");
		mv.addObject("videoSelect",videoSelect);
		
		Map<String, String> faceSelect = new LinkedHashMap<String,String>();		
		faceSelect.put("1","是");
		faceSelect.put("0","不限制");
		mv.addObject("faceSelect",faceSelect);
		
		Map<String, String> realSelect = new LinkedHashMap<String,String>();
		realSelect.put("1","是");
		realSelect.put("0","不限制");
		mv.addObject("realSelect",realSelect);
		
		

		PageData pd = new PageData(request);
		String borrowTypeString = Common.firstLetterToUpper(pd.get("type").toLowerCase());
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList(borrowTypeString);
		mv.addObject("borrowType", borrowTypeString);
		if (list != null)		mv.addObject("data", list);
		mv= this.getTplView(request,response, tplPath, mv);
		String tmepletPath=sysConfig.getSysParm("webrootPath")+"/Template/"+"/Admin/Borrow_type/"+borrowTypeString;
		if(new File(tmepletPath).exists())  mv.setViewName("/Admin/Borrow_type/"+borrowTypeString);
		else mv.setViewName("/Admin/Borrow_type/DefaultType");
		return mv;
	}
	
	public void save(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		String borrowTypeString = Common.firstLetterToUpper(pd.post("borrowType").toLowerCase());
		//Tools.printData(PageData.sortRequestMap(pd.post()));
		
		boolean flag = ConfigCache.doEditCache(borrowTypeString,PageData.sortRequestMap(pd.post()));
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}

	public ModelAndView type(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		mv.addObject("borrowType", list);
		if (list != null)		mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void savetype(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);		
		boolean flag = ConfigCache.doEditCache("BorrowType",PageData.sortRequestMap(pd.post()));
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	
}
