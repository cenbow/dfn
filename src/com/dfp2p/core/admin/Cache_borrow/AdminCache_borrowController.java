package com.dfp2p.core.admin.Cache_borrow;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
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
public class AdminCache_borrowController extends BaseAdminController {
	public String tplPath = "Cache_borrow";
	
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> money_typeSelect = new LinkedHashMap<String,String>();
		money_typeSelect.put("1","本金");
		money_typeSelect.put("2","利息");
		money_typeSelect.put("3","本金+利息");
		mv.addObject("money_typeSelect",money_typeSelect);
		
		PageData pd = new PageData(request);
		
		Map<String, Object> list = ConfigCache.getCacheList("cache_borrow");
		
		//Tools.printData(list);
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void editCache_borrow(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("cache_borrow",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
}
