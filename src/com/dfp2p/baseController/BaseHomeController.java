package com.dfp2p.baseController;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.commons.fileupload.FileItem;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.alibaba.fastjson.JSON;
import com.dfp2p.core.siteInit;
import com.dfp2p.core.sysConfig;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.ImagesResize;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.Uuid;
import com.dfp2p.util.VerifyCode.ValidateCode;

public class BaseHomeController extends MultiActionController{
	protected static Map<String, Object> _SiteInfo_=new HashMap<>();

	public ModelAndView getTplView(HttpServletRequest request, HttpServletResponse response, String mPath, ModelAndView mv) {
		String actionName = "";
		MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
		try {
			actionName = methodNameResolver.getHandlerMethodName(request);
		} catch (NoSuchRequestHandlingMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(mv.getModelMap().get("dfForm_class")==null)			mv.addObject("dfForm_class","myselect");
		if(mv.getModelMap().get("dfForm_style")==null)			mv.addObject("dfForm_style","width:100px;");
		if(mv.getModelMap().get("dfForm_others")==null)		mv.addObject("dfForm_others",""); 

		//是否已登陆
		HttpSession session = request.getSession();
		Object userInfo= session.getAttribute("UserInfo");
		if(userInfo!=null){
			mv.addObject("_USERINFO_",userInfo);
		}		
		
		//网站配置信息
		if(_SiteInfo_.size()==0){
			Map<String, Object> siteInfo = ConfigCache.getCacheList("cache_configIndex");		
			if (siteInfo != null){
				_SiteInfo_=siteInfo;
				mv.addObject("_siteInfo_", siteInfo);
			}
		}else{
			mv.addObject("_siteInfo_", _SiteInfo_);
		}
		
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		mv.addObject("HomeStatics",WEB_ROOT+"/Statics/Home");
		mv.addObject("MemberStatics",WEB_ROOT+"/Statics/Member");
		mv.addObject("SiteStatics",WEB_ROOT+"/Statics");
		String tplPath = "/Home/" + mPath + "/" + actionName;
		mv.addObject("_thisUrl_","Home/" + mPath + "/");
		mv.addObject("_WEB_ROOT_", WEB_ROOT);
//		System.out.println("tplPath="+tplPath);
		mv.setViewName(tplPath);
		return mv;
	}
		
		

		/*mv.addObject("HomeStatics",sysConfig.getSysParm("webroot")+"/Statics/Home/");
		mv.addObject("SiteStatics",sysConfig.getSysParm("webroot")+"/Statics/");
		String tplPath = "/Home/" + mPath + "/" + actionName;
		// System.out.print(tplPath);
		mv.setViewName(tplPath);
		return mv;
	}*/
	/**
	 * 得到PageData
	 */
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	/*输入json字符串*/
	public void echoJson (HashMap<String,Object> jsonMap, HttpServletResponse response) {
		String jsonString = JSON.toJSONString(jsonMap);
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getOutputStream().write(jsonString.getBytes("UTF-8"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			logger.error("输出json出错");
		}
		
	}
	
	public void ajaxmsg(String msg,int status, HttpServletResponse response){
		HashMap<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("status", status);
		jsonMap.put("msg",msg);
		this.echoJson(jsonMap, response);
		return ;
	}

	public void ajaxmsg(Object obj,HttpServletResponse response)
	{
		String json_result = "";
		if (obj != null)
			JSON.toJSONString(obj, true);
		json_result = JSON.toJSONString(obj);
		logger.info("AJAX JSON:  "+json_result+"");
		PrintWriter printWriter = null;
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			printWriter = response.getWriter();
			printWriter.write(json_result);
			printWriter.flush();
		} catch (IOException e) {
			logger.error("AJAX JSON: 失败",e);
		}finally{
			if(printWriter!=null)
				printWriter.close();
		}
	}

	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg) {
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		String jumpUrl = WEB_ROOT+"/";
		return this.showTip(mv, tipType, showSecond,msg, jumpUrl);
	}

