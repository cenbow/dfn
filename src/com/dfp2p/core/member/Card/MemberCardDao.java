package com.dfp2p.core.member.Card;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Repository("memberCardDao")
public class MemberCardDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	



	public HashMap<String, Object> getMyCardList(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String orderBy = "id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("user_card", conn).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("list_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user_card", conn).L(begin,pageSize).W(paramCondition).O(orderBy).Q(null); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list,conn);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list,Connection conn) {
		for(Map<String, String> map:list)
		{
			Common.getCardInfo(map);
			map.put("expired_time", Tools.TimeStamp2Date(map.get("expired_time"),"yyyy.MM.dd"));
			map.put("add_time", Tools.TimeStamp2Date(map.get("add_time"),"yyyy.MM.dd"));
		}
	}



	public Map<String, String> getCardDetail(Connection conn,	WhereUtil rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Map<String, String> list = null;
		List<Object[]> paramCondition =  rp.getParamConditionList();
		
		DataSet ds = T.load("user_card", conn).W(paramCondition).Q("count(id) as num,sum(affect_money) as money,sum(use_money) as use_money"); 
		list = BeanMapUtils.dataSetToListMap(ds).get(0);
		
		return list;
	}


	public String getUserXcode(Connection conn,	String uid) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Map<String, String> xcode = new HashMap<>();
		try{
		DataSet ds = T.load("xcode", conn).W(Tools.BuildWhereMap("ukey", uid, "=")).Q("xcode"); 
		xcode = BeanMapUtils.dataSetToListMap(ds).get(0);
		}catch(Exception e){
			
		}

		if(xcode.size()==0){
			String newCode ="";
			try{
				DataSet dsa = T.load("xcode", conn).O("xcode DESC").Q("xcode");
				Map<String, String> xcodea = BeanMapUtils.dataSetToListMap(dsa).get(0);
				newCode = (DfMath.toIntValue(xcodea.get("xcode"))+1)+"";
			}catch(Exception e){
				newCode = "10000";
			}
			
			if(Long.valueOf(newCode)<10000) newCode="10001";
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("xcode", newCode);
			paramMap.put("add_time", Tools.getLongTime());
			paramMap.put("expired_time", Tools.timeAddMonth(36, Tools.getLongTime()+""));
			paramMap.put("status", 0);
			paramMap.put("ukey", uid);
			BaseDao.insert(conn, "xcode", paramMap);
			xcode.put("xcode", newCode);
		}
		
		return xcode.get("xcode");
	}




	public HashMap<String,Object> getRecommendList(Connection conn,	String uid) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String orderBy = "id DESC";
		
		DataSet totalCount = T.load("user", conn).W(Tools.BuildWhereMap("recommend_id", uid, "=")).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("recommend_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user", conn).L(begin,pageSize).W(Tools.BuildWhereMap("recommend_id", uid, "=")).O(orderBy).Q("user_name,user_phone,reg_time,id"); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list,conn);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		
		return pageVar;
	}



	 

	 



	 

}
