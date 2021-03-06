package com.dfp2p.core.admin.Msg_phone;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;

@Controller
public class AdminMsg_phoneController extends BaseAdminController {
	public String tplPath = "Msg_phone";
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		Map<String, Object> list = ConfigCache.getCacheList("msg_phone");
		if (list != null)
			mv.addObject("data", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void editMsg_phone(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		PageData pd = new PageData(request);
		
		boolean flag = ConfigCache.doEditCache("msg_phone",PageData.sortRequestMap(pd.post()));

		if (flag)
			ajaxmsg("操作成功", "success", response);
		else
			ajaxmsg("操作失败", "fail", response);
	}
}
