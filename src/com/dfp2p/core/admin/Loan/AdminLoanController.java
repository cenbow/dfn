package com.dfp2p.core.admin.Loan;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Ad.AdminAdService;
import com.dfp2p.util.PageData;

@Controller
public class AdminLoanController extends BaseAdminController {
	public String tplPath = "Loan";
	
	@Resource(name="adminLoanService")
	private AdminLoanService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String,Object> product_select = new LinkedHashMap<String, Object>();
		product_select.put("",     "请选择");
		product_select.put("车贷通", "车贷通");
		product_select.put("房贷通", "房贷通");
		product_select.put("薪贷通", "薪贷通");
		product_select.put("商贷通", "商贷通");
		product_select.put("组合贷", "组合贷");
		mv.addObject("product_select",product_select);
		
		Map<String,Object> subject_select = new LinkedHashMap<String, Object>();
		subject_select.put("个人", "个人");
		subject_select.put("企业", "企业");
		mv.addObject("subject_select",subject_select);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getLoanList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	 
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String,Object> deal_select = new LinkedHashMap<String, Object>();
		deal_select.put("0", "待审核");
		deal_select.put("1", "已通过");
		deal_select.put("-1", "未通过");
		mv.addObject("deal_select",deal_select);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getLoan(pd, mv);
		
		if (list.get("data")!=null)
			mv.addObject("data", list.get("data"));
		return this.getTplView(request,response, tplPath, mv);
	}
	public void doEdit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		 
		String flag = thisService.editLoan(pd, mv);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"0", response);
		}else{
			ajaxmsg("修改成功","1", response);
		}	
		 
		
	}
}
