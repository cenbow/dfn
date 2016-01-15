package com.dfp2p.core.admin.Capital_user;

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
import com.dfp2p.core.admin.Capital_log.AdminCapital_logService;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminCapital_userController extends BaseAdminController {
	public String tplPath = "Capital_user";
	
	@Resource(name="adminCapital_userService")
	private AdminCapital_userService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> balanceTypeSelect = new LinkedHashMap<String,String>();
		balanceTypeSelect.put("mm#account_money","可用余额");
		balanceTypeSelect.put("mm#money_freeze","冻结资金");
		balanceTypeSelect.put("mm#money_collect","待收金额");
		mv.addObject("balanceTypeSelect",balanceTypeSelect);
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
			
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_userList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request, response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_userExcelList(pd, mv);
		
		String[] arr = {"id as UID","user_name as 用户名","user_phone as 手机号码","account_money as 可用余额","money_freeze as 冻结金额","money_collect as 待收金额","totalWithdrawMoney as 提现总金额","totalMoney as 充值总金额","reg_time as 注册时间"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "会员帐户情况", arr,response);
		
	}
}
