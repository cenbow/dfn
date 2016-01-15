package com.dfp2p.core.admin.Capital_log;



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
import com.dfp2p.core.admin.Menu.AdminMenuService;
import com.dfp2p.fun.Interface;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminCapital_logController extends BaseAdminController {
	public String tplPath = "Capital_log";
	
	@Resource(name="adminCapital_logService")
	private AdminCapital_logService thisService;
	 
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		LinkedHashMap<String, String> typeSelect = Interface.getMoneyType("money");
		typeSelect.put("",	"请选择事件类型");
		mv.addObject("typeSelect",typeSelect);
		
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_logList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_logExcelList(pd, mv);
		
		String[] arr = {"id","user_name","target_uname","type","affect_money","account_money","freeze_money","collect_money","add_time","info"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
