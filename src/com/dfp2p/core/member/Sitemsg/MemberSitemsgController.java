package com.dfp2p.core.member.Sitemsg;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.member.Myinvest.MemberMyinvestService;
import com.dfp2p.util.PageData;

@Controller
public class MemberSitemsgController extends BaseMemberController {
	public String tplPath = "Sitemsg";
	
	@Resource(name="memberSitemsgService")
	private MemberSitemsgService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getSitemsgList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView list_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request,response, mv);
	}
	public void markAll(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		 String flag = thisService.updateSitemsg();
		 if ("success".equals(flag))
			 ajaxmsg("success", 1, response);
		 else
			 ajaxmsg("fail",0,response);
	}

}
