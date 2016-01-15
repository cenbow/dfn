package com.dfp2p.core.admin.Apply_video;

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
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.util.PageData;

@Controller
public class AdminApply_videoController extends BaseAdminController {
	public String tplPath = "Apply_video";
	
	@Resource(name="adminApply_videoService")
	private AdminApply_videoService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("","全部");
		vipSelect.put("1","是");
		vipSelect.put("0","否");
		mv.addObject("vipSelect",vipSelect);
		
		Map<String, String> video_statusSelect = new LinkedHashMap<String,String>();
		video_statusSelect.put("","全部");
		video_statusSelect.put("0","待审核");
		video_statusSelect.put("1","已通过");
		video_statusSelect.put("2","未通过");
		mv.addObject("video_statusSelect",video_statusSelect);
		
		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getApply_videoList(pd, mv);

		mv.addObject("list", list);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> video_statusSelect = new LinkedHashMap<String,String>();
		video_statusSelect.put("0","待审核");video_statusSelect.put("1","已通过");
		video_statusSelect.put("2","未通过");
		mv.addObject("video_statusSelect",video_statusSelect);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView doUpdate_user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return this.getTplView(request,response, tplPath, mv);
	}
}
