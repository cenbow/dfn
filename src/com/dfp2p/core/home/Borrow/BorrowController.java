package com.dfp2p.core.home.Borrow;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.InterestCount;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class BorrowController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(BorrowController.class);
	public String tplPath = "Borrow";
	
	@Resource(name="BorrowService")
	private BorrowService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		if(StringUtils.isBlank(pd.get("type"))){
			return this.showTip(mv,"error","3",  "数据有误");
		}
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		if(userInfo==null){
			return this.showTip(mv,"error","3",  "请先登陆",tplCommon.U("home/login/index"));
		}
		String borrowPostString = Common.firstLetterToUpper(pd.get("type").toLowerCase());
		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> thisBorrowType = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "borrow_alias", "borrow_name");
		if(thisBorrowType==null||!thisBorrowType.containsKey(borrowPostString)){
			return this.showTip(mv,"error","3",  "数据有误");
		}
		mv.addObject("BorrowType", thisBorrowType);
		mv.addObject("borrowPostString", borrowPostString);
		
		HashMap<String, String> imgType=new HashMap<>();
		imgType.put("1","项目证明");
		imgType.put("2","担保方资质证明");
		mv.addObject("imgType", imgType);
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList(borrowPostString);
		//Tools.printData(list);
		
		mv.addObject("borrow_use", Common.buildNewKVMap((Map<String, Object>) list.get("yt"), "key", "borrowUse"));
		mv.addObject("borrow_min", Common.buildNewKVMap((Map<String, Object>) list.get("zd"), "money", "money_text"));
		mv.addObject("borrow_max", Common.buildNewKVMap((Map<String, Object>) list.get("Max"), "money", "money_text"));
		mv.addObject("borrow_time", Common.buildNewKVMap((Map<String, Object>) list.get("Time"), "key", "money_text"));
		//mv.addObject("borrow_use", Common.buildNewKVMap((Map<String, Object>) list.get("yt"), "key", "borrowUse"));

		HashMap<String, String> borrowData= (HashMap<String, String>) list.get("borrow");
		mv.addObject("borrow_lixi",borrowData.get("borrowInterest").split("\\|"));
		mv.addObject("borrow_lixi_day",borrowData.get("borrowDayInterest").split("\\|"));

		//按月期限
		String[] borrow_duration = borrowData.get("borrowDuration").split("\\|");
		LinkedHashMap<String, String> borrowDurationMap = new LinkedHashMap<>();;
		int from=Integer.valueOf(borrow_duration[0]);
		int to=Integer.valueOf(borrow_duration[1]);
		for(int i=from;i<=to;i++){
			borrowDurationMap.put(i+"", i+"个月");
		}
		mv.addObject("borrow_month_time", borrowDurationMap);

		//按天期限
		String[] borrow_duration_day = borrowData.get("borrowDurationDay").split("\\|");
		LinkedHashMap<String, String> borrowDurationDayMap = new LinkedHashMap<>();;
		int fromDay=Integer.valueOf(borrow_duration_day[0]);
		int toDay=Integer.valueOf(borrow_duration_day[1]);
		for(int j=fromDay;j<=toDay;j++){
			borrowDurationDayMap.put(j+"", j+"天");
		}
		mv.addObject("borrow_day_time", borrowDurationDayMap);
		mv.addObject("repayment_type", Interface.getRepaymentTypeMap());
		switch (borrowPostString) {
				case "Normal"://信用标
					
					break;
				case "Vouch"://担保标
					
					break;
				case "Mortgage"://担保标
					
					break;
				case "Second"://秒还标
					mv.addObject("miao", "yes");
					break;
				case "Net"://净值标
					
				break;
			
				default:
					break;
		}
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		if(userInfo==null){
			return this.showTip(mv,"error","3",  "请先登陆",tplCommon.U("home/login/index"));
		}
		PageData pd = new PageData(request);

		
		HashMap<String, Object> borrowInfoMap= new HashMap<>();
		String borrowPostString = pd.post("vkey");
		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> thisBorrowType = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "borrow_alias", "key");
		if(thisBorrowType==null||!thisBorrowType.containsKey(borrowPostString)){
			return this.showTip(mv,"error","3",  "数据有误");
		}

		boolean isMiao=("4".equals(borrowInfoMap.get("borrow_type")));
		
		borrowInfoMap.put("borrow_money", pd.post("borrow_money"));	
		borrowInfoMap.put("borrow_uid", userInfo.get("id"));
		borrowInfoMap.put("borrow_name", pd.post("borrow_name"));
		borrowInfoMap.put("borrow_type", thisBorrowType.get(borrowPostString));
		borrowInfoMap.put("borrow_duration", (isMiao)?"1":pd.post("borrow_duration"));
		borrowInfoMap.put("borrow_interest_rate", pd.post("borrow_interest_rate"));
		
		String repaymentType = "yes".equals(pd.post("is_day"))?"4":(isMiao?"5":pd.post("repayment_type"));
		borrowInfoMap.put("repayment_type", repaymentType);
		
		String total = ("3".equals(repaymentType)||"4".equals(repaymentType))?"1":pd.post("borrow_duration");
		borrowInfoMap.put("total",total);
		borrowInfoMap.put("borrow_status", "0");
		borrowInfoMap.put("borrow_use", pd.post("borrow_use"));
		borrowInfoMap.put("add_time", Tools.getLongTime());
		borrowInfoMap.put("add_ip", Tools.getClientIp());
		borrowInfoMap.put("collect_day", pd.post("borrow_time"));
		borrowInfoMap.put("borrow_info", pd.post("borrow_info"));
		borrowInfoMap.put("reward_type", pd.post("reward_type"));
		
		String rewardMun=pd.post("reward_type_"+pd.post("reward_type")+"_value");
		borrowInfoMap.put("reward_type", pd.post("reward_type"));
		borrowInfoMap.put("reward_num", rewardMun);
		borrowInfoMap.put("borrow_min", pd.post("borrow_min"));
		borrowInfoMap.put("borrow_max", pd.post("borrow_max"));
		borrowInfoMap.put("borrow_pass", StringUtils.isBlank(pd.post("borrow_pass"))?"":borrowAndInvest.md5(pd.post("borrow_pass")));
		//计算利息
		logger.info("当前借款金额：：：：：：：：：：：：：："+borrowInfoMap.get("borrow_money"));
		HashMap<String, Object> interestDetail  = InterestCount.InterestCounter(borrowInfoMap.get("borrow_money")+"", borrowInfoMap.get("borrow_duration")+"", borrowInfoMap.get("borrow_interest_rate")+"", borrowInfoMap.get("repayment_type")+"", borrowInfoMap.get("add_time")+"");
		String interestAll =interestDetail.get("all")+"";
		borrowInfoMap.put("borrow_interest",interestAll);
		//计算管理费
		String borrowFeeRate = borrowAndInvest.getBorrowTypeManageFeeRate(borrowInfoMap.get("borrow_type")+"", borrowInfoMap.get("repayment_type")+"", borrowInfoMap.get("borrow_duration")+"");
		borrowInfoMap.put("borrow_fee", DfMath.round(DfMath.s2multi(pd.post("borrow_money"), borrowFeeRate+"")));//DfMath.round(DfMath.s2multi(pd.post("borrow_money"), DfMath.s2multi(borrowFeeRate,borrowInfoMap.get("borrow_duration")+"")+""))
		
		if(isMiao){
			HashMap<String, String> userMoney = borrowAndInvest.getUserMoneyIfo(userInfo.get("id"));
			String rewardMoney = "0";
			if((int)borrowInfoMap.get("reward_type")>0){
				if("1".equals(borrowInfoMap.get("reward_type"))) rewardMoney = DfMath.s2div(DfMath.s2multi(pd.post("borrow_money"), borrowInfoMap.get("reward_num")+"")+"", "100", 2)+"";
				else if("3".equals(borrowInfoMap.get("reward_type"))) rewardMoney = borrowInfoMap.get("reward_num")+"";
			}
			double needPayFee = DfMath.s2add(borrowInfoMap.get("borrow_fee")+"", borrowInfoMap.get("borrow_interest")+"");
			double needPayMoney = DfMath.s2add(borrowInfoMap.get("borrow_money")+"", rewardMoney);
			if(DfMath.add(needPayFee, needPayMoney)>Double.valueOf(userMoney.get("account_money"))) return this.showTip(mv, "error", "3", "发布此标您最少需保证您的帐户余额大于等于"+DfMath.add(needPayFee, needPayMoney)+"元，以确保可以支付利息，借款管理费和投标奖励费用");
		}
		//附加表信息
		Map<String, Object> swfUploadImg = PageData.sortRequestMap(pd.post());
		Map<String, String> swfImgTypeList = (Map<String, String>) swfUploadImg.get("swfimgtype");
		HashMap<String, String> swfImgInfoList = (HashMap<String, String>) swfUploadImg.get("picinfo");
		HashMap<String, String> swfImgUrlList = (HashMap<String, String>) swfUploadImg.get("swfimglist");
		List<HashMap<String, String>>imgType_1= new ArrayList<>();
		List<HashMap<String, String>>imgType_2= new ArrayList<>();
		if(swfImgTypeList!=null){
			for( Entry<String, String> e : swfImgTypeList.entrySet())
			{
				    HashMap<String, String> thisImgInfo = new HashMap<>();
				  	String imgKey= e.getKey();
				  	String imgValue =e.getValue();
				  	thisImgInfo.put("img", swfImgUrlList.get(imgKey));
				  	thisImgInfo.put("info", swfImgInfoList.get(imgKey));
				  	if("1".equals(imgValue)) imgType_1.add(thisImgInfo);
				  	else if("2".equals(imgValue)) imgType_2.add(thisImgInfo);
		    }
		}
		HashMap<String, Object> borrowAddInfo = new HashMap<>();
		borrowAddInfo.put("img_type_1", JSON.toJSONString(imgType_1));
		borrowAddInfo.put("img_type_2", JSON.toJSONString(imgType_2));

		String insertBorrowInfoRes = thisService.submitBorrow(borrowInfoMap, borrowAddInfo,mv);
		if("success".equals(insertBorrowInfoRes)) return this.showTip(mv, "success", "3", "借款申请提交成功，请等待初审");
		else  return this.showTip(mv, "error", "3", insertBorrowInfoRes);
	}
	public void swfupload(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		FormDataUtil fd = new FormDataUtil(request);
		Tools.printData(fd.getDataMap());
		FileItem fileItem = (FileItem)fd.get("Filedata");
		if(fileItem==null||"null".equals(fileItem)){
			ajaxmsg("未检测到文件域", 0, response);
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
