package com.dfp2p.core.app.msg;

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
public class AppMsgController extends BaseAppController {
	public String tplPath = "Invest";
	
	@Resource(name="appMsgService")
	private AppMsgService thisService;
	public void lists(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	
		PageData pd = new PageData(request);
		Map<String, Object> map = thisService.getSite_msgByUidList(pd, mv);
		List<Map<String,String>> list = (List<Map<String, String>>) map.get("data");
		for (Map<String,String> thisMap:list)
			thisMap.put("msg", cnsubstr(thisMap.get("msg"),16));
		 
		int  count = thisService.getSite_msgByHas_readCount(pd, mv);
		
		Map<String, Object> result = new HashMap<String,Object>();
		result.put("unread", count);
		result.put("list",list );
		result.put("totalPage", map.get("totalPage") );
		result.put("curPage", map.get("curPage"));
		
		ajaxmsg(result, response);
		
	}
	private String cnsubstr(String string, int string2) {
		String result = "";
		if (string != null)
			result = string.substring(0,string2);
		return result;
	}
	
	public void detail_info(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		Map<String,String> map = thisService.getDetail(pd, mv);
		map.put("msg", cnsubstr(map.get("msg"),16));
		
		if ("0".equals(map.get("has_read")))
		{
			Map<String,Object> value = new HashMap<String,Object>();
			value.put("id", map.get("id"));
			value.put("has_read", map.get("has_read"));
			value.put("read_time", Tools.getLongTime()/1000);
			thisService.save(value);
		}
		
		ajaxmsg(map, response);
		
	}
	 
}
