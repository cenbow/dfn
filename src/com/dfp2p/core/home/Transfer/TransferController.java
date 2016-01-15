package com.dfp2p.core.home.Transfer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.compiler.ast.Variable;

import javax.annotation.Resource;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.InterestCount;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class TransferController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(TransferController.class);
	public String tplPath = "Transfer";
	
	@Resource(name="TransferService")
	private TransferService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, Object> transferList = thisService.getTransferList(pd, mv);
		mv.addObject("transferList", transferList);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView transfer_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		return this.index(request,response, mv);
	}
	
	@SuppressWarnings("unchecked")
	public ModelAndView detail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, String> transferInfo= new HashMap<>();
		if(StringUtils.isBlank(pd.get("id"))){
			return this.showTip(mv, "error", "3", "数据有误");
		}else{
			mv.addObject("currentTime", Tools.getLongTime());
			try {
				HashMap<String, Object> tranInfo = thisService.getTransferInfo(pd, mv);
				HashMap<String, String> borrowInfo=new HashMap<>();
				if(tranInfo.containsKey("transferInfo")){
					transferInfo = (HashMap<String, String>)tranInfo.get("transferInfo");
					mv.addObject("transferInfo",transferInfo);
					HashMap<String, Object> res = thisService.getBorrowInfo(transferInfo, mv);
					if(res!=null) mv.addObject("borrowInfo",res.get("borrowInfo"));

					
					HashMap<String, Object> investorList = thisService.getAcceptDetailList(transferInfo,mv);
					mv.addObject("investorList",investorList);
				}
				//转让明细
				List<Map<String, String>> repaymentList = thisService.getTransferDetailList(transferInfo, mv);
				mv.addObject("repaymentList", repaymentList);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				logger.error("获取标的信息出错："+e.toString());
			}
			return this.getTplView(request,response, tplPath, mv);
		}
	}
	
	public ModelAndView borrow_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, Object> investorList = new HashMap<>();
		try {
			HashMap<String, String> transferInfo = new HashMap<>();
			transferInfo.put("id", pd.get("id"));
			investorList = thisService.getAcceptDetailList(transferInfo,mv);
			if(investorList!=null) mv.addObject("investorList",investorList);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			logger.error("获取投标数据出错"+e.toString());
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void transferMoney(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> res = new HashMap<>();
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, String> transferInfo = new HashMap<>();
		if(userInfo==null){
			ajaxmsg("请先登陆！", 0, response);
			return ;
		}
		try {
			HashMap<String, Object> tranInfo = thisService.getTransferInfo(pd, mv);
			transferInfo=(HashMap<String, String>) tranInfo.get("transferInfo");
		} catch (Exception e) {
			logger.error("投标获取数据出错"+e.toString());
			ajaxmsg("操作有误", 0, response);
			return;
		}

		if(transferInfo.get("uid").equals(userInfo.get("id"))){
			ajaxmsg("不能承接自己转让的债权", 0, response);
			return ;
		}
		
		HashMap<String, String> userMoneyInfo = borrowAndInvest.getUserMoneyIfo(userInfo.get("id"));
		if(DfMath.s2round(userMoneyInfo.get("account_money"))<DfMath.s2round(pd.post("number"))){
			ajaxmsg("帐户余额不足,点击确认去充值！", 2, response);
			return ;
		}
		
		if(DfMath.toIntValue(transferInfo.get("need"))<DfMath.toIntValue(pd.post("number"))){
			ajaxmsg("当前剩余可承接金额为！"+transferInfo.get("need")+"元", 2, response);
			return ;
		}

		if("0".equals(pd.post("is_confirm"))){
			String investRes = borrowAndInvest.creditAssign(pd.post("id"), userInfo.get("id"), pd.post("number"), null);
			if("success".equals(investRes)){
				ajaxmsg("承接成功", 1, response);
				return ;
			}else{
				ajaxmsg(investRes, 0, response);
				return ;
			}
		}else{
			ajaxmsg("确定要承接"+pd.post("number")+"元的债权吗？", 4, response);
		}
	}
	
	
}
