package com.dfp2p.core.admin.Borrow_invite;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.admin.Borrow_check.AdminBorrow_checkController;
import com.dfp2p.core.admin.Borrow_see.AdminBorrow_seeService;

import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminBorrow_inviteController extends BaseAdminController {
	public String tplPath = "Borrow_invite";
	private static Log logger = LogFactory.getLog(AdminBorrow_inviteController.class);
	
	@Resource(name="adminBorrow_inviteService")
	private AdminBorrow_inviteService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		mv.addObject("currentTime", Tools.getLongTime());

		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> borrow_typeMap = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "key", "borrow_name");
		mv.addObject("borrow_typeMap",borrow_typeMap);
		
		Map<String, String> repayment_typeMap = Interface.getRepaymentTypeMap();
		mv.addObject("repayment_typeMap",repayment_typeMap);
		
		
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getBorrow_inviteList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.index(request, response, mv);
	}
	public ModelAndView menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		Map<String, String> borrowInfo = thisService.getBorrowInfo(pd, mv);
		borrowInfo.put("collect_time", Tools.TimeStamp2Date(borrowInfo.get("collect_time"), "yyyy-MM-dd HH:mm:ss"));
		mv.addObject("data", borrowInfo);
	
		LinkedHashMap<String, String>borrowStatus =  new LinkedHashMap<>();
		borrowStatus.put("2", "招标中");
		borrowStatus.put("3", "流标");
		mv.addObject("borrowStatus", borrowStatus);

		//些标种相关信息
		Map<String, Object> borrowTypeConfig = borrowAndInvest.getBorrowTypeConfig(borrowInfo.get("borrow_type"));		
		mv.addObject("borrow_use", Common.buildNewKVMap((Map<String, Object>) borrowTypeConfig.get("yt"), "key", "borrowUse"));
		mv.addObject("repaymentType", Interface.getRepaymentTypeMap());
		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> borrowTypeName = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "key", "borrow_name");
		mv.addObject("borrowType", borrowTypeName);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void do_edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		Map<String, String> borrowInfo = thisService.getBorrowInfo(pd, mv);
		int borrowStatus = Integer.valueOf(borrowInfo.get("borrow_status"));
		if(borrowStatus!=2){
			ajaxmsg("此标已经处理过", "success", response);
			return ;
		}
		String flag=thisService.editBorrow(pd,borrowInfo);
		if("success".equals(flag)){
			ajaxmsg("修改成功", "success", response);
		}else{
			ajaxmsg(flag, "fail", response);
		}
	}	
}
