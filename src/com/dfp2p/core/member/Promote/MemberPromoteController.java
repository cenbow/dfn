package com.dfp2p.core.member.Promote;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseMemberController;

@Controller
public class MemberPromoteController extends BaseMemberController {
	public String tplPath = "Promote";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return this.getTplView(request,response, tplPath, mv);
	}
}
