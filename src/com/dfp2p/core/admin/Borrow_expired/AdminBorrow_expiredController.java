package com.dfp2p.core.admin.Borrow_expired;

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
import com.dfp2p.core.admin.Borrow_invite.AdminBorrow_inviteService;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminBorrow_expiredController extends BaseAdminController {
	public String tplPath = "Borrow_expired";
	
	@Resource(name="adminBorrow_expiredService")
	private AdminBorrow_expiredService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);

		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> borrow_typeMap = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "key", "borrow_name");
		mv.addObject("borrow_typeMap",borrow_typeMap);
		
		Map<String, String> repayment_typeMap = Interface.getRepaymentTypeMap();
		mv.addObject("repayment_typeMap",repayment_typeMap);
		
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getBorrow_expiredList(pd, mv);

		mv.addObject("list", list);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getBorrow_expiredExcelList(pd, mv);
		
		String[] arr = {"id","user_name","real_name","customer_name","borrow_name","sort_order","deadline","capital","interest","breakday","expired_money","call_fee","borrow_money"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
