package com.dfp2p.core.home.Activity;

import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.home.Register.RegisterService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.PageData;

@Controller
public class ActivityController extends BaseHomeController {
	public String tplPath = "Activity";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		return this.getTplView(request,response, tplPath, mv);
	}
	
}


