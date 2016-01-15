package com.dfp2p.core.member.Myinvest;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class MemberMyinvestController extends BaseMemberController {
	public String tplPath = "Myinvest";
	
	@Resource(name="memberMyinvestService")
	private MemberMyinvestService thisService;


	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		long startTime = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"));
		Map<String, String> timeSpan = new LinkedHashMap<String,String>();
		timeSpan.put("day7",Tools.timeAddDay(-7, startTime+"")+","+startTime);
		timeSpan.put("month1",Tools.timeAddDay(-30, startTime+"")+","+startTime);
		timeSpan.put("month3",Tools.timeAddDay(-90, startTime+"")+","+startTime);
		mv.addObject("timeSpan",timeSpan);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getMyinvestList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView invest_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request,response, mv);
	}
	
	public ModelAndView detail_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		List<Map<String,String>> list = thisService.getInvestorDetail(pd);
		mv.addObject("list", list);
		mv.addObject("id", pd.get("id"));
		HashMap<String, String> statusInfo = new HashMap<>();
		statusInfo.put("0", "待确认");
		statusInfo.put("1", "已还款");
		statusInfo.put("2", "提前还款");
		statusInfo.put("3", "迟还");
		statusInfo.put("4", "网站代还");
		statusInfo.put("5", "逾期还款");
		statusInfo.put("7", "还款中");
		mv.addObject("statusInfo", statusInfo);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void doTransfer(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		if(!StringUtils.isBlank(pd.get("is_confirm"))&&"1".equals(pd.get("is_confirm"))){
			
			String reString = thisService.doTransfer(pd);
			if("success".equals(reString)){
				ajaxmsg("申请提交成功", 1, response);
			}else{
				ajaxmsg(reString, 0,response);
			}
			
		}else{
			HashMap<String, Object> tranIfo = thisService.getTransferInfo(pd);
			if("error".equals(tranIfo.get("res"))){
				ajaxmsg(tranIfo.get("msg")+"", 0, response);
				return ;
			}else{
				String showMsgString="您确定要转让您所投的第"+tranIfo.get("borrow_id")+"号标，第"+tranIfo.get("detail_id")+"期共计"+tranIfo.get("credit_money")+"元的债权？</br>请填写您的转让价<input id='transferPrice' class='transferInput'  type='text' value=''/>";
				ajaxmsg(showMsgString,1, response);
			}
		}
		return ;
	}
	
}
