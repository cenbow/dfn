package com.dfp2p.core.admin.Cache_msgset;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminCache_msgsetController extends BaseAdminController {
	public String tplPath = "Cache_msgset";
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> checkboxSelect = new LinkedHashMap<String,String>();
		checkboxSelect.put("1","短信");
		checkboxSelect.put("2","邮件");
		checkboxSelect.put("3","站内信");
		mv.addObject("checkboxSelect",checkboxSelect);
		
		PageData pd = new PageData(request);
		
		Map<String, Object> list = ConfigCache.getCacheList("cache_msgset");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void editCache_msgset(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		
		Tools.printData(pd);
		boolean flag = ConfigCache.doEditCache("cache_msgset",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
}
