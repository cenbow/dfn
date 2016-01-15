package com.dfp2p.core.app.invest;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.baseController.BaseAppController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.sun.jna.platform.win32.Netapi32Util.UserInfo;

@Controller
public class AppInvestController extends BaseAppController {
	public String tplPath = "Invest";
	
	@Resource(name="appInvestService")
	private AppInvestService thisService;
	public void lists(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	
		PageData pd = new PageData(request);
		Map<String, Object> map = thisService.getUserList(pd, mv);
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		Tools.printData(UserInfo);
		if (map!=null)
		{
			List<Map<String,String>> list = (List<Map<String, String>>) map.get("data");
			for (Map<String,String> parm :list)
			{
				parm.put("need", (DfMath.s2round(parm.get("borrow_money"))-DfMath.s2round(parm.get("has_borrow")))+"");
				parm.put("leftdays", DfMath.s2round(parm.get("collect_time"))+"");
				parm.put("progress", DfMath.s2round(parm.get("has_borrow"))/DfMath.s2round(parm.get("borrow_money"))*100+"");
				parm.put("duration_unit", "1".equals(parm.get("repayment_type"))?"天":"个月");
				parm.put("lefts",(DfMath.toIntValue(parm.get("collect_time"))-Tools.getLongTime())+"");
			}
			Map<String, Object> result = new HashMap<>();
			result.put("list",list);
			result.put("num",list.size());
			result.put("totalPage",map.get("totalPage"));
			result.put("curPage",map.get("curPage"));
			
			ajaxmsg(result, response);
		}
	}
	
	 
	public void detail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String userId = getId(request);
		PageData pd = new PageData(request);
		Map<String, String> map = thisService.getDetail(pd, mv);
		Map<String, Object> result = new HashMap<String,Object>();
		Tools.mergeHashMap(result, map);
		result.put("biao", map.get("borrow_times"));
		result.put("need", DfMath.s2round(map.get("borrow_money"))-DfMath.s2round(map.get("has_borrow")));
		result.put("lefttime", DfMath.s2round(map.get("collect_time"))-Tools.getLongTime()/1000+"");
		result.put("progress", DfMath.s2round(map.get("has_borrow"))/DfMath.s2round(map.get("borrow_money"))*100);
		result.put("vouch_progress", DfMath.s2round(map.get("has_vouch"))/DfMath.s2round(map.get("borrow_money"))*100);
		result.put("vouch_need", DfMath.s2round(map.get("borrow_money"))-DfMath.s2round(map.get("has_vouch")));
		result.put("duration_unit", "1".equals(map.get("repayment_type"))?"天":"个月");
		result.put("repaymentType", DfMath.s2round(map.get("repayment_type")));
		if(!"0".equals(userId)) result.put("account_money", thisService.getFieldByUid(userId,"account_money"));
		else  result.put("account_money","-1");
		ajaxmsg(result, response);
	}
	
	 
	public void detail_info(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String userId = getId(request);
		PageData pd = new PageData(request);
		Map<String, String> map = thisService.getDetail(pd, mv);
		Map<String, Object> result = new HashMap<String,Object>();
		Tools.mergeHashMap(result, map);
		result.put("biao", map.get("borrow_times"));
		result.put("need", DfMath.s2round(map.get("borrow_money"))-DfMath.s2round(map.get("has_borrow")));
		result.put("lefttime", DfMath.s2round(map.get("collect_time"))-Tools.getLongTime()+"");
		result.put("full_time", map.get("full_time"));
		result.put("lefttime", map.get("lefttime"));
		result.put("progress", DfMath.s2round(map.get("has_borrow"))/DfMath.s2round(map.get("borrow_money"))*100);
		result.put("vouch_progress", DfMath.s2round(map.get("has_vouch"))/DfMath.s2round(map.get("borrow_money"))*100);
		result.put("vouch_need", DfMath.s2round(map.get("borrow_money"))-DfMath.s2round(map.get("has_vouch")));
		result.put("duration_unit", "4".equals(map.get("repayment_type"))?"天":"个月");
		result.put("repaymentType", DfMath.s2round(map.get("repayment_type")));
		if(!"0".equals(userId)) result.put("account_money", thisService.getFieldByUid(userId,"account_money"));
		else  result.put("account_money","-1");
		result.put("borrow_info", map.get("borrow_info"));
		
		HashMap<String, Object> invest = thisService.getInvestinfo(pd, mv);
		List<Map<String,String>> investinfo = null;
		if (invest!=null)
			investinfo = (List<Map<String, String>>) invest.get("data");
			
		Map<String,Object> ajax = new HashMap<String,Object>();
		ajax.put("vo", result);
		ajax.put("investinfo", investinfo);
		
		ajaxmsg(ajax, response);
		
	}
}
