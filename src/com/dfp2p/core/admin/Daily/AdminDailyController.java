package com.dfp2p.core.admin.Daily;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminDailyController extends BaseAdminController {
	public String tplPath = "Daily";
	@Resource(name="adminDailyService")
	private AdminDailyService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);

		PageData pd = new PageData(request);
		HashMap<String, Object> list = thisService.getDailyList(pd, mv);
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView list_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String id=pd.get("id");
		HashMap<String, String> vo = thisService.getDaily(pd, id);
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("1","显示");
		compareSignSelect.put("0","不显示");
		mv.addObject("showSelect",compareSignSelect);
		mv.addObject("dfForm_style", "width:200px;");

		mv.addObject("data", vo);
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
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("1","显示");
		compareSignSelect.put("0","不显示");
		mv.addObject("showSelect",compareSignSelect);
		mv.addObject("dfForm_style", "width:200px;");
		return this.getTplView(request,response, tplPath, mv);
	}
	public void doadd(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.doadd(pd);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
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
		uploadInfo.put("saveUrl", "/UploadFile/Borrow/");
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
