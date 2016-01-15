package com.dfp2p.core.admin.Wx_content;

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
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminWx_contentController extends BaseAdminController {
	public String tplPath = "Wx_content";
	private static Log logger = LogFactory.getLog(AdminWx_contentController.class);
	
	@Resource(name="AdminWx_contentService")
	private AdminWx_contentService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> remove_pSelect = new LinkedHashMap<String,String>();
		remove_pSelect.put("news", "图文");
		remove_pSelect.put("text", "文本");
		mv.addObject("typeSelect",remove_pSelect);
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
		remove_pSelect.put("news", "图文");
		remove_pSelect.put("text", "文本");
		mv.addObject("typeSelect",remove_pSelect);

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getAdList(pd, mv);

		List<Map<String,String>> data = (List<Map<String, String>>) list.get("data");
		if (data != null && !data.isEmpty()){
			Map<String, String> adinfoMap = data.get(0);
			mv.addObject("data",adinfoMap);
			if("news".equals(adinfoMap.get("msg_type")+"")){
				List<HashMap<String, String>> xs = (List<HashMap<String, String>>) JacksonUtil.listFromJson(adinfoMap.get("content"));
				mv.addObject("newlist",  (List<HashMap<String, String>>) JacksonUtil.listFromJson(adinfoMap.get("content")));				
				mv= this.getTplView(request,response, tplPath, mv);
				return mv;
			}else{
				return this.getTplView(request,response, tplPath, mv);
			}
		}else{
			return this.showTip(mv, "error", "3", "数据有误");
		}
		

	}
	
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> remove_pSelect = new LinkedHashMap<String,String>();
		remove_pSelect.put("news", "图文");
		remove_pSelect.put("text", "文本");
		mv.addObject("typeSelect",remove_pSelect);
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public void doadd(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.addAd(pd);
		
		if ("success".equals(flag)){
			ajaxmsg("操作成功", "success", response);
		}else
			ajaxmsg("操作失败:"+flag, "fail", response);
	}
	public void doedit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		String flag = thisService.editAd(pd);
		
		if ("success".equals(flag)){
			//Common.getCacheAd(pd.post("id"), true);
			ajaxmsg("操作成功", "success", response);
		}else
			ajaxmsg("操作失败"+flag, "fail", response);
	}
	
	public void deleteAd(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		
		boolean flag = thisService.deleteAd(pd);
		
		if (flag){
			//Common.getCacheAd(pd.get("id"), true);
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
		HttpServletRequest Request = getRequest();
		String port=(Request.getLocalPort()==80||Request.getLocalPort()==8080)?"":":"+Request.getLocalPort();
		String domainString= "http://"+Request.getServerName()+port+sysConfig.getSysParm("webroot");

		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String name = fileItem.getName();
		HashMap<String, Object> uploadInfo = new HashMap<>();
		uploadInfo.put("fileItem", fileItem);
		uploadInfo.put("saveUrl", "/UploadFile/WX/");
		HashMap<String, Object> uploadRes = this.fileUpload(uploadInfo);
		
		HashMap<String, Object> resizeInfo = new HashMap<>();
		resizeInfo.put("sourceFilePath", uploadRes.get("imgPath"));
		resizeInfo.put("width", "118");
		resizeInfo.put("height", "86");
		HashMap<String, Object> resizeRes = this.resizeImg(resizeInfo);
		

		HashMap<String, Object> jsonRes = new HashMap<>();
		jsonRes.put("status", "success");
		jsonRes.put("data", domainString+uploadRes.get("imgUrl"));
		jsonRes.put("oldName", fileItem.getName());
		this.echoJson(jsonRes,response);
	}

}
