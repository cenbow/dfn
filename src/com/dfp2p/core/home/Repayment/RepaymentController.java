package com.dfp2p.core.home.Repayment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;

@Controller
public class RepaymentController extends BaseHomeController {
	public String tplPath = "Repayment";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		return this.getTplView(request,response, tplPath, mv);
	
}
}
