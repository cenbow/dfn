package com.dfp2p.core.admin.Card;

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
public class AdminUser_cardController extends BaseAdminController {
	public String tplPath = "Card";
	
	
	@Resource(name="adminUser_cardService")
	private AdminUser_cardService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_cardList(pd, mv);

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
