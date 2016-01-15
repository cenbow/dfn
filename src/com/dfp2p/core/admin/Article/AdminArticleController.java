package com.dfp2p.core.admin.Article;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.admin.Article_category.AdminArticle_categoryService;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminArticleController extends BaseAdminController {
	private static Log logger = LogFactory.getLog(AdminArticleController.class);
	public String tplPath = "Article";
	
	@Resource(name="adminArticleService")
	private AdminArticleService thisService;
	
	@Resource(name="adminArticle_categoryService")
	private AdminArticle_categoryService categoryService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> attrSelect = new LinkedHashMap<String,String>();
		attrSelect.put("","全部");
		attrSelect.put("1","普通");
		attrSelect.put("2","跳转");
		mv.addObject("attrSelect",attrSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getArticleList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView edit_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> cat_idSelect = new LinkedHashMap<String,String>();
		//cat_idSelect.put("", "请选择");
		mv.addObject("cat_idSelect",cat_idSelect);
		
		PageData pd = new PageData(request);
		
		Map<String,Object> data1 = categoryService.add_Menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data1.get("data");
		for (Map<String, String> map : mapList)
		{
			cat_idSelect.put(map.get("id"), map.get("cate_name"));
		}
		
		
		HashMap<String, Object> list = thisService.getArticleList(pd, mv);
		
		if(list.get("data") !=null && ((List)list.get("data")).size()>0)
			mv.addObject("data", ((List)list.get("data")).get(0));
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	
	public ModelAndView add_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> cat_idSelect = new LinkedHashMap<String,String>();
		//cat_idSelect.put("", "请选择");
		mv.addObject("cat_idSelect",cat_idSelect);
		
		PageData pd = new PageData(request);
		
		Map<String,Object> data = categoryService.add_Menu(pd, mv);
		List <Map<String, String>> mapList = (List<Map<String, String>>) data.get("data");
		for (Map<String, String> map : mapList)
		{
			cat_idSelect.put(map.get("id"), map.get("cate_name"));
		}
		
		mv.addObject("sort_order",Tools.getLongTime());
		mv.addObject("data", data);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void addArticle(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		String flag = thisService.addArticle(pd);

		if ("success".equals(flag))
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg(flag, "fail", response);
	}
	
	public void editArticle(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		String flag = thisService.editArticle(pd);
		
		if ("success".equals(flag))
			ajaxmsg("修改成功", "success", response);
		else
			ajaxmsg(flag, "fail", response);
	}
	
	public void deleteArticle(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		HashMap<String, Object>delMap = new HashMap<>();
		delMap.put("id", pd.get("id"));
		boolean flag = thisService.deleteArticle(delMap);
		
		if (flag)
			ajaxmsg(pd.get("id"), "success", response);
		else
			ajaxmsg("删除失败", "fail", response);
	}
	public void upladTheFile(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		FormDataUtil fd = new FormDataUtil(request);
		PageData pd = new PageData(request);
		String thumbWidth="74";
		String thumbHeight="59";
		if(DfMath.toIntValue(pd.get("w"))>0) thumbWidth=DfMath.toIntValue(pd.get("w"))+"";
		if(DfMath.toIntValue(pd.get("h"))>0) thumbHeight=DfMath.toIntValue(pd.get("h"))+"";

		FileItem fileItem = (FileItem)fd.get("thumb");
		if(fileItem==null||"null".equals(fileItem)){
			ajaxmsg("未检测到文件域", "fail", response);
			return;
		}
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String name = fileItem.getName();
		HashMap<String, Object> uploadInfo = new HashMap<>();
		uploadInfo.put("fileItem", fileItem);
		uploadInfo.put("saveUrl", "/UploadFile/Artice/");
		HashMap<String, Object> uploadRes = this.fileUpload(uploadInfo);
		
		HashMap<String, Object> resizeInfo = new HashMap<>();
		resizeInfo.put("sourceFilePath", uploadRes.get("imgPath"));
		resizeInfo.put("width", thumbWidth);
		resizeInfo.put("height", thumbHeight);
		HashMap<String, Object> resizeRes = this.resizeImg(resizeInfo);
		
		ajaxmsg(uploadRes.get("imgUrl")+"", "success", response);
	}
}
