package com.dfp2p.core.app.finance;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.baseController.BaseAppController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DfMath;

 

@Controller
public class AppFinanceController extends BaseAppController {
	public String tplPath = "Finance";
	
	 
	public void detail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String,Object> result  = new HashMap<String,Object>();
		String userId = this.getId(request);
		if("0".equals(userId)){
			result.put("message","请先登陆");
			result.put("status","100");
		}else{
			HashMap<String, String> userMoney = borrowAndInvest.getUserMoneySummary(userId);

			result.put("allMoney", userMoney.get("all_money"));
			result.put("accountMoney", userMoney.get("account_money"));
			result.put("collectMoney", userMoney.get("money_collect"));
			result.put("freezeMoney", userMoney.get("money_freeze"));
			result.put("rechargeMoney",tplCommon.defaultValue(userMoney.get("recharge_money"),"0.00"));
			result.put("withdrawMoney", tplCommon.defaultValue(userMoney.get("withdraw_money"),"0.00"));
		}
		ajaxmsg(result, response);
		 

		 
	}
	
	 
	 
}
