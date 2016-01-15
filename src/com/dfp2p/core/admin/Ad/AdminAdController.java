package com.dfp2p.core.admin.Ad;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.admin.Article_category.AdminArticle_categoryService;
import com.dfp2p.core.admin.Borrow_edit.AdminBorrow_editController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminAdController extends BaseAdminController {
	public String tplPath = "Ad";
	private static Log logger = LogFactory.getLog(AdminAdController.class);
	
	@Resource(name="adminAdService")
	private AdminAdService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getAdList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> remove_pSelect = new LinkedHashMap<String,String>();
		remove_pSelect.put("0", "是");
		remove_pSelect.put("1", "否");
		mv.addObject("remove_pSelect",remove_pSelect);

		Map<String, String> adType = new LinkedHashMap<String,String>();
		adType.put("1", "普通广告");
		adType.put("2", "多图广告");
		mv.addObject("adType",adType);

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getAdList(pd, mv);

		List<Map<String,String>> data = (List<Map<String, String>>) list.get("data");
		if (data != null && !data.isEmpty()){
			Map<String, String> adinfoMap = data.get(0);
			mv.addObject("data",adinfoMap);
			if("2".equals(adinfoMap.get("ad_type")+"")){
				
				mv.addObject("imgs",  (List<HashMap<String, String>>) JacksonUtil.listFromJson(adinfoMap.get("content")));
				
				
				mv= this.getTplView(request,response, tplPath, mv);
				mv.setViewName("/Admin/Ad/edit_img");
				return mv;
			}else{
				return this.getTplView(request,response, tplPath, mv);
			}
		}else{
			return this.showTip(mv, "error", "3", "数据有误");
		}
		

	}
	
	public ModelAndView add_menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		Map<String, String> remove_pSelect = new LinkedHashMap<String,String>();
		remove_pSelect.put("0", "是");
		remove_pSelect.put("1", "否");
		mv.addObject("remove_pSelect",remove_pSelect);

		Map<String, String> adType = new LinkedHashMap<String,String>();
		adType.put("1", "普通广告");
		adType.put("2", "多图广告");
		mv.addObject("adType",adType);
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void addAd(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> remove_pSelect = new LinkedHashMap<String,String>();
		remove_pSelect.put("0", "是");
		remove_pSelect.put("1", "否");
		mv.addObject("remove_pSelect",remove_pSelect);
		
		PageData pd = new PageData(request);
		
		boolean flag = thisService.addAd(pd);
		
		if (flag){
			ajaxmsg("操作成功", "success", response);
		}else
			ajaxmsg("操作失败", "fail", response);
	}
	public void editAd(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = thisService.editAd(pd);
		
		if (flag){
			Common.getCacheAd(pd.post("id"), true);
			ajaxmsg("操作成功", "success", response);
		}else
			ajaxmsg("操作失败", "fail", response);
	}
	
	public void deleteAd(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = thisService.deleteAd(pd);
		
		if (flag){
			Common.getCacheAd(pd.get("id"), true);
			ajaxmsg("操作成功", "success", response);
		}else
			ajaxmsg("操作失败", "fail", response);
	}

	public void swfupload(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		FormDataUtil fd = new FormDataUtil(request);
		FileItem fileItem = (FileItem)fd.get("Filedata");
		if(fileItem==null||"null".equals(fileItem)){
			ajaxmsg("未检测到文件域", "0", response);
			return;
		}
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String name = fileItem.getName();
		HashMap<String, Object> uploadInfo = new HashMap<>();
		uploadInfo.put("fileItem", fileItem);
		uploadInfo.put("saveUrl", "/UploadFile/Ad/");
		HashMap<String, Object> uploadRes = this.fileUpload(uploadInfo);
		
		HashMap<String, Object> resizeInfo = new HashMap<>();
		resizeInfo.put("sourceFilePath", uploadRes.get("imgPath"));
		resizeInfo.put("width", "118");
		resizeInfo.put("height", "86");
		HashMap<String, Object> resizeRes = this.resizeImg(resizeInfo);
		

		HashMap<String, Object> jsonRes = new HashMap<>();
		jsonRes.put("status", "success");
		jsonRes.put("data", uploadRes.get("imgUrl"));
		jsonRes.put("oldName", fileItem.getName());
		this.echoJson(jsonRes,response);
	}

}
