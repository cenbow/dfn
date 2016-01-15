package com.dfp2p.core.admin.Cache_cardrule;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminCache_cardruleController extends BaseAdminController {
	public String tplPath = "Cache_cardrule";
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList("Cache_cardrule");
		if (list != null)		mv.addObject("data", list);

		Map<String, Object> borrowType = ConfigCache.getCacheList("BorrowType");
		if (borrowType != null)	{
			HashMap<String, Object> typeList = (HashMap<String, Object>) borrowType.get("type");
			HashMap<String, Object> borrowTypeDataX = Common.buildNewKVMap(typeList, "key", "borrow_name");
			mv.addObject("borrowType",borrowTypeDataX);
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void editCache_cardrule(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		boolean flag = ConfigCache.doEditCache("Cache_cardrule",PageData.sortRequestMap(pd.post()));
		
		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}

	
}
