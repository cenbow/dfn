package com.dfp2p.core.home.Membercenter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;

@Controller
public class UcenterController extends BaseHomeController {
	public String tplPath = "Membercenter";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		return this.getTplView(request,response, tplPath, mv);
	}
}
