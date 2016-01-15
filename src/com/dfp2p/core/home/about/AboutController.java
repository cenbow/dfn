package com.dfp2p.core.home.about;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.home.Register.RegisterService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AboutController extends BaseHomeController {
	private static Log log = LogFactory.getLog(AboutController.class);
	public String tplPath = "About";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		return this.getTplView(request,response, tplPath, mv);
	}
	
}


