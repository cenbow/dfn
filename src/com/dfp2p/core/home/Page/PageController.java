package com.dfp2p.core.home.Page;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.member.Card.MemberCardService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@Controller
public class PageController extends BaseHomeController {
	private static Log log = LogFactory.getLog(PageController.class);
	@Resource(name = "memberCardService")
	private MemberCardService memberCardService;
	public String tplPath = "Page";
	
	public ModelAndView content(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String actionNameString=pd.get("i");
		if(!actionNameString.matches("[a-zA-Z0-9]{1,20}")){
			return this.showTip(mv, "success", "3", "数据有误");
		}
		if("extend".equals(actionNameString)){
			return this.extend(request, response, mv);
		}
		if("help".equals(actionNameString)){
			return this.help(request, response, mv);
		}
		
		String tplPath = "/Home/Page/"+actionNameString;
		ModelAndView mve = this.getTplView(request,response, tplPath, mv);
		mve.setViewName(tplPath);
		return mve;
	}
	public ModelAndView help(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String tplPath="";
		if(DfMath.toIntValue(pd.get("id"))>0){
			tplPath = "/Home/Page/help_content";	
			Map<String, String> vo = BaseService.getOne("article", Tools.BuildWhereMap("id", pd.get("id"), "="), null);
			mv.addObject("vo", vo);
		}else{
			tplPath = "/Home/Page/help";
		}
		
		ModelAndView mve = this.getTplView(request,response, tplPath, mv);
		mve.setViewName(tplPath);
		return mve;
	}
	public ModelAndView extend(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		
		if(UserInfo==null){
			
			mv.addObject("xcode", "请先登陆");
			mv.addObject("xurl", "请先登陆");
			mv.addObject("ximg", "/UploadFile/Qcode/default.png");
			
		}else{
		String xcode=memberCardService.getUserXCode(UserInfo.get("id"));
		if(StringUtils.isBlank(xcode)){
			return this.showTip(mv, "error", "3", "获取推广码失败");
		}
		
		String text = "http://"+request.getServerName()+tplCommon.U("Home/register/index")+"?referrer="+xcode;
		int width = 300;
		int height = 300;
		String format = "png";
		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		BitMatrix bitMatrix = null;
		try {
			bitMatrix = new MultiFormatWriter().encode(text,BarcodeFormat.QR_CODE, width, height, hints);
		} catch (WriterException e) {
			logger.error("生成二维码出错");
		}
		String WEB_ROOT_PAT = Tools.getAbsolutelyPath();
		String saveFilePath = WEB_ROOT_PAT+"UploadFile/Qcode/";
		String fileNameString=borrowAndInvest.md5(UserInfo.get("id")+xcode)+".png";
	
		File outputFile = new File(saveFilePath+fileNameString);
		if (!outputFile.exists()){
			outputFile.mkdirs();
			try {
				MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
			} catch (IOException e) {
				logger.error("保存二维码出错");
			}
		}
		
		mv.addObject("xcode", xcode);
		mv.addObject("xurl", text);
		mv.addObject("ximg", "/UploadFile/Qcode/"+fileNameString);
		}
		String tplPath = "/Home/Page/extend";
		ModelAndView mve = this.getTplView(request,response, tplPath, mv);
		mve.setViewName(tplPath);
		return mve;
	}
	
	
}


