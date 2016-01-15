package com.dfp2p.core.app.recycle;

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
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AppRecycleController extends BaseAppController {
	public String tplPath = "Invest";
	
	@Resource(name="appRecycleService")
	private AppRecycleService thisService;
	public void lists(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	
		PageData pd = new PageData(request);
		Map<String, Object> map = thisService.getInvestorByUidList(pd, mv);
		List<Map<String,String>> list = (List<Map<String, String>>) map.get("data");
		for (Map<String,String> thisMap:list)
		{
			thisMap.put("recheck_time", "6".equals(thisMap.get("borrow_type"))?thisMap.get("add_time"):("0".equals(thisMap.get("recheck_time"))?"待确认":thisMap.get("recheck_time"))) ;
			thisMap.put("deadline","0".equals(thisMap.get("deadline"))?"待确认":thisMap.get("deadline"));
			thisMap.put("back",thisMap.get("has_pay"));
			thisMap.put("investor_capital",thisMap.get("investor_capital"));
		}
		 
		
		Map<String, Object> result = new HashMap<String,Object>();
		result.put("list",list );
		result.put("totalPage", map.get("totalPage") );
		result.put("curPage", map.get("curPage"));
		
		ajaxmsg(result, response);
		
	}
	 
	
	public void detail_info(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		Map<String, String> map = thisService.getInvestorList(pd, mv);
		map.put("duration_unit", ("1".equals(map.get("duration_unit")))?"天":"个月");
		map.put("has_receive", (DfMath.s2round(map.get("receive_capital"))+DfMath.s2round(map.get("receive_interest")))+"");
		//$borrowinfo['repayment_type_name'] = $borrow_config_common['REPAYMENT_TYPE'][$borrowinfo['repayment_type']];
		
		ajaxmsg(map, response);
	}
	 
}
