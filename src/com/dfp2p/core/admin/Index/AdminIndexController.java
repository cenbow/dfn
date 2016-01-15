package com.dfp2p.core.admin.Index;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Group.AdminGroupService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.DataBase;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AdminIndexController extends BaseAdminController {
	private static Log log = LogFactory.getLog(AdminIndexController.class);
	
	@Resource
	private IndexService indexService;
	
	@Resource(name="adminGroupService")
	private AdminGroupService groupService;
	
	public String tplPath = "Index";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String adminRoleId = "0";
		//是否已登陆
		HttpSession session = request.getSession();
		Object adminInfo= session.getAttribute("AdminInfo");
		if(adminInfo!=null){
			adminRoleId = ((HashMap<String, String>)adminInfo).get("u_group_id");
			pd.get().put("id",adminRoleId );
		
			Map<String, String> data = groupService.role_edit(pd, mv);
	
			ArrayList<String> hasMenu = new ArrayList<String>();
			hasMenu=(ArrayList<String>) JacksonUtil.objectFromJson(data.get("controller"));
			mv.addObject("hasMenu", hasMenu);
			mv.addObject("data", data);
			List<LinkedHashMap<String, Object>> MenuList = Common.getCacheMenuList(false);
			mv.addObject("menuList",MenuList);
		}
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView mains(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> rowHashMap=new HashMap<>();
		Connection conn = MySQL.getConnectionReadOnly(true);
		try {
			WhereUtil wmap=new WhereUtil();
			wmap.getStringCondition("v.borrow_status", "0");
			DataSet ds = T.load("borrow_info v", conn).LJ("user m ON m.id=v.borrow_uid").W(wmap.getParamConditionList()).Q("count(v.borrow_uid) as num");
			Map<String, String> dsres = BeanMapUtils.dataSetToListMap(ds).get(0);
			rowHashMap.put("borrow_check",dsres.get("num"));//额度
		} catch (Exception e) {
			rowHashMap.put("borrow_check","0");//额度
		}
		
		try {
			WhereUtil wmap=new WhereUtil();
			wmap.getStringCondition("v.borrow_status", "4");
			DataSet ds = T.load("borrow_info v", conn).LJ("user m ON m.id=v.borrow_uid").W(wmap.getParamConditionList()).Q("count(v.id) as num");
			Map<String, String> dsres = BeanMapUtils.dataSetToListMap(ds).get(0);
			rowHashMap.put("borrow_recheck",dsres.get("num"));//额度
		} catch (Exception e) {
			rowHashMap.put("borrow_recheck","0");//额度
		}
				
		try {
			WhereUtil wmap=new WhereUtil();
			wmap.getStringCondition("v.status", "0");
			DataSet ds = T.load("loan_info v", conn).W(wmap.getParamConditionList()).Q("count(v.id) as num");
			Map<String, String> dsres = BeanMapUtils.dataSetToListMap(ds).get(0);
			rowHashMap.put("loan",dsres.get("num"));//额度
		} catch (Exception e) {
			rowHashMap.put("loan","0");//额度
		}
		
		try {
			WhereUtil wmap=new WhereUtil();
			wmap.getStringCondition("v.withdraw_status", "4");
			DataSet ds = T.load("withdraw v", conn).LJ("user m ON m.id=v.uid").W(wmap.getParamConditionList()).Q("count(v.uid) as num");
			Map<String, String> dsres = BeanMapUtils.dataSetToListMap(ds).get(0);
			rowHashMap.put("withdraw",dsres.get("num"));//额度
		} catch (Exception e) {
			rowHashMap.put("withdraw","0");//额度
		}
		
		
		try {
			WhereUtil wmap=new WhereUtil();
			wmap.getStringCondition("d.deadline", "4");
			wmap.getStringCondition("repayment_time", "0");
			String sql = T.load("borrow_info b", conn).LJ("investor_detail d ON d.borrow_id=b.id").W(wmap.getParamConditionList()).G("d.borrow_id").getSqlStr("b.id");
			DataSet ds = DataBase.executeQuery(conn, "select count(*) as tc from ("+ sql+") as t", null);
			Map<String, String> dsres = BeanMapUtils.dataSetToListMap(ds).get(0);
			rowHashMap.put("will_repay",dsres.get("tc"));//额度
		} catch (Exception e) {
			rowHashMap.put("will_repay","0");//额度
		}

		
		HashMap<String, String> lastLogin=new HashMap<>();
		try {
			//登陆的管理员
			HttpSession session = request.getSession();
			Map<String, String> adminInfo = (Map<String, String>)session.getAttribute("AdminInfo");

			WhereUtil wmap=new WhereUtil();
			wmap.getStringCondition("uid", adminInfo.get("id"));
			DataSet ds = T.load("loginlog v", conn).O("loginid DESC").W(wmap.getParamConditionList()).L(1, 1).Q("loginip,logintime");
			Map<String, String> dsres = BeanMapUtils.dataSetToListMap(ds).get(0);
			lastLogin.put("add_time",dsres.get("logintime"));//额度
			lastLogin.put("ip",dsres.get("loginip"));//额度
		} catch (Exception e) {
			lastLogin.put("add_time","首次登陆");//额度
			lastLogin.put("ip","首次登陆");//额度
		}

		HashMap<String, String>	countMap=new HashMap<>();
		try{
			String timeFrom = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 00:00:00")+"")+"";
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("reg_time", timeFrom,">");
			Map<String, String> num_res = BaseDao.getOne("user", todayMap.getParamConditionList(), "count(id) as num", conn);
			countMap.put("user", num_res.get("num"));
		}catch(Exception e){
			countMap.put("user","0");
		}
		try{
			String timeFrom = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 00:00:00")+"")+"";
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("status", "1");
			todayMap.getStringCondition("add_time", timeFrom,">");
			Map<String, String> num_res = BaseDao.getOne("recharge", todayMap.getParamConditionList(), "count(id) as num,sum(money) as money", conn);
			countMap.put("recharge", num_res.get("num"));
			countMap.put("recharge_money", num_res.get("money"));
		}catch(Exception e){
			countMap.put("recharge","0");
			countMap.put("recharge_money","0");
		}

		try{
			String timeFrom = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 00:00:00")+"")+"";
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("add_time", timeFrom,">");
			Map<String, String> num_res = BaseDao.getOne("borrow_info", todayMap.getParamConditionList(), "count(id) as num,sum(borrow_money) as money", conn);
			countMap.put("borrow", num_res.get("num"));
			countMap.put("borrow_money", num_res.get("money"));
		}catch(Exception e){
			countMap.put("borrow","0");
			countMap.put("borrow_money","0");
		}

		try{
			String timeFrom = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 00:00:00")+"")+"";
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("add_time", timeFrom,">");
			Map<String, String> num_res = BaseDao.getOne("borrow_investor", todayMap.getParamConditionList(), "count(id) as num,sum(investor_capital) as money", conn);
			countMap.put("invest", num_res.get("num"));
			countMap.put("invest_money", num_res.get("money"));
		}catch(Exception e){
			countMap.put("invest","0");
			countMap.put("invest_money","0");
		}

		try{
			String timeFrom = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 00:00:00")+"")+"";
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("withdraw_status","1");
			todayMap.getStringCondition("deal_time", timeFrom,">");
			Map<String, String> num_res = BaseDao.getOne("withdraw", todayMap.getParamConditionList(), "count(id) as num,sum(withdraw_money) as money", conn);
			countMap.put("withdraw", num_res.get("num"));
			countMap.put("withdraw_money", num_res.get("money"));
		}catch(Exception e){
			countMap.put("withdraw","0");
			countMap.put("withdraw_money","0");
		}

		mv.addObject("row", rowHashMap);
		mv.addObject("countMap", countMap);
		mv.addObject("lastLogin", lastLogin);
		return this.getTplView(request,response, tplPath, mv);
	}


}
