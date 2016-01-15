package com.dfp2p.core.admin.Withdraw;

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
import com.dfp2p.core.admin.Recharge.AdminRechargeService;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminWithdrawController extends BaseAdminController {
	public String tplPath = "Withdraw";
	
	@Resource(name="adminWithdrawService")
	private AdminWithdrawService thisService;
	
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("","所有");
		statusSelect.put("0","待审核");
		statusSelect.put("1","审核通过，处理中");
		statusSelect.put("2","已提现");
		statusSelect.put("3","审核未通过");
		mv.addObject("statusSelect",statusSelect);
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getWithdrawList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("1","审核通过，处理中");
		statusSelect.put("2","已提现");
		statusSelect.put("3","提现不通过");
		mv.addObject("statusSelect",statusSelect);
		
		PageData pd = new PageData(request);
		Map<String, String> vo = thisService.getWithdraw(pd, mv);
		mv.addObject("data",vo);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void do_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String reString = thisService.editWithdraw(pd, mv);
		if("success".equals(request)) ajaxmsg("处理成功", "success", response);
		else ajaxmsg(reString, "fail", response);
	}
	public ModelAndView list_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request, response, mv);
	}
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getWithdrawExcelList(pd, mv);
		
		String[] arr = {"id","user_name as 姓名","customer_name","withdraw_money","withdraw_fee","adjust_fee"
				,"real_name"
				,"bank_name"
				,"bank_num"
				,"add_time"
				,"user_name"
				,"deal_time"
				,"deal_info"
				,"deal_user"
				,"withdraw_status"
		};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}

}
