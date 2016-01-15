package com.dfp2p.core.admin.Borrow_edit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.admin.User.AdminUserDao;
import com.dfp2p.core.admin.User_credit.AdminUser_creditService;
import com.dfp2p.core.tag.FormHelper;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminBorrow_editController extends BaseAdminController {
	public String tplPath = "Borrow_edit";
	private static Log logger = LogFactory.getLog(AdminBorrow_editController.class);
	
	@Resource(name="adminBorrow_editService")
	private AdminBorrow_editService thisService;
	
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		if(pd.containsKey("id")&&!StringUtils.isBlank(pd.get("id"))){
		HashMap<String, String> borrowInfo = (HashMap<String, String>) thisService.getBorrowInfo(pd, mv);
		mv.addObject("data", borrowInfo);
		
		//序列化保存的内容
		HashMap<String, Object> deJsonMap = new HashMap<>();
		deJsonMap.put("img_type_1","");
		deJsonMap.put("img_type_2","");
		for (Entry<String, Object>entryMap : deJsonMap.entrySet()) {
			String keyString = entryMap.getKey();
			if(!Common.isBlankInMap(borrowInfo, keyString)) deJsonMap.put(keyString, (List<HashMap<String, String>>) JacksonUtil.listFromJson(borrowInfo.get(keyString)));
		}
		mv.addObject("deJson", deJsonMap);
		
		
	
		borrowInfo.put("collect_time", Tools.TimeStamp2Date(Tools.timeAddDay(Integer.valueOf(borrowInfo.get("collect_day")),Tools.getLongTime()+"")+"", "yyyy-MM-dd HH:mm:ss"));
		//些标种相关信息
		Map<String, Object> borrowTypeConfig = borrowAndInvest.getBorrowTypeConfig(borrowInfo.get("borrow_type"));		
		mv.addObject("borrow_use", Common.buildNewKVMap((Map<String, Object>) borrowTypeConfig.get("yt"), "key", "borrowUse"));
		mv.addObject("repaymentType", Interface.getRepaymentTypeMap());
		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> borrowTypeName = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "key", "borrow_name");
		mv.addObject("borrowType", borrowTypeName);
		}
		LinkedHashMap<String, String>canAuto =  new LinkedHashMap<>();
		canAuto.put("1", "是");
		canAuto.put("0", "否");
		mv.addObject("canAuto", canAuto);
		return this.getTplView(request,response, tplPath, mv);
	}	
	
	public void do_edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		Map<String, String> borrowInfo = thisService.getBorrowInfo(pd, mv);
		int borrowStatus = Integer.valueOf(borrowInfo.get("borrow_status"));
		String flag=thisService.editBorrow(pd,borrowInfo);
		if("success".equals(flag)){
			ajaxmsg("修改成功", "success", response);
		}else{
			ajaxmsg(flag, "fail", response);
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
