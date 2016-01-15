package com.dfp2p.core.member.Myborrow;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.thirdparty.ThirdpartyTpqueryController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.sun.jna.platform.win32.Netapi32Util.UserInfo;

@Controller
public class MemberMyborrowController extends BaseMemberController {
	public String tplPath = "Myborrow";
	
	@Resource(name="memberMyborrowService")
	private MemberMyborrowService thisService;


	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		long startTime = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"));
		Map<String, String> timeSpan = new LinkedHashMap<String,String>();
		timeSpan.put("day7",Tools.timeAddDay(-7, startTime+"")+","+startTime);
		timeSpan.put("month1",Tools.timeAddDay(-30, startTime+"")+","+startTime);
		timeSpan.put("month3",Tools.timeAddDay(-90, startTime+"")+","+startTime);
		mv.addObject("timeSpan",timeSpan);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getMyborrowList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView invest_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request,response, mv);
	}
	
	public ModelAndView detail_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		List<Map<String,String>> list = thisService.getRepaymentDetail(pd);
		mv.addObject("list", list);
		mv.addObject("id", pd.get("id"));
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void doRepayment(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Map<String, String> borrowInfo=null;
		try {
			borrowInfo = thisService.getBorrowInfo(pd, mv);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ajaxmsg("数据有误", 0, response);
			return ;
		}
		if(borrowInfo==null){
			ajaxmsg("数据有误",0, response);
			return ;
		}
		//须还款金额
		WhereUtil wmpUtil=new WhereUtil();
		wmpUtil.getStringCondition("borrow_id", pd.get("id"));
		wmpUtil.getStringCondition("sort_order", pd.get("sort_order"));
		Map<String, String> investListData = BaseService.getOne("investor_detail", wmpUtil.getParamConditionList(), "sum(capital) as capital, sum(interest) as interest");
		double allRepaymentMoney = DfMath.s2add(investListData.get("capital"), investListData.get("interest"));
		
		HashMap<String, String> inHashMap=new HashMap<>();
		inHashMap.put("account_type", "SAVING_POT");
		inHashMap.put("id", userInfo.get("id"));
		ThirdpartyTpqueryController tpq = new ThirdpartyTpqueryController();
		HashMap<String, Object> qres = tpq.query_balance(request, response, inHashMap);
		if(DfMath.toIntValue(qres.get("ex_account_money")+"")<DfMath.toIntValue(allRepaymentMoney+"")){
			ajaxmsg("帐户余额不足",0, response);
			return ;
		}
		
		
		String repaymentRes = borrowAndInvest.borrowRepayment(pd.get("id"), pd.get("sort_order"));
		if("success".equals(repaymentRes)){
			
			//托管还款
			HashMap<String, String> tradeInfo = new HashMap<>();
			tradeInfo.put("type", "1002");
			tradeInfo.put("info", pd.get("id")+"号标第"+pd.get("sort_order")+"期还款");
			tradeInfo.put("uid", userInfo.get("id"));
			tradeInfo.put("borrow_id", pd.get("id"));
			tradeInfo.put("money", allRepaymentMoney+"");
			ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
			HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
			//托管还款
			
			ajaxmsg("还款成功",1, response);
		}else{
			ajaxmsg(repaymentRes, 0, response);
			return ;
		}
	}
	
	
}
