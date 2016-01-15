package com.dfp2p.core.admin.User_refer_log;

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
import com.dfp2p.core.admin.User_refer.AdminUser_referService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;

@Controller
public class AdminUser_refer_logController extends BaseAdminController {
	public String tplPath = "User_refer_log";
	
	@Resource(name="adminUser_refer_logService")
	private AdminUser_refer_logService thisService;
	@Resource(name="adminUser_referService")
	private AdminUser_referService referlogService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		LinkedHashMap<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);

		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUser_refer_logList(pd, mv);
		
		Map<String, Object> listlevel = ConfigCache.getCacheList("cache_level");
		if(listlevel!=null){
			HashMap<String, Object> listlevelMap = Common.buildNewKVMap((Map<String, Object>) listlevel.get("level"), "key", "name");
			mv.addObject("listlevelMap",listlevelMap);
		}

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	
	public ModelAndView logdetail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> list = referlogService.getUser_referList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}

}
