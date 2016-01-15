package com.dfp2p.core.member.Withdraw;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.member.Myinvest.MemberMyinvestService;
import com.dfp2p.core.member.Recharge.MemberRechargeService;
import com.dfp2p.core.member.Safe.MemberSafeService;
import com.dfp2p.core.thirdparty.ThirdpartyTpqueryController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class MemberWithdrawController extends BaseMemberController {
	public String tplPath = "Withdraw";
	@Resource(name="memberWithdrawService")
	private MemberWithdrawService thisService;
	@Resource(name="memberSafeService")
	private MemberSafeService safeService;
	@Resource(name="memberRechargeService")
	private MemberRechargeService rechargeService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, String> userMoney = borrowAndInvest.getUserMoneySummary(userInfo.get("id"));
		mv.addObject("userMoney",userMoney);

		//已绑定银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("uid", userInfo.get("id"));
		mp.getStringCondition("verify_status", "1");
		List<Map<String, String>> userCard = thisService.getBank(mp);
		mv.addObject("bankList", userCard);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView detail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		HashMap<String, String> statusInfo = new HashMap<>();
		statusInfo.put("0", "待审核");
		statusInfo.put("1", "审核通过,处理中");
		statusInfo.put("2", "已提现");
		statusInfo.put("3", "审核未通过");
		mv.addObject("statusInfo", statusInfo);

		long startTime = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"));
		Map<String, String> timeSpan = new LinkedHashMap<String,String>();
		timeSpan.put("day7",Tools.timeAddDay(-7, startTime+"")+","+startTime);
		timeSpan.put("month1",Tools.timeAddDay(-30, startTime+"")+","+startTime);
		timeSpan.put("month3",Tools.timeAddDay(-90, startTime+"")+","+startTime);
		mv.addObject("timeSpan",timeSpan);
		
		PageData pd = new PageData(request);	
		HashMap<String, Object> list = thisService.getWithdrawList(pd, mv);		
		mv.addObject("list", list);

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView detail_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.detail(request,response,  mv);
	}
	public ModelAndView bindcard(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		
		Map<String, String> verifyStatus = safeService.getVerifyStatus(userInfo.get("id"));
		mv.addObject("verifyStatus", verifyStatus);
		
		Map<String, String> useri = rechargeService.getUserInfoDetail(userInfo.get("id"));
		mv.addObject("useri", useri);
		
		//已绑定银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("uid", userInfo.get("id"));
		mp.getStringCondition("verify_status", "1");
		List<Map<String, String>> userCard = thisService.getBank(mp);
		mv.addObject("bankList", userCard);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void dowithdraw(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		PageData pd = new PageData(request);
		
		String pin = borrowAndInvest.userPassCreate(pd.get("pin_pass"));
		Map<String, String> userPass = BaseService.getOne("user", Tools.BuildWhereMap("id", userInfo.get("id"), "="), "pin_pass");
		if(StringUtils.isBlank(userPass.get("pin_pass"))){
			ajaxmsg("请先在帐户中心-安全中心 设置支付密码",0,response);
			return;
		}
		if(!pin.equals(userPass.get("pin_pass"))){
			ajaxmsg("支付密码不正确",0,response);
			return ;
		}
		
		HashMap<String, String> userMoneyInfo = borrowAndInvest.getUserMoneyIfo(userInfo.get("id"));
		if(DfMath.toIntValue(userMoneyInfo.get("account_money")+"")<DfMath.toIntValue(pd.get("money")+"")){
			ajaxmsg("帐户余额不足",0,response);
			return;
		}
		
		ThirdpartyTpqueryController tpq = new ThirdpartyTpqueryController();
		HashMap<String, String> qtdHashMap=new HashMap<>();
		qtdHashMap.put("id", userInfo.get("id"));
		qtdHashMap.put("account_type", "SAVING_POT");
		HashMap<String, Object> resf = tpq.query_balance(request, response, qtdHashMap);
		try{
		if(DfMath.s2round(resf.get("ex_account_money")+"")<DfMath.s2round(pd.get("money")+"")){
			ajaxmsg("可提现金额不足，请等待托管同步",0,response);
			return ;
		}
		}catch(Exception e){
			ajaxmsg("提现金额有误，请重试",0,response);
			return ;
		}
		HashMap<String, String>	withdrawInfo = new HashMap<>();	
		withdrawInfo.put("id", userInfo.get("id"));
		withdrawInfo.put("money", pd.get("money"));
		
		//检查银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("id", pd.get("bank_id"));
		mp.getStringCondition("uid", userInfo.get("id"));
		//mp.getStringCondition("card_type", "q");
		Map<String, String> ckCard = rechargeService.ckBank(mp);
		
		withdrawInfo.put("card_id", ckCard.get("tp_code"));
		withdrawInfo.put("bank_code", ckCard.get("bank_name"));
		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		HashMap<String, Object> rechargeRes = tpset.withdraw(request, response, mv, withdrawInfo);
		if("success".equals(rechargeRes.get("df_res"))){
			ajaxmsg("提现成功", 1, response);
		}else{
			ajaxmsg(rechargeRes.get("df_msg")+"", 0, response);
		}
		
	}
	
}
