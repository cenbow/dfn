package com.dfp2p.core.member.Capital;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.member.Myinvest.MemberMyinvestService;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class MemberCapitalController extends BaseMemberController {
	public String tplPath = "Capital";
	@Resource(name="memberCapitalService")
	private MemberCapitalService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, String> userMoney = borrowAndInvest.getUserMoneySummary(userInfo.get("id"));
		mv.addObject("userMoney", userMoney);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView detail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		long startTime = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"));
		Map<String, String> timeSpan = new LinkedHashMap<String,String>();
		timeSpan.put("day7",Tools.timeAddDay(-7, startTime+"")+","+startTime);
		timeSpan.put("month1",Tools.timeAddDay(-30, startTime+"")+","+startTime);
		timeSpan.put("month3",Tools.timeAddDay(-90, startTime+"")+","+startTime);
		mv.addObject("timeSpan",timeSpan);
		
		PageData pd = new PageData(request);	
		HashMap<String, Object> list = thisService.getCapitalList(pd, mv);		
		mv.addObject("list", list);
		
		HashMap<String, String> moneyType = Interface.getMoneyType("money");
		moneyType.put("0", "全部");
		mv.addObject("moneyType", moneyType);
		return this.getTplView(request,response, tplPath, mv);
	}

	public ModelAndView detail_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.detail(request,response,  mv);
	}

}
