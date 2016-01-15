package com.dfp2p.core.admin.Capital_recharge;

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
public class AdminCapital_rechargeController extends BaseAdminController {
	public String tplPath = "Capital_recharge";
	
	@Resource(name="adminCapital_rechargeService")
	private AdminCapital_rechargeService thisService;
	
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
		
		HashMap<String, Object> list = thisService.getCapital_rechargeList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request, response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_rechargeExcelList(pd, mv);

		String[] arr = {"id as UID","user_name as 用户名","real_name as 真实姓名","money as 充值总金额","fee as 充值总手续费","totalTimes as 充值总次数"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "充值统计", arr,response);
		
	}
}
