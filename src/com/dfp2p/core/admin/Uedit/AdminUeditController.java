package com.dfp2p.core.admin.Uedit;

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
public class AdminUeditController extends BaseAdminController {
	public String tplPath = "Uedit";
	private static Log logger = LogFactory.getLog(AdminUeditController.class);
	public void index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		switch (pd.get("action_type")) {
		case "imageUp":
		{
			FormDataUtil fd = new FormDataUtil(request);
			FileItem fileItem = (FileItem)fd.get("upfile");
			if(fileItem==null||"null".equals(fileItem)){
				ajaxmsg("未检测到文件域", "0", response);
				return;
			}
			String WEB_ROOT = sysConfig.getSysParm("webroot");
			String name = fileItem.getName();
			HashMap<String, Object> uploadInfo = new HashMap<>();
			uploadInfo.put("fileItem", fileItem);
			uploadInfo.put("saveUrl", "/UploadFile/Article/");
			HashMap<String, Object> uploadRes = this.fileUpload(uploadInfo);			
			String fileName = "";
			try{
				String[] fileNameString = (fileItem.getName()).split("\\.");
				fileName=fileNameString[0];
			}catch (Exception e) {
				logger.error("文件名切分出错");
			}
			
			HashMap<String, Object> jsonRes = new HashMap<>();
			jsonRes.put("state", "success");
			jsonRes.put("url", WEB_ROOT+uploadRes.get("imgUrl"));
			jsonRes.put("title", fileName);
			jsonRes.put("original", fileItem.getName());
			this.echoJson(jsonRes,response);
			break;
		}
		case "fileUp":
		{
			FormDataUtil fd = new FormDataUtil(request);
			FileItem fileItem = (FileItem)fd.get("upfile");
			if(fileItem==null||"null".equals(fileItem)){
				ajaxmsg("未检测到文件域", "0", response);
				return;
			}
			String WEB_ROOT = sysConfig.getSysParm("webroot");
			String name = fileItem.getName();
			HashMap<String, Object> uploadInfo = new HashMap<>();
			uploadInfo.put("fileItem", fileItem);
			uploadInfo.put("saveUrl", "/UploadFile/Files/");
			HashMap<String, Object> uploadRes = this.fileUpload(uploadInfo);			
			String fileName = "";
			String fileType="";
			logger.info("uploadRes"+uploadRes);
			try{
				String[] fileNameString = (fileItem.getName()).split("\\.");
				fileName=fileNameString[0];
				fileType=fileNameString[1];
			}catch (Exception e) {
				logger.error("文件名切分出错");
			}
			// '{"url":"' . $info["url"]. '","fileType":"' . $info[ "extension" ] . '","original":"' . $info[ "name" ] . '","state":"SUCCESS"}';
			HashMap<String, Object> jsonRes = new HashMap<>();
			jsonRes.put("state", "SUCCESS");
			jsonRes.put("url", WEB_ROOT+uploadRes.get("imgUrl"));
			jsonRes.put("fileType", fileType);
			jsonRes.put("original", fileItem.getName());
			this.echoJson(jsonRes,response);
			break;
		}
		default:
			break;
		}
		
		
		return ;
	}

}
