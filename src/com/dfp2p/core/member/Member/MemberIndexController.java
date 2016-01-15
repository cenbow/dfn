package com.dfp2p.core.member.Member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.util.PageData;

@Controller
public class MemberIndexController extends BaseMemberController {
	public String tplPath = "Member";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
 
		return this.getTplView(request,response, tplPath, mv);
	}
	
	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		return this.getTplView(request,response, tplPath, mv);
	}

}
