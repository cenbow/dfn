package com.dfp2p.core.admin.Apply_vip;

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
import com.dfp2p.core.admin.Apply_face.AdminApply_faceService;
import com.dfp2p.util.PageData;

@Controller
public class AdminApply_vipController extends BaseAdminController {
	public String tplPath = "Apply_vip";
	
	@Resource(name="adminApply_vipService")
	private AdminApply_vipService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> customerSelect = new LinkedHashMap<String,String>();
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
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getApply_vipList(pd, mv);

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
