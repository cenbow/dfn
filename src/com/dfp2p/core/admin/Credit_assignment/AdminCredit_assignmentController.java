package com.dfp2p.core.admin.Credit_assignment;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.PageData;

@Controller
public class AdminCredit_assignmentController extends BaseAdminController {
	public String tplPath = "Credit_assignment";
	@Resource(name="adminCredit_assignmentService")
	private AdminCredit_assignmentService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);

		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getCredit_assignmentList(pd, mv);
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String id=pd.get("id");
		HashMap<String, Object> list = thisService.getCredit_assignment(pd, id);
		HashMap<String, String> vo = (HashMap<String, String>) list.get("vo");
		
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		if("0".equals(vo.get("status"))){
			compareSignSelect.put("1","通过");
			compareSignSelect.put("5","拒绝");
		}else{
			compareSignSelect.put("4","提前结束");
		}
		mv.addObject("compareSignSelect",compareSignSelect);

		
		mv.addObject("vo", vo);
		mv.addObject("list", list.get("list"));
		return this.getTplView(request,response, tplPath, mv);
	}
	public void doedit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.doedit(pd, mv);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
}
