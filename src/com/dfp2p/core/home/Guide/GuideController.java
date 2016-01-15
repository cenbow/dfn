package com.dfp2p.core.home.Guide;

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
public class GuideController extends BaseHomeController {
	private static Log log = LogFactory.getLog(GuideController.class);
	public String tplPath = "Guide";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		return this.getTplView(request,response, tplPath, mv);
	}
	public void test(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) throws Exception {
		Connection conn = MySQL.getConnectionReadOnly(false );
		Map<String, String> user=null;
		try{
		DataSet Dx = T.load("user", conn).W(Tools.BuildWhereMap("id", "71", "=")).Lock().Q("user_name");
		user = BeanMapUtils.dataSetToListMap(Dx).get(0);
		}catch(Exception e){
			logger.error("等待超时了吧"+e.toString());
		}
		log.info("会员信息是："+user);
		MySQL.commit(conn);
		MySQL.closeConnection(conn);

	}
	
}


