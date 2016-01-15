package com.dfp2p.core.admin.User_credit;

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
import com.dfp2p.core.admin.Apply_limit.AdminApply_limitService;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminUser_creditController extends BaseAdminController {
	public String tplPath = "User_credit";
	
	
	@Resource(name="adminUser_creditService")
	private AdminUser_creditService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		

		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("","全部");
		typeSelect.put("1","正常还款");
		typeSelect.put("2","迟还");
		typeSelect.put("3","逾期还款");
		typeSelect.put("4","提前还款");
		typeSelect.put("5","实名认证");
		typeSelect.put("6","视频认证");
		typeSelect.put("7","现场认证");
		typeSelect.put("8","VIP审核");
		typeSelect.put("9","管理员操作");
		typeSelect.put("10","普通标投标");
		typeSelect.put("11","流转标投标");
		typeSelect.put("12","兑换商品消耗");
		mv.addObject("typeSelect",typeSelect);
		
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_creditList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_creditExcelList(pd, mv);
		
		String[] arr = {"id","user_name as 姓名","affect_credits","account_credits","add_time","info AS 信息"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
