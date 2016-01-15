package com.dfp2p.core.admin.Borrow_see;

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
import com.dfp2p.core.admin.User_credit.AdminUser_creditService;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminBorrow_seeController extends BaseAdminController {
	public String tplPath = "Borrow_see";
	
	@Resource(name="adminBorrow_seeService")
	private AdminBorrow_seeService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		Map<String, String> borrow_typeMap = new LinkedHashMap<String,String>();
		borrow_typeMap.put("1","信用标");
		borrow_typeMap.put("2","担保标");
		borrow_typeMap.put("3","秒还标");
		borrow_typeMap.put("4","净值标");
		borrow_typeMap.put("5","抵押标");
		borrow_typeMap.put("6","流转标");
		mv.addObject("borrow_typeMap",borrow_typeMap);
		
		Map<String, String> repayment_typeMap = new LinkedHashMap<String,String>();
		repayment_typeMap.put("1","按天到期还款");
		repayment_typeMap.put("2","按月分期还款");
		repayment_typeMap.put("3","按季分期还款");
		repayment_typeMap.put("4","每月还息到期还本");
		repayment_typeMap.put("5","一次性还款");
		mv.addObject("repayment_typeMap",repayment_typeMap);
		
		
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getBorrow_seeList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> borrow_typeMap = new LinkedHashMap<String,String>();
		borrow_typeMap.put("1","信用标");
		borrow_typeMap.put("2","担保标");
		borrow_typeMap.put("3","秒还标");
		borrow_typeMap.put("4","净值标");
		borrow_typeMap.put("5","抵押标");
		borrow_typeMap.put("6","流转标");
		mv.addObject("borrow_typeMap",borrow_typeMap);
		
		Map<String, String> repayment_typeMap = new LinkedHashMap<String,String>();
		repayment_typeMap.put("1","按天到期还款");
		repayment_typeMap.put("2","按月分期还款");
		repayment_typeMap.put("3","按季分期还款");
		repayment_typeMap.put("4","每月还息到期还本");
		repayment_typeMap.put("5","一次性还款");
		mv.addObject("repayment_typeMap",repayment_typeMap);
		
		Map<String, String> borrow_useMap = new LinkedHashMap<String,String>();
		borrow_useMap.put("1","短期周转");
		borrow_useMap.put("2","生意周转");
		borrow_useMap.put("3","生活周转");
		borrow_useMap.put("4","购物消费");
		borrow_useMap.put("5","不提现借款");
		borrow_useMap.put("6","创业借款");
		borrow_useMap.put("7","其它借款");
		mv.addObject("borrow_useMap",borrow_useMap);
		
		Map<String, String> isAutoMap = new LinkedHashMap<String,String>();
		isAutoMap.put("1","是");
		isAutoMap.put("0","否");
		mv.addObject("isAutoMap",isAutoMap);
		
		Map<String, String> isPassMap = new LinkedHashMap<String,String>();
		isPassMap.put("2","是");
		isPassMap.put("1","否");
		mv.addObject("isPassMap",isPassMap);
		
		
		
		 

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getBorrow_seeList(pd, mv);
		
		if(list.get("data") !=null && ((List)list.get("data")).size()>0)
			mv.addObject("data", ((List)list.get("data")).get(0));
		Tools.printData(((List)list.get("data")).get(0));
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView doEdit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		return this.getTplView(request,response, tplPath, mv);
	}
}
