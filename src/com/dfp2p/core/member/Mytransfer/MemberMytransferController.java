package com.dfp2p.core.member.Mytransfer;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class MemberMytransferController extends BaseMemberController {
	public String tplPath = "Mytransfer";
	
	@Resource(name="memberMytransferService")
	private MemberMytransferService thisService;


	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		long startTime = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"));
		Map<String, String> timeSpan = new LinkedHashMap<String,String>();
		timeSpan.put("day7",Tools.timeAddDay(-7, startTime+"")+","+startTime);
		timeSpan.put("month1",Tools.timeAddDay(-30, startTime+"")+","+startTime);
		timeSpan.put("month3",Tools.timeAddDay(-90, startTime+"")+","+startTime);
		mv.addObject("timeSpan",timeSpan);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getMyAcceptList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView invest_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request,response, mv);
	}
	
	public ModelAndView detail_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		List<Map<String,String>> list = thisService.getAcceptDetail(pd);
		mv.addObject("list", list);
		mv.addObject("id", pd.get("id"));
		mv.addObject("count",list.size());
		return this.getTplView(request,response, tplPath, mv);
	}
	
}
