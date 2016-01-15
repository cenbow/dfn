package com.dfp2p.core.admin.Cache_pay;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminCache_payController extends BaseAdminController {
	public String tplPath = "Cache_pay";
	
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> paySelect = new LinkedHashMap<String,String>();
		paySelect.put("1","商户");
		paySelect.put("2","用户");
		mv.addObject("paySelect",paySelect);
		mv.addObject("dfForm_style","width=300px");

		Map<String, String> openSelect = new LinkedHashMap<String,String>();
		openSelect.put("1","启用");
		openSelect.put("0","关闭");
		mv.addObject("openSelect",openSelect);

		
		Map<String, Object> list = ConfigCache.getCacheList("cache_pay");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView add_menu(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	
	public void editCache_pay(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_pay",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
}
