package com.dfp2p.core.admin.Capital_summary;

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

import org.apache.commons.lang.StringUtils;
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
import com.dfp2p.util.DfMath;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AdminCapital_summaryController extends BaseAdminController {
	private static Log log = LogFactory.getLog(AdminCapital_summaryController.class);
	
	public String tplPath = "Capital_summary";
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, String>	countMap=new HashMap<>();
		String timeFrom = "0";
		String timeEND = "0";
		if(!StringUtils.isBlank(pd.get("startTime")+"")&&!StringUtils.isBlank(pd.get("endTime")+"")){
			timeFrom = Tools.strToTime(pd.get("startTime")+"")+"";
			timeEND = Tools.strToTime(pd.get("endTime")+"")+"";
			mv.addObject("startTime", pd.get("startTime"));
			mv.addObject("endTime", pd.get("endTime"));
		}

		try{
			WhereUtil todayMap = new WhereUtil();
			if(DfMath.toIntValue(timeEND)>DfMath.toIntValue(timeFrom)) todayMap.getStringCondition("reg_time", timeFrom+" and "+timeEND,"between");
			Map<String, String> num_res = BaseDao.getOne("user", todayMap.getParamConditionList(), "count(id) as num", conn);
			countMap.put("user", num_res.get("num"));
		}catch(Exception e){
			countMap.put("user","0");
		}
		try{
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("status", "1");
			if(DfMath.toIntValue(timeEND)>DfMath.toIntValue(timeFrom)) todayMap.getStringCondition("add_time", timeFrom+" and "+timeEND,"between");
			Map<String, String> num_res = BaseDao.getOne("recharge", todayMap.getParamConditionList(), "count(id) as num,sum(money) as money", conn);
			countMap.put("recharge", num_res.get("num"));
			countMap.put("recharge_money", num_res.get("money"));
		}catch(Exception e){
			countMap.put("recharge","0");
			countMap.put("recharge_money","0");
		}

		try{
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("withdraw_status","1");
			if(DfMath.toIntValue(timeEND)>DfMath.toIntValue(timeFrom)) todayMap.getStringCondition("deal_time", timeFrom+" and "+timeEND,"between");
			Map<String, String> num_res = BaseDao.getOne("withdraw", todayMap.getParamConditionList(), "count(id) as num,sum(withdraw_money) as money", conn);
			countMap.put("withdraw", num_res.get("num"));
			countMap.put("withdraw_money", num_res.get("money"));
		}catch(Exception e){
			countMap.put("withdraw","0");
			countMap.put("withdraw_money","0");
		}


		try{
			WhereUtil todayMap = new WhereUtil();
			todayMap.getStringCondition("status","7");
			if(DfMath.toIntValue(timeEND)>DfMath.toIntValue(timeFrom)) todayMap.getStringCondition("deadline", timeFrom+" and "+timeEND,"between");
			Map<String, String> num_res = BaseDao.getOne("investor_detail", todayMap.getParamConditionList(), "sum(capital) as capital,sum(interest) as interest", conn);
			countMap.put("collect_capital", num_res.get("capital"));
			countMap.put("collect_interest", num_res.get("interest"));
			
			WhereUtil todayMap1 = new WhereUtil();
			todayMap1.getStringCondition("status","1");
			if(DfMath.toIntValue(timeEND)>DfMath.toIntValue(timeFrom)) todayMap1.getStringCondition("deadline", timeFrom+" and "+timeEND,"between");
			Map<String, String> num_res1 = BaseDao.getOne("investor_detail", todayMap1.getParamConditionList(), "sum(receive_interest+interest_fee) as receive_interest,sum(receive_capital) as receive_capital", conn);

			countMap.put("collect_receive_interest", num_res1.get("receive_interest"));
			countMap.put("collect_receive_capital", num_res1.get("receive_capital"));
		}catch(Exception e){
			countMap.put("collect_capital", "0");
			countMap.put("collect_interest", "0");
			countMap.put("collect_receive_interest", "0");
			countMap.put("collect_receive_capital", "0");
		}


		try{
			WhereUtil todayMap = new WhereUtil();
			if(DfMath.toIntValue(timeEND)>DfMath.toIntValue(timeFrom)) todayMap.getStringCondition("use_time", timeFrom+" and "+timeEND,"between");
			DataSet dsc = T.load("user_card", conn).W(todayMap.getParamConditionList()).G("type").Q("sum(use_money) as use_money,type");
			List<Map<String, String>> num_res = BeanMapUtils.dataSetToListMap(dsc);
			for (Map<String, String> map : num_res) {
				countMap.put("card_"+map.get("type"), map.get("use_money"));
			}

		}catch(Exception e){
			countMap.put("card_1", "0");
			countMap.put("card_2", "0");
			countMap.put("card_3", "0");
			countMap.put("card_4", "0");
		}
		
		MySQL.closeConnection(conn);
		mv.addObject("countMap", countMap);
		
		return this.getTplView(request,response, tplPath, mv);
	}

}
