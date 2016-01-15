package com.dfp2p.core.admin.Mortgage;

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
public class AdminMortgageController extends BaseAdminController {
	public String tplPath = "Mortgage";
	
public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("1","是");
		vipSelect.put("0","不限制");
		mv.addObject("vipSelect",vipSelect);
		
		Map<String, String> phoneSelect = new LinkedHashMap<String,String>();		
		phoneSelect.put("1","是");
		phoneSelect.put("0","不限制");
		mv.addObject("phoneSelect",phoneSelect);
		
		Map<String, String> videoSelect = new LinkedHashMap<String,String>();
		videoSelect.put("1","是");
		videoSelect.put("0","不限制");
		mv.addObject("videoSelect",videoSelect);
		
		Map<String, String> faceSelect = new LinkedHashMap<String,String>();		
		faceSelect.put("1","是");
		faceSelect.put("0","不限制");
		mv.addObject("faceSelect",faceSelect);
		
		Map<String, String> realSelect = new LinkedHashMap<String,String>();
		realSelect.put("1","是");
		realSelect.put("0","不限制");
		mv.addObject("realSelect",realSelect);
		
		

		PageData pd = new PageData(request);
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList("Mortgage");
		
		
		Tools.printData(list);
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void editMortgage(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		
		Tools.printData(PageData.sortRequestMap(pd.post()));
		
		boolean flag = ConfigCache.doEditCache("Mortgage",PageData.sortRequestMap(pd.post()));
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}

}
