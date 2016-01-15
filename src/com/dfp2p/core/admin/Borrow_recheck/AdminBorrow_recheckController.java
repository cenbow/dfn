package com.dfp2p.core.admin.Borrow_recheck;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Borrow_see.AdminBorrow_seeService;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.other.message.MessageManager;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AdminBorrow_recheckController extends BaseAdminController {
	public String tplPath = "Borrow_recheck";
	
	@Resource(name="adminBorrow_recheckService")
	private AdminBorrow_recheckService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
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
		
		HashMap<String, Object> list = thisService.getBorrow_recheckList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		Map<String, String> borrowInfo = thisService.getBorrowInfo(pd, mv);
		mv.addObject("data", borrowInfo);
	
		LinkedHashMap<String, String>borrowStatus =  new LinkedHashMap<>();
		borrowStatus.put("5", "否");
		borrowStatus.put("6", "是");
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
		if(borrowStatus!=4){
			ajaxmsg("此标已经处理过", "success", response);
			return ;
		}
		//复审同时提现,代付到卡
		WhereUtil mx=new WhereUtil();
		mx.getStringCondition("uid", borrowInfo.get("borrow_uid"));
		mx.getStringCondition("card_type", "q");
		Map<String, String> userCard = BaseService.getOne("user_banks", mx.getParamConditionList(), null);
		if(userCard==null){
			ajaxmsg("代付到卡提现前得先绑定快捷卡", "fail", response);
			return ;
		}
		
		
		String flag=thisService.editBorrow(pd,borrowInfo);
		if("success".equals(flag)){
			HashMap<String, String> parMap=new HashMap<>();
			parMap.put("borrow_id", pd.post("id"));
			if("6".equals(pd.post("borrow_status"))){
				MessageManager.sendNotifyMsg("recheck_success", parMap);
			}else{
				MessageManager.sendNotifyMsg("recheck_fail", parMap);
			}
			ajaxmsg("修改成功", "success", response);
		}else{
			ajaxmsg(flag, "fail", response);
		}
	}	

	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
}
