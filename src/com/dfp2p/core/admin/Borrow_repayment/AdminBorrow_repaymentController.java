package com.dfp2p.core.admin.Borrow_repayment;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Borrow_see.AdminBorrow_seeService;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminBorrow_repaymentController extends BaseAdminController {
	public String tplPath = "Borrow_repayment";
	
	@Resource(name="adminBorrow_repaymentService")
	private AdminBorrow_repaymentService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		Map<String, String> lastDaySelect = new LinkedHashMap<String,String>();
		lastDaySelect.put("0", "请选择还款日");
		for (int i = 1; i <= 31; i++) {
			if(i<10) lastDaySelect.put("0"+i, i+"日");
			else  lastDaySelect.put(i+"", i+"日");
		}
		mv.addObject("lastDaySelect",lastDaySelect);
		mv.addObject("current", Tools.getLongTime());
		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> borrow_typeMap = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "key", "borrow_name");
		mv.addObject("borrow_typeMap",borrow_typeMap);
		
		Map<String, String> repayment_typeMap = Interface.getRepaymentTypeMap();
		mv.addObject("repayment_typeMap",repayment_typeMap);
		
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getBorrow_repaymentList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

}
