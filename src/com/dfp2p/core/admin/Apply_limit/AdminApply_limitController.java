package com.dfp2p.core.admin.Apply_limit;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Apply_real.AdminApply_realService;
import com.dfp2p.util.PageData;

@Controller
public class AdminApply_limitController extends BaseAdminController {
	public String tplPath = "Apply_limit";
	

	@Resource(name="adminApply_limitService")
	private AdminApply_limitService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> customerSelect = new LinkedHashMap<String,String>();
		customerSelect.put("","=请选择=");
		customerSelect.put("22","test");
		customerSelect.put("33","mm");
		customerSelect.put("44","gg");
		mv.addObject("customerSelect",customerSelect);
		
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("","全部");
		statusSelect.put("0","待审核");
		statusSelect.put("1","已通过");
		statusSelect.put("2","未通过");
		mv.addObject("statusSelect",statusSelect);
		
		 
		Map<String, String> apply_limit_typeSelect = new LinkedHashMap<String,String>();
		apply_limit_typeSelect.put("","全部");
		apply_limit_typeSelect.put("1","借款信用额度");
		apply_limit_typeSelect.put("2","担保借款额度");
		apply_limit_typeSelect.put("3","投资担保额度");
		mv.addObject("apply_limit_typeSelect",apply_limit_typeSelect);

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getApply_limitList(pd, mv);

		mv.addObject("list", list);
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("0","待审核");
		statusSelect.put("1","已通过");
		statusSelect.put("2","未通过");
		mv.addObject("statusSelect",statusSelect);
		return this.getTplView(request,response, tplPath, mv);
	}
}
