package com.dfp2p.core.member.Card;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@Controller
public class MemberCardController extends BaseMemberController {
	public String tplPath = "Card";

	@Resource(name = "memberCardService")
	private MemberCardService thisService;

	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		Map<String, Object> cardDetail = thisService.getCardDetail(pd);
		mv.addObject("no_expired", cardDetail.get("no_expired"));
		mv.addObject("expired", cardDetail.get("expired"));
		mv.addObject("used", cardDetail.get("used"));

		HashMap<String, String> statusInfoHashMap = new HashMap<>();
		statusInfoHashMap.put("1", "已使用");
		statusInfoHashMap.put("0", "未使用");
		mv.addObject("statusInfo", statusInfoHashMap);

		HashMap<String, Object> list = thisService.getMyCardList(pd, mv);
		mv.addObject("list", list);
		return this.getTplView(request, response, tplPath, mv);
	}

	public ModelAndView list_page(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);

		HashMap<String, String> statusInfoHashMap = new HashMap<>();
		statusInfoHashMap.put("1", "已使用");
		statusInfoHashMap.put("0", "未使用");
		mv.addObject("statusInfo", statusInfoHashMap);

		HashMap<String, Object> list = thisService.getMyCardList(pd, mv);
		mv.addObject("list", list);
		return this.getTplView(request, response, tplPath, mv);
	}

	public ModelAndView recommend(HttpServletRequest request,	HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		
		String xcode=thisService.getUserXCode(UserInfo.get("id"));
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
		return this.getTplView(request, response, tplPath, mv);
	}

	public ModelAndView recommendlog(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, Object> data = thisService.getRecommendList(userInfo.get("id"));
		mv.addObject("data", data);
		return this.getTplView(request, response, tplPath, mv);
	}
}
