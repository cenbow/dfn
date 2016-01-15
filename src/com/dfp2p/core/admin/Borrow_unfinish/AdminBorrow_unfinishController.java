package com.dfp2p.core.admin.Borrow_unfinish;

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
import com.dfp2p.core.admin.Borrow_invite.AdminBorrow_inviteService;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;

@Controller
public class AdminBorrow_unfinishController extends BaseAdminController {
	public String tplPath = "Borrow_unfinish";
	
	@Resource(name="adminBorrow_unfinishService")
	private AdminBorrow_unfinishService thisService;
	
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
		
		HashMap<String, Object> list = thisService.getBorrow_unfinishList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
}
