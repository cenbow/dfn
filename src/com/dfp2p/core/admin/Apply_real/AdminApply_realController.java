package com.dfp2p.core.admin.Apply_real;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Apply_vip.AdminApply_vipService;
import com.dfp2p.util.PageData;

@Controller
public class AdminApply_realController extends BaseAdminController {
	public String tplPath = "Apply_real";
	
	@Resource(name="adminApply_realService")
	private AdminApply_realService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("","全部");
		vipSelect.put("1","是");
		vipSelect.put("0","否");
		mv.addObject("vipSelect",vipSelect);
		
		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("","全部");
		statusSelect.put("0","待审核");
		statusSelect.put("1","已通过");
		statusSelect.put("2","未通过");
		mv.addObject("statusSelect",statusSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getApply_realList(pd, mv);

		mv.addObject("list", list);
		
		return this.getTplView(request,response, tplPath, mv);
		
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);

		Map<String, String> statusSelect = new LinkedHashMap<String,String>();
		statusSelect.put("0","待审核");
		statusSelect.put("1","已通过");
		statusSelect.put("2","未通过");
		mv.addObject("statusSelect",statusSelect);
		mv.addObject("uid",pd.get("id"));
		return this.getTplView(request,response, tplPath, mv);
	}
	public void do_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.doedit(pd);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
	}
}
