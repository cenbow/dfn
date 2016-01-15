package com.dfp2p.core.admin.User_refer;

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
import com.dfp2p.core.admin.Apply_video.AdminApply_videoService;
import com.dfp2p.util.PageData;

@Controller
public class AdminUser_referController extends BaseAdminController {
	public String tplPath = "User_refer";
	
	@Resource(name="adminUser_referService")
	private AdminUser_referService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("","全部");
		vipSelect.put("1","是");
		vipSelect.put("0","否");
		mv.addObject("vipSelect",vipSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_referList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	public ModelAndView appoint(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		mv.addObject("id", pd.get("id"));
		return this.getTplView(request,response, tplPath, mv);
	}
	public void doappoint(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String res = thisService.doappoint(pd.post("id"), pd.post("recommend_user"));
		if("success".equals(res)) ajaxmsg("指定成功", "success", response);
		else ajaxmsg(res, "fail", response);
	}
	public void removerefer(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String res = thisService.removerefer(pd.get("id"));
		if("success".equals(res)) ajaxmsg("取消成功", "success", response);
		else ajaxmsg(res, "fail", response);
	}
	
	
}
