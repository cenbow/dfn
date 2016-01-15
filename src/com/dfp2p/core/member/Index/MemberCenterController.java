package com.dfp2p.core.member.Index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.home.Invest.InvestService;
import com.dfp2p.core.home.Register.RegisterService;
import com.dfp2p.core.member.Capital.MemberCapitalService;
import com.dfp2p.core.member.Myinvest.MemberMyinvestService;
import com.dfp2p.core.member.Recharge.MemberRechargeService;
import com.dfp2p.core.member.Withdraw.MemberWithdrawService;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller(value="/member")
//@Controller
public class MemberCenterController extends BaseMemberController {
	@Resource(name="memberCenterService")
	private MemberCenterService thisService;
	@Resource(name="memberMyinvestService")
	private MemberMyinvestService investService;
	@Resource(name="memberCapitalService")
	private MemberCapitalService capitalService;
	@Resource(name="memberRechargeService")
	private MemberRechargeService rechargeService;
	@Resource(name="memberWithdrawService")
	private MemberWithdrawService withdrawService;
	@Resource(name="RegisterService")
	private RegisterService regService;
	public String tplPath = "Index";
	@RequestMapping(value="/index")
	public ModelAndView member(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		PageData pd = new PageData(request);
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, String> userMoney = borrowAndInvest.getUserMoneySummary(userInfo.get("id"));
		mv.addObject("userMoney", userMoney);
		
		//登陆次数
		Map<String, String> loginTimes = BaseService.getOne("user_login", Tools.BuildWhereMap("uid",userInfo.get("id"),"="), "count(id) as num");
		mv.addObject("loginTimes",loginTimes);
		Map<String, String> loginInfo = BaseService.getOne("user_login", Tools.BuildWhereMap("uid",userInfo.get("id"),"="), null,"id DESC");
		if(loginInfo.containsKey("add_time")) loginInfo.put("add_time", Tools.TimeStamp2Date(loginInfo.get("add_time"), "yyyy-MM-dd hh:mm"));
		mv.addObject("loginInfo",loginInfo);
		
		HashMap<String, Object> moneyLogList = thisService.getMoneyLogPerMonth(pd, mv);
		mv.addObject("moneyLogList", moneyLogList);
		
		Map<String, String> mvf = BaseService.getOne("user_verify", Tools.BuildWhereMap("uid", userInfo.get("id"), "="), null);
		mv.addObject("mvf", mvf);
		//投资记录
		HashMap<String, Object> invest_log = investService.getMyinvestList(pd, mv);
		//Tools.printData(invest_log);
		mv.addObject("invest_log", invest_log);
		mv = this.getTplView(request,response, tplPath, mv);
		mv.addObject("_thisUrl_", "member/center/");
		//投标数量统计
		HashMap<String, String> investorCount = thisService.getInvestorTypeCount(pd, mv);
		mv.addObject("investorCount", investorCount);
		return mv;
	}

	public ModelAndView capital_log(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		//投资记录
		HashMap<String, String> moneyType = Interface.getMoneyType("money");
		moneyType.put("0", "全部");
		mv.addObject("moneyType", moneyType);
		HashMap<String, Object> capital_log = capitalService.getCapitalList(pd, mv);
		mv.addObject("capital_log", capital_log);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView recharge_log(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		//充值记录
		HashMap<String, Object> recharge_log = rechargeService.getRechargeList(pd, mv);
		mv.addObject("recharge_log", recharge_log);
		
		HashMap<String, String> statusInfo = new HashMap<>();
		statusInfo.put("0", "未完成");
		statusInfo.put("1", "成功");
		statusInfo.put("3", "失败");
		mv.addObject("statusInfo", statusInfo);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView cash_log(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		//充值记录
		HashMap<String, Object> withdraw_log = withdrawService.getWithdrawList(pd, mv);
		mv.addObject("withdraw_log", withdraw_log);
		
		HashMap<String, String> statusInfo = new HashMap<>();
		statusInfo.put("0", "待审核");
		statusInfo.put("1", "审核通过,处理中");
		statusInfo.put("2", "已提现");
		statusInfo.put("3", "审核未通过");
		mv.addObject("statusInfo", statusInfo);
		return this.getTplView(request,response, tplPath, mv);
	}

	public void bindtp(HttpServletRequest request,HttpServletResponse response){
		//绑定托管
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
		HashMap<String, Object> bindRes = tpsetController.create_activate_member(request, response, userInfo.get("id"));
		if ("success".equals(bindRes.get("df_res"))) {
			Map<String, Object> upinfoMap=new HashMap<>();
			upinfoMap.put("id", userInfo.get("id"));
			upinfoMap.put("third_account", bindRes.get("ex_info"));
			regService.updateUser(upinfoMap);
			this.ajaxmsg("绑定成功", 1, response);
		}else{
			this.ajaxmsg(bindRes.get("df_msg")+"", 0, response);
		}
		//绑定托管end

	}

}
