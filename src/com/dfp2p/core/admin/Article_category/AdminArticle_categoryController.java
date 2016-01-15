package com.dfp2p.core.admin.Article_category;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Article.AdminArticleService;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminArticle_categoryController extends BaseAdminController {
	public String tplPath = "Article_category";
	
	@Resource(name="adminArticle_categoryService")
	private AdminArticle_categoryService thisService;
	
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getArticle_categoryList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	public void addArticle_category(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.addArticle_category(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> is_showSelect = new LinkedHashMap<String,String>();
		is_showSelect.put("1", "显示");
		is_showSelect.put("0", "不显示");
		mv.addObject("is_showSelect",is_showSelect);
		
		
		Map<String, String> parentid_Select = new LinkedHashMap<String,String>();
		parentid_Select.put("0", "请选择");
		mv.addObject("parentid_Select",parentid_Select);
		
		PageData pd = new PageData(request);
		
		
		Map<String,Object> data1 = thisService.add_Menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data1.get("data");
		for (Map<String, String> map : mapList)
		{
			parentid_Select.put(map.get("id"), map.get("cate_name"));
		}
		
		HashMap<String, Object> data = thisService.getArticle_categoryById(pd, mv);
		
		mv.addObject("data", data);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView add_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> is_showSelect = new LinkedHashMap<String,String>();
		is_showSelect.put("1", "显示");
		is_showSelect.put("0", "不显示");
		mv.addObject("is_showSelect",is_showSelect);
		
		
		Map<String, String> parentid_Select = new LinkedHashMap<String,String>();
		parentid_Select.put("0", "请选择");
		mv.addObject("parentid_Select",parentid_Select);
		
		PageData pd = new PageData(request);
		
		String id = pd.get("id");
		if (id!=null)
			mv.addObject("this_id",id);
		Map<String,Object> data = thisService.add_Menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			parentid_Select.put(map.get("id"), map.get("cate_name"));
		}
			
		mv.addObject("data", data);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void delete(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.deleteArticle_category(pd, mv);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	
	public ModelAndView add_parent(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public void editArticle_category(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.editArticle_category(pd);
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
	
	public  void doEdit_sort_order(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		boolean flag = thisService.doEdit_sort_order(pd, mv);

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
}
