package com.dfp2p.core.home.Loan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.util.PageData;

@Controller
public class LoanController extends BaseHomeController {
	public String tplPath = "Loan";
	
	@Resource(name="loanService")
	private LoanService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView car_loan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
	
		
		publicParams(mv);
		
		mv.addObject("thisType", "一般借款");
		
		return this.getTplView(request,response, tplPath, mv);
	}

	private void publicParams(ModelAndView mv) {
		Map<String,Object> product_select = new LinkedHashMap<String, Object>();
		product_select.put("",     "请选择");
		product_select.put("一般借款", "一般借款");
		product_select.put("经营借款", "经营借款");
		product_select.put("薪贷通", "薪贷通");
		product_select.put("创业贷", "创业贷");
		product_select.put("组合贷", "组合贷");
		mv.addObject("product_select",product_select);
		
		
		Map<String,Object> area_select = new LinkedHashMap<String, Object>();
		area_select.put(""   , "请选择");
		area_select.put("湖南", "湖南");
		area_select.put("北京", "北京");
		area_select.put("上海", "上海");
		mv.addObject("area_select",area_select);
	}
	
	public void addLoan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		PageData pd = new PageData(request);
		HttpSession session = request.getSession();
		String vcode= pd.post("vcode");
		if(vcode==null || !vcode.toLowerCase().equals(session.getAttribute("code"))) {
			ajaxmsg("验证码错误", 0, response);
		}else{
			String flag = thisService.addLoan(pd, mv);
			
			if (!"success".equals(flag))
			{
				ajaxmsg(flag,0, response);
			}else{
				ajaxmsg("提交成功",1, response);
			}	
		}
		
	}
	public ModelAndView commercial_loan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	

		publicParams(mv);
		
		mv.addObject("thisType", "创业贷");
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView Group_loan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	

		publicParams(mv);
		
		mv.addObject("thisType", "组合贷");
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView Pay_loan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		

		publicParams(mv);
		
		mv.addObject("thisType", "薪贷通");
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView real_loan(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	

		publicParams(mv);
		
		mv.addObject("thisType", "经营借款");
		return this.getTplView(request,response, tplPath, mv);
	}
	
}


