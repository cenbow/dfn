package com.dfp2p.core.admin.Content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.dfCache.CacheConfiguration;
import com.dfp2p.util.dfCache.CacheManager;

@Controller
public class AdminContentController extends BaseAdminController {
	public String tplPath = "Content";

	public ModelAndView admin_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView admin_post(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
		
	public ModelAndView catogery(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView comments(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	
	public ModelAndView message(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView recycle_article(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView recycle_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView article_list(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView article_category(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView ad_index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView mains(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
        String memServers =CacheConfiguration.getProperty("memServers");
        System.out.println("memServers="+memServers);
        System.out.print("<br />");
		CacheManager C = new CacheManager();
		C.set("testkey", "testvalue");
		String sff = (String) C.get("testkey");
		System.out.println(sff);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	
}
