package com.dfp2p.core.admin.Capital_withdraw;

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
public class AdminCapital_withdrawController extends BaseAdminController {
	public String tplPath = "Capital_withdraw";
	
	@Resource(name="adminCapital_withdrawService")
	private AdminCapital_withdrawService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);

		Map<String, String> txSignSelect = new LinkedHashMap<String,String>();
		txSignSelect.put("gt","大于");
		txSignSelect.put("eq","等于");
		txSignSelect.put("lt","小于");
		mv.addObject("txSignSelect",txSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_withdrawList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request, response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_withdrawExcelList(pd, mv);

		String[] arr = {"id as UID","user_name as 姓名","real_name as 真实姓名","totalWithdrawMoney as 提现总金额","totalWithdrawFee as 提现总手续费","totalTimes as 提现总次数"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "提现统计", arr,response);
		
	}
}
