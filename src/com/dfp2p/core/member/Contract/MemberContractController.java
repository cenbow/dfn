package com.dfp2p.core.member.Contract;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.HtmlGenerator.HtmlGenerator;
import com.dfp2p.util.pdf.PdfGenerator;
import com.dfp2p.utils.DateUtils;
import com.dfp2p.utils.NumberUtil;


@Controller
public class MemberContractController extends BaseMemberController {
	public String tplPath = "Capital";
	@Resource(name="memberContractService")
	private MemberContractService thisService;
	
	@SuppressWarnings("unchecked")
	public void index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String investIdString = pd.get("id");
		String borrowId="0";
		String contractIdString="";
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		//合同相关参数
		HashMap<String, String> investInfo=null;
		try {
			investInfo = thisService.getInvestInfo(investIdString, mv);
			borrowId = investInfo.get("borrow_id");
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			ajaxmsg("获取投标信息有误", 0, response);
			return ;
		}
		
		HashMap<String, Object> borrowInfo=null;
		try {
			borrowInfo = thisService.getBorrowInfo(borrowId, mv);
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			ajaxmsg("获取标的信息有误", 0, response);
			return ;
		}

		logger.info(borrowInfo);
		HashMap<String, String> articleInfo= new HashMap<>();
		try {
			articleInfo = thisService.getArticleInfo(((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("investor_contract_id")+"", mv);
			contractIdString = Tools.TimeStamp2Date(((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("recheck_time")+"", "yyyyMMdd")+Tools.getDoubleStrings(UserInfo.get("id")+"")+"1";
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("参数有误", 0, response);
			return ;
		}
		if(Common.isBlankInMap(articleInfo, "content")){
			ajaxmsg("参数有误", 0, response);
			return ;
		}
		String templateContent = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>合同内容</title><style type=\"text/css\">body{font-family:SimSun;}.img{position:absolute; left:100px; top:500px}</style></head><body>";
		templateContent+=articleInfo.get("content");
		templateContent+="</body></html>";

		//出借人
		PageData pd2 = new PageData();
		String investor_uid = investInfo.get("investor_uid");
		pd2.put("id",investor_uid);
		Map<String, String> invUserInfo = thisService.getUser_info(pd2, mv);	
		String invRealName = invUserInfo.get("real_name");
		
		//出借人用户名=borrowInfo.borrowInfo.user_name
		String invUserName = invUserInfo.get("user_name");
		//身份证号
		String invIdCard = invUserInfo.get("idcard");
		
		//借款人
		PageData pd3 = new PageData();
		String borrow_uid = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_uid");
		pd3.put("id",borrow_uid);
		Map<String, String> borUserInfo = thisService.getUser_info(pd3, mv);	
		String borRealName = borUserInfo.get("real_name");
		//借款人用户名
		//身份证号
		String borIdCard = borUserInfo.get("idcard");
		//出借人用户名=borrowInfo.borrowInfo.user_name
		String broUserName = borUserInfo.get("user_name");
		//借款金额小写
		String borrowMoney =  investInfo.get("investor_capital");
		//借款金额大写
		BigDecimal borrowMoney_bd = new BigDecimal(borrowMoney);
		String borrowMoney_CN  = NumberUtil.number2CNMontrayUnit(borrowMoney_bd);
		//借款用途
		String borrowUse = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_use");
		String borrowType = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_type");
		
		// 标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> thisBorrowType = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"),
				"key", "borrow_alias");

		String borrowPostString = (String) thisBorrowType.get(borrowType);
		if (borrowPostString == null || !thisBorrowType.containsValue(borrowPostString)) {
			ajaxmsg("获取借款用途，数据有误", 0, response);
		}
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList(borrowPostString);
				
		String borrowUse_CN = (String)Common.buildNewKVMap((Map<String, Object>) list.get("yt"), "key", "borrowUse").get(borrowUse);
		
		//借款期限
		String borrowDuration = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_duration");
		String borrowUnit = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("duration_unit");
		borrowDuration = borrowDuration+borrowUnit;
		//年化利率
		String borrowInterestRate = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_interest_rate");
		double borrowInterestRate_l = 0;
		try {
			borrowInterestRate_l =  NumberUtil.roundForNumber(Double.valueOf(borrowInterestRate),2);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
		String borrowInterestRate_newStr = borrowInterestRate_l+"%";
		
		//借款期限内利息小写
		String investorInterest = investInfo.get("investor_interest");
		//借款期限内利息大写
		BigDecimal investorInterest_bd = new BigDecimal(investorInterest);
		String investorInterest_CN  = NumberUtil.number2CNMontrayUnit(investorInterest_bd);
		//还款方式
		String repaymentType = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("repayment_type");
		String repaymentType_CN = Interface.getRepaymentTypeMap().get(repaymentType);
		
		//时间
		String recheckTime = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("recheck_time");
		
		String recheck_year= "";
		String recheck_month = "";	
		String recheck_day = "";
		if(recheckTime!=null&&!"".equals(recheckTime)&&Long.parseLong(recheckTime)>0){
		    Date date = Tools.TimeStampDate(recheckTime);
		
	
		
			Calendar cal=Calendar.getInstance();//使用日历类
			cal.setTime(date);
			recheck_year=cal.get(Calendar.YEAR)+"";//得到年
			recheck_month=cal.get(Calendar.MONTH)+1+"";//得到月，因为从0开始的，所以要加1
			recheck_day=cal.get(Calendar.DAY_OF_MONTH)+"";//得到天
		 }
		
		 
		
		
		
		//生成合同
		Map<String, Object> tplMap=new HashMap<>();
		tplMap.put("contract_id", contractIdString);
		tplMap.put("borrowInfo", borrowInfo);
		tplMap.put("investInfo", investInfo);
		
		tplMap.put("invRealName", invRealName);
		tplMap.put("invIdCard", invIdCard);
		tplMap.put("invUserName", invUserName);
		tplMap.put("borRealName", borRealName);
		tplMap.put("borIdCard", borIdCard);
		tplMap.put("broUserName", broUserName);
		
		tplMap.put("borrowUse_CN", borrowUse_CN);
		
		tplMap.put("borrowMoney", borrowMoney);
		tplMap.put("borrowMoney_CN", borrowMoney_CN);
		tplMap.put("borrowDuration", borrowDuration);
		tplMap.put("borrowInterestRate", borrowInterestRate_newStr);
		tplMap.put("investorInterest", investorInterest);
		tplMap.put("investorInterest_CN", investorInterest_CN);
		tplMap.put("repaymentType_CN", repaymentType_CN);
		
		tplMap.put("recheck_year", recheck_year);
		tplMap.put("recheck_month", recheck_month);
		tplMap.put("recheck_day", recheck_day);

		String htmlStr;
		try {
			htmlStr = HtmlGenerator.generate("testtpl", templateContent, tplMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("合同文本生成失败", 0, response);
			return ;
		}

		String outputFile = sysConfig.getSysParm("webrootPath")+"/PDF/"+borrowId+"/"+contractIdString+".pdf";
		
        try {
			PdfGenerator.generate(htmlStr, outputFile);
		} catch (Exception e) {
			logger.info("outputFile"+outputFile+e.toString());
			// TODO 自动生成的 catch 块
			ajaxmsg("合同PDF生成失败", 0, response);
			return ;
		} 
        
        
        //下载
        response.setContentType("application/x-msdownload;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="+contractIdString+".pdf");
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new FileInputStream(outputFile);
		    out = response.getOutputStream();
			 int b;  
		     while((b=in.read())!= -1)  
		      {  
		            out.write(b);  
		     }  
		} catch (Exception e) {
			logger.equals("下载失败");
		}finally{
			if(in!=null)
				try {
					in.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					logger.error("in关闭失败");
				}
			if(out!=null)
				try {
					out.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					logger.error("out关闭失败");
				}
		}
		return ;
	}

	public void downBorrowContract(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		//String investIdString = pd.get("id");
		String borrowId=pd.get("id");
		String contractIdString="";
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		//合同相关参数

		
		HashMap<String, Object> borrowInfo=null;
		try {
			borrowInfo = thisService.getBorrowInfo(borrowId, mv);
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			ajaxmsg("获取标的信息有误", 0, response);
			return ;
		}

		logger.info(borrowInfo);
		HashMap<String, String> articleInfo= new HashMap<>();
		try {
			articleInfo = thisService.getArticleInfo(((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrower_contract_id")+"", mv);
			contractIdString = Tools.TimeStamp2Date(((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("recheck_time")+"", "yyyyMMdd")+Tools.getDoubleStrings(UserInfo.get("id")+"")+"1";
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("参数有误", 0, response);
			return ;
		}
		if(Common.isBlankInMap(articleInfo, "content")){
			ajaxmsg("参数有误", 0, response);
			return ;
		}
		String templateContent = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>合同内容</title><style type=\"text/css\">body{font-family:SimSun;}.img{position:absolute; left:100px; top:500px}</style></head><body>";
		templateContent+=articleInfo.get("content");
		templateContent+="</body></html>";


		
		//借款人
		PageData pd3 = new PageData();
		String borrow_uid = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_uid");
		pd3.put("id",borrow_uid);
		Map<String, String> borUserInfo = thisService.getUser_info(pd3, mv);	
		String borRealName = borUserInfo.get("real_name");
		//借款人用户名
		//身份证号
		String borIdCard = borUserInfo.get("idcard");
		//出借人用户名=borrowInfo.borrowInfo.user_name
		String broUserName = borUserInfo.get("user_name");
;
		//借款用途
		String borrowUse = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_use");
		String borrowType = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_type");
		
		//借款金额
		String borrowMoney = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_money");
		//借款金额大写
		BigDecimal borrowMoney_bd = new BigDecimal(borrowMoney);
		String borrowMoney_CN  = NumberUtil.number2CNMontrayUnit(borrowMoney_bd);
		
		
		// 标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> thisBorrowType = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"),
				"key", "borrow_alias");

		String borrowPostString = (String) thisBorrowType.get(borrowType);
		if (borrowPostString == null || !thisBorrowType.containsValue(borrowPostString)) {
			ajaxmsg("获取借款用途，数据有误", 0, response);
		}
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList(borrowPostString);
				
		String borrowUse_CN = (String)Common.buildNewKVMap((Map<String, Object>) list.get("yt"), "key", "borrowUse").get(borrowUse);
		
		//借款期限
		String borrowDuration = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_duration");
		String borrowUnit = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("duration_unit");
		borrowDuration = borrowDuration+borrowUnit;
		//年化利率
		String borrowInterestRate = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_interest_rate");
		double borrowInterestRate_l = 0;
		try {
			borrowInterestRate_l =  NumberUtil.roundForNumber(Double.valueOf(borrowInterestRate),2);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
		String borrowInterestRate_newStr = borrowInterestRate_l+"%";
		
		//借款期限内利息小写
		String borrowInterest = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_interest");
		//借款期限内利息大写
		BigDecimal investorInterest_bd = new BigDecimal(borrowInterest);
		String borrowInterest_CN  = NumberUtil.number2CNMontrayUnit(investorInterest_bd);

		//还款方式
		String repaymentType = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("repayment_type");
		String repaymentType_CN = Interface.getRepaymentTypeMap().get(repaymentType);
		
		//时间
		String recheckTime = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("recheck_time");
		
		String recheck_year= "";
		String recheck_month = "";	
		String recheck_day = "";
		if(recheckTime!=null&&!"".equals(recheckTime)&&Long.parseLong(recheckTime)>0){
		    Date date = Tools.TimeStampDate(recheckTime);
		
	
		
			Calendar cal=Calendar.getInstance();//使用日历类
			cal.setTime(date);
			recheck_year=cal.get(Calendar.YEAR)+"";//得到年
			recheck_month=cal.get(Calendar.MONTH)+1+"";//得到月，因为从0开始的，所以要加1
			recheck_day=cal.get(Calendar.DAY_OF_MONTH)+"";//得到天
		 }
		
		 
		
		
		
		//生成合同
		Map<String, Object> tplMap=new HashMap<>();
		tplMap.put("contract_id", contractIdString);
		tplMap.put("borrowInfo", borrowInfo);
		
		tplMap.put("borRealName", borRealName);
		tplMap.put("borIdCard", borIdCard);
		tplMap.put("broUserName", broUserName);
		
		tplMap.put("borrowInterest", borrowInterest);
		tplMap.put("borrowInterest_CN", borrowInterest_CN);
		tplMap.put("borrowUse_CN", borrowUse_CN);
		
		tplMap.put("borrowMoney", borrowMoney);
		tplMap.put("borrowMoney_CN", borrowMoney_CN);
		tplMap.put("borrowDuration", borrowDuration);
		tplMap.put("borrowInterestRate", borrowInterestRate_newStr);
		tplMap.put("repaymentType_CN", repaymentType_CN);
		
		tplMap.put("recheck_year", recheck_year);
		tplMap.put("recheck_month", recheck_month);
		tplMap.put("recheck_day", recheck_day);

		String htmlStr;
		try {
			htmlStr = HtmlGenerator.generate("testtpl", templateContent, tplMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("合同文本生成失败", 0, response);
			return ;
		}

		String outputFile = sysConfig.getSysParm("webrootPath")+"/PDF/"+borrowId+"/"+contractIdString+".pdf";
		
        try {
			PdfGenerator.generate(htmlStr, outputFile);
		} catch (Exception e) {
			logger.info("outputFile"+outputFile+e.toString());
			// TODO 自动生成的 catch 块
			ajaxmsg("合同PDF生成失败", 0, response);
			return ;
		} 
        
        
        //下载
        response.setContentType("application/x-msdownload;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="+contractIdString+".pdf");
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new FileInputStream(outputFile);
		    out = response.getOutputStream();
			 int b;  
		     while((b=in.read())!= -1)  
		      {  
		            out.write(b);  
		     }  
		} catch (Exception e) {
			logger.equals("下载失败");
		}finally{
			if(in!=null)
				try {
					in.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					logger.error("in关闭失败");
				}
			if(out!=null)
				try {
					out.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					logger.error("out关闭失败");
				}
		}
		return ;
	}
	
	public void downCreditContract(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		//String investIdString = pd.get("id");
		String creditId=pd.get("id");
		String contractIdString="";
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		//合同相关参数

		
		Map<String, String> creditAssignmentInfo=null;
		try {
			creditAssignmentInfo = thisService.getCreditAssignmentInfo(creditId, mv);
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			ajaxmsg("获取标的信息有误", 0, response);
			return ;
		}

		HashMap<String, String> articleInfo= new HashMap<>();
		
		try {
			articleInfo = thisService.getArticleInfo(creditAssignmentInfo.get("contract_id"), mv);
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("参数有误", 0, response);
			return ;
		}
		if(Common.isBlankInMap(articleInfo, "content")){
			ajaxmsg("参数有误", 0, response);
			return ;
		}
		String borrowId = creditAssignmentInfo.get("borrow_id");
		HashMap<String, Object> borrowInfo=null;
		try {
			borrowInfo = thisService.getBorrowInfo(borrowId, mv);
			contractIdString = Tools.TimeStamp2Date(((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("recheck_time")+"", "yyyyMMdd")+Tools.getDoubleStrings(UserInfo.get("id")+"")+"1";
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			ajaxmsg("获取标的信息有误", 0, response);
			return ;
		}
		
		String templateContent = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>合同内容</title><style type=\"text/css\">body{font-family:SimSun;}.img{position:absolute; left:100px; top:500px}</style></head><body>";
		templateContent+=articleInfo.get("content");
		templateContent+="</body></html>";


		
		//出让人
		PageData pd3 = new PageData();
		String creditUid = creditAssignmentInfo.get("uid");
		pd3.put("id",creditUid);
		Map<String, String> creditUserInfo = thisService.getUser_info(pd3, mv);	
		String borRealName = creditUserInfo.get("real_name");
		//借款人用户名
		//身份证号
		String borIdCard = creditUserInfo.get("idcard");
		//出借人用户名=borrowInfo.borrowInfo.user_name
		String broUserName = creditUserInfo.get("user_name");
		
		
		//接受人
		PageData pd4 = new PageData();
		String dealUid = creditAssignmentInfo.get("deal_uid");
		pd3.put("id",dealUid);
		Map<String, String> dealUserInfo = thisService.getUser_info(pd4, mv);	
		String dealUserRealName = dealUserInfo.get("real_name");
		//接受人用户名
		//身份证号
		String dealUserIdCard = dealUserInfo.get("idcard");
		//出借人用户名=borrowInfo.borrowInfo.user_name
		String dealUserName = dealUserInfo.get("user_name");
		
		
		String creditMoney = creditAssignmentInfo.get("credit_money");
		String transferMoney = creditAssignmentInfo.get("transfer_fee");
		
		String hasTransfer = creditAssignmentInfo.get("has_transfer");
		
/*		long creditMoney_l = Integer.valueOf(creditMoney);
		long transferMoney_l = Integer.valueOf(transferMoney);
		
		long soldMoney = creditMoney_l + transferMoney_l;*/
;
		//借款用途
		String borrowUse = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_use");
		String borrowType = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_type");
		
		//借款金额
		String borrowMoney = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_money");
		//借款金额大写
		BigDecimal borrowMoney_bd = new BigDecimal(borrowMoney);
		String borrowMoney_CN  = NumberUtil.number2CNMontrayUnit(borrowMoney_bd);
		
		
		// 标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> thisBorrowType = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"),
				"key", "borrow_alias");

		String borrowPostString = (String) thisBorrowType.get(borrowType);
		if (borrowPostString == null || !thisBorrowType.containsValue(borrowPostString)) {
			ajaxmsg("获取借款用途，数据有误", 0, response);
		}
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList(borrowPostString);
				
		String borrowUse_CN = (String)Common.buildNewKVMap((Map<String, Object>) list.get("yt"), "key", "borrowUse").get(borrowUse);
		
		//借款期限
		String borrowDuration = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_duration");
		String borrowUnit = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("duration_unit");
		borrowDuration = borrowDuration+borrowUnit;
		//年化利率
		String borrowInterestRate = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_interest_rate");
		double borrowInterestRate_l = 0;
		try {
			borrowInterestRate_l =  NumberUtil.roundForNumber(Double.valueOf(borrowInterestRate),2);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
		String borrowInterestRate_newStr = borrowInterestRate_l+"%";
		
		//借款期限内利息小写
		String borrowInterest = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("borrow_interest");
		//借款期限内利息大写
		BigDecimal investorInterest_bd = new BigDecimal(borrowInterest);
		String borrowInterest_CN  = NumberUtil.number2CNMontrayUnit(investorInterest_bd);

		//还款方式
		String repaymentType = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("repayment_type");
		String repaymentType_CN = Interface.getRepaymentTypeMap().get(repaymentType);
		
		//时间
		String recheckTime = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("recheck_time");
		
		String recheck_year= "";
		String recheck_month = "";	
		String recheck_day = "";
		if(recheckTime!=null&&!"".equals(recheckTime)&&Long.parseLong(recheckTime)>0){
		    Date date = Tools.TimeStampDate(recheckTime);
		
	
		
			Calendar cal=Calendar.getInstance();//使用日历类
			cal.setTime(date);
			recheck_year=cal.get(Calendar.YEAR)+"";//得到年
			recheck_month=cal.get(Calendar.MONTH)+1+"";//得到月，因为从0开始的，所以要加1
			recheck_day=cal.get(Calendar.DAY_OF_MONTH)+"";//得到天
		 }
		
		//时间
		String creditTime = creditAssignmentInfo.get("success_time");
		
		String creditTime_year= "";
		String creditTime_month = "";	
		String creditTime_day = "";
		if(creditTime!=null&&!"".equals(creditTime)&&Long.parseLong(creditTime)>0){
		    Date date = Tools.TimeStampDate(creditTime);
		
	
		
			Calendar cal=Calendar.getInstance();//使用日历类
			cal.setTime(date);
			creditTime_year=cal.get(Calendar.YEAR)+"";//得到年
			creditTime_month=cal.get(Calendar.MONTH)+1+"";//得到月，因为从0开始的，所以要加1
			creditTime_day=cal.get(Calendar.DAY_OF_MONTH)+"";//得到天
		 }
		
		String deadline = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("dead_line");
		String repayEndTime = "1970-01-01";
		if(deadline!=null&&!"".equals(deadline)&&Long.parseLong(deadline)>0){
			repayEndTime = DateUtils.timeStamp2Date(deadline, DateUtils.DATE_FORMAT_PAR);
		}
		String checkTime = ((HashMap<String, String>)borrowInfo.get("borrowInfo")).get("check_time");
		String borrowTime = "1970-01-01";
		if(checkTime!=null&&!"".equals(checkTime)&&Long.parseLong(checkTime)>0){
			borrowTime = DateUtils.timeStamp2Date(checkTime, DateUtils.DATE_FORMAT_PAR);
		}
		
		//生成合同
		Map<String, Object> tplMap=new HashMap<>();
		tplMap.put("contract_id", contractIdString);
		tplMap.put("borrowInfo", borrowInfo);
		
		tplMap.put("borRealName", borRealName);
		tplMap.put("borIdCard", borIdCard);
		tplMap.put("broUserName", broUserName);
		
		tplMap.put("dealUserRealName", dealUserRealName);
		tplMap.put("dealUserIdCard", dealUserIdCard);
		tplMap.put("dealUserName", dealUserName);
		
		tplMap.put("borrowInterest", borrowInterest);
		tplMap.put("borrowInterest_CN", borrowInterest_CN);
		tplMap.put("borrowUse_CN", borrowUse_CN);
		
		tplMap.put("borrowMoney", borrowMoney);
		tplMap.put("borrowMoney_CN", borrowMoney_CN);
		tplMap.put("borrowDuration", borrowDuration);
		tplMap.put("borrowInterestRate", borrowInterestRate_newStr);
		tplMap.put("repaymentType_CN", repaymentType_CN);
		
		tplMap.put("recheck_year", recheck_year);
		tplMap.put("recheck_month", recheck_month);
		tplMap.put("recheck_day", recheck_day);
		
		tplMap.put("creditTime_year", creditTime_year);
		tplMap.put("creditTime_month", creditTime_month);
		tplMap.put("creditTime_day", creditTime_day);
		
		tplMap.put("soldMoney", hasTransfer);
		tplMap.put("creditMoney", creditMoney);
		
		tplMap.put("borrowTime", borrowTime);//借款开始日
		tplMap.put("repayEndTime", repayEndTime);//借款到期日
		
		
		

		String htmlStr;
		try {
			htmlStr = HtmlGenerator.generate("testtpl", templateContent, tplMap);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("合同文本生成失败", 0, response);
			return ;
		}

		String outputFile = sysConfig.getSysParm("webrootPath")+"/PDF/"+borrowId+"/"+contractIdString+".pdf";
		
        try {
			PdfGenerator.generate(htmlStr, outputFile);
		} catch (Exception e) {
			logger.info("outputFile"+outputFile+e.toString());
			// TODO 自动生成的 catch 块
			ajaxmsg("合同PDF生成失败", 0, response);
			return ;
		} 
        
        
        //下载
        response.setContentType("application/x-msdownload;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="+contractIdString+".pdf");
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new FileInputStream(outputFile);
		    out = response.getOutputStream();
			 int b;  
		     while((b=in.read())!= -1)  
		      {  
		            out.write(b);  
		     }  
		} catch (Exception e) {
			logger.equals("下载失败");
		}finally{
			if(in!=null)
				try {
					in.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					logger.error("in关闭失败");
				}
			if(out!=null)
				try {
					out.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					logger.error("out关闭失败");
				}
		}
		return ;
	}
}
