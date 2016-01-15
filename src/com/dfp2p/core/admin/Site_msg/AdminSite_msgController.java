package com.dfp2p.core.admin.Site_msg;

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
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.util.PageData;

@Controller
public class AdminSite_msgController extends BaseAdminController {
	public String tplPath = "Site_msg";
	
	@Resource(name="adminSite_msgService")
	private AdminSite_msgService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> readSelect = new LinkedHashMap<String,String>();
		readSelect.put("","全部");
		readSelect.put("1","已读");
		readSelect.put("0","未读");
		mv.addObject("readSelect",readSelect)
		
		;
		Map<String, String> importantSelect = new LinkedHashMap<String,String>();
		importantSelect.put("","全部");
		importantSelect.put("1","是");
		importantSelect.put("0","否");
		mv.addObject("importantSelect",importantSelect);
		
		
		
		
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getSite_msgList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView menu(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void delete(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		PageData pd = new PageData(request);
		HashMap<String, Object>delMap = new HashMap<>();
		delMap.put("id", pd.get("id"));
		boolean flag = thisService.deleteMsg(delMap);
		
		if (flag)
			ajaxmsg(pd.get("id"), "success", response);
		else
			ajaxmsg("删除失败", "fail", response);
	}

}
