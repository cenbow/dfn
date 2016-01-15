package com.dfp2p.core.admin.Recharge;

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
import com.dfp2p.core.admin.Nav.AdminNavService;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminRechargeController extends BaseAdminController {
	public String tplPath = "Recharge";
	
	@Resource(name="adminRechargeService")
	private AdminRechargeService thisService;
	
 
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("","所有");
		statusSelect.put("0","充值未完成");
		statusSelect.put("1","充值成功");
		statusSelect.put("2","签名不符");
		statusSelect.put("3","充值失败");
		mv.addObject("statusSelect",statusSelect);
		
		Map<String, String> waySelect = new LinkedHashMap<String,String>();
		waySelect.put("","所有");
		waySelect.put("llpay","连连支付");
		waySelect.put("off","线下充值");
		mv.addObject("waySelect",waySelect);
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getRechargeList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","审核通过");
		statusSelect.put("3","充值失败");
		mv.addObject("statusSelect",statusSelect);
		PageData pd = new PageData(request);
		Map<String, String> vo = thisService.get_recharge(pd, mv);
		mv.addObject("data", vo);
		return this.getTplView(request,response, tplPath, mv);
	}
	public void do_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		PageData pd = new PageData(request);
		String reString = thisService.do_edit(pd, mv);
		if("success".equals(reString)) ajaxmsg("处理成功","success", response);
		else ajaxmsg(reString,"fail", response);
	}
	
	public ModelAndView list_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		System.out.println("@@@@@@@");
		return index(request,response,  mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getRechargeExcelList(pd, mv);
		
		String[] arr = {"id","user_name as 用户名","real_name","customer_name","way","money","fee","money_collect","add_time","status","tran_id","deal_user"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
