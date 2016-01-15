package com.dfp2p.core.home.Tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.InterestCount;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;

@Controller
public class ToolsController extends BaseHomeController {
	public String tplPath = "Tools";
	
	public ModelAndView calculator(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> repaymentType = Interface.getRepaymentTypeMap();
		mv.addObject("repaymentType", repaymentType);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView calculator_res_ajax(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> repaymentType = Interface.getRepaymentTypeMap();
		PageData pd = new PageData(request);
		List<String[]> validatorMap = new ArrayList();
		
		validatorMap.add(Tools.buildValidatorObject("repayment_type","还款方式不对", repaymentType.containsKey(pd.get("repayment_type"))));
		validatorMap.add(Tools.buildValidatorObject("borrow_money","金额只能是数字", ValidatorUtil.isNumeric(pd.get("borrow_money")+"")));
		validatorMap.add(Tools.buildValidatorObject("borrow_duration","期限只能是整数", ValidatorUtil.isInteger(pd.get("borrow_duration")+"")));
		validatorMap.add(Tools.buildValidatorObject("borrow_duration","期限不能超过36个月", DfMath.toIntValue(pd.get("borrow_duration")+"")<37));
		validatorMap.add(Tools.buildValidatorObject("borrow_duration","期限不能小于1个月", DfMath.toIntValue(pd.get("borrow_duration")+"")>0));
		validatorMap.add(Tools.buildValidatorObject("borrow_interest_rate","利率只能是数字", ValidatorUtil.isNumeric(pd.get("borrow_interest_rate")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		if(fieldCheck.size()>0){
			mv.addObject("errorMsg",fieldCheck.get(0));
			return this.getTplView(request,response, tplPath, mv);
		}
		
		String tradingStartTime=Tools.getLongTime()+"";
		//还款计划
		HashMap<String, Object> repaymentPlan = InterestCount.InterestCounter(pd.get("borrow_money"), pd.get("borrow_duration"), pd.get("borrow_interest_rate"), pd.get("repayment_type"), tradingStartTime);
		List<Map<String, String>> repaymentList = ((List<Map<String, String>>)repaymentPlan.get("list"));
		String hasPayString="0";
		int totalSort=0;
		String allNeedPay = DfMath.s2add(repaymentPlan.get("all")+"",pd.get("borrow_money"))+"";
		for (int i = 0; i < repaymentList.size(); i++) {
			logger.info("所有要还的"+allNeedPay);
			Map<String	, String> thisRepayment = repaymentList.get(i);
				String thisPayAll = DfMath.s2add(thisRepayment.get("principal")+"", thisRepayment.get("interest")+"")+"";
				allNeedPay=DfMath.s2sub(allNeedPay, thisPayAll+"")+"";
				
				thisRepayment.put("has_repayment", "0");
				thisRepayment.put("repayment_status", "待还款");
				thisRepayment.put("left_money", allNeedPay);
				thisRepayment.put("this_all_pay", thisPayAll);
				thisRepayment.put("deadline", Tools.TimeStamp2Date(thisRepayment.get("endDate"), "yyyy-MM-dd"));
		}
		repaymentPlan.put("invest_money",pd.get("borrow_money"));
		repaymentPlan.put("has_pay_money", hasPayString);
		repaymentPlan.put("has_pay_times",totalSort );
		repaymentPlan.put("left_pay_money",repaymentPlan.get("all") );
		mv.addObject("repaymentPlan", repaymentPlan);
		return this.getTplView(request,response, tplPath, mv);
	}
	
}