	public ModelAndView showTip(ModelAndView mv,String tipType,String showSecond,String msg,String jumpUrl) {
		String WEB_ROOT = sysConfig.getSysParm("webroot");
		//是否已登陆
		HttpServletRequest request = this.getRequest();
		HttpSession session = request.getSession();
		Object userInfo= session.getAttribute("UserInfo");
		if(userInfo!=null){
			mv.addObject("_USERINFO_",userInfo);
		}		
		
		mv.addObject("MemberStatics",WEB_ROOT+"/Statics/Member/");
		mv.addObject("HomeStatics",WEB_ROOT+"/Statics/Home");
		mv.addObject("SiteStatics",WEB_ROOT+"/Statics/");
		mv.addObject("_WEB_ROOT_", WEB_ROOT);
		mv.addObject("showSecond", showSecond);
		mv.addObject("jumpUrl", jumpUrl);
		mv.addObject("msg", msg);
		String tplPath = (Common.isMob(request))?"/Home/Common/tip_mob_"+tipType:"/Home/Common/tip_"+tipType;
		mv.setViewName(tplPath);
		return mv;
	}
	
	
	public void SiteVerifyCode(int codeNum,HttpServletRequest reqeust,HttpServletResponse response){
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		//禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		HttpSession session = reqeust.getSession();
		
		ValidateCode vCode = new ValidateCode(120,40,codeNum,100);
		session.setAttribute("code", vCode.getCode().toLowerCase());
		try {
			vCode.write(response.getOutputStream());
		} catch (IOException e) {
			logger.error("验证码生成失败:"+e.toString());
		}
	}
	
	public HashMap<String, Object> fileUpload(HashMap<String, Object> uploadInfo) {
		FileItem thisFile = (FileItem) uploadInfo.get("fileItem");
		String fileOldName = thisFile.getName();
		String fileType = Tools.getExtension(fileOldName);
		String WEB_ROOT_PAT = Tools.getAbsolutelyPath();
		String saveFilePath = WEB_ROOT_PAT+""+uploadInfo.get("saveUrl");
		String saveName=((uploadInfo.containsKey("saveName"))?uploadInfo.get("saveName")+"":Uuid.genOrdId16())+"."+fileType;
		long fileSize = thisFile.getSize();
		//上传
		boolean isSuccess = FormDataUtil.upload(thisFile, saveFilePath, saveName);
		
		HashMap<String, Object> resMap = new HashMap<>();
		resMap.put("res", isSuccess);
		resMap.put("errorMsg", "文件上传失败");
		resMap.put("fileSize", fileSize);
		resMap.put("imgUrl", uploadInfo.get("saveUrl")+""+saveName);
		resMap.put("imgPath", saveFilePath+"/"+saveName);
		return resMap;
	}
	
	public HashMap<String, Object> resizeImg(HashMap<String, Object> resizeInfo) {
		File tempFile =new File((resizeInfo.get("sourceFilePath")+"").trim()); 
		String fileName = tempFile.getName();
		String fileType = Tools.getExtension(fileName);
		String pureFileName = fileName.replace("."+fileType,"");
		String thumbDirPath = tempFile.getAbsolutePath().replace(fileName, "");
		String thumbFilePath = thumbDirPath+pureFileName+"_thumb."+fileType;
		//缩小
		boolean isSuccess = ImagesResize.createThumbnail(resizeInfo.get("sourceFilePath")+"",thumbFilePath,  DfMath.s2round(resizeInfo.get("width")+""), DfMath.s2round(resizeInfo.get("height")+""));
		//IamgesResize r = new IamgesResize(resizeInfo.get("sourceFilePath")+"",  Integer.parseInt(resizeInfo.get("width")+""), Integer.parseInt(resizeInfo.get("height")+""));
		String WEB_ROOT_PATH = Tools.getAbsolutelyPath();
		String thumbUrl = thumbFilePath.replace("\\","/").replace(WEB_ROOT_PATH, "");
		
		HashMap<String, Object> resMap = new HashMap<>();
		resMap.put("res", isSuccess);
		resMap.put("errorMsg", "缩略图生成出错");
		resMap.put("thumbUrl", thumbUrl);
		return resMap;
	}
}
