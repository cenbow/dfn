package com.dfp2p.core.admin.Capital;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.dfCache.CacheConfiguration;
import com.dfp2p.util.dfCache.CacheManager;

@Controller
public class AdminCapitalController extends BaseAdminController {
	public String tplPath = "Capital";

	public ModelAndView capital(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView reward(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView withdraw(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView recharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView account(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView capital_all(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		  mv.addObject("showHtml", "ddddf");
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView kf(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView rank(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView balance(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

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
