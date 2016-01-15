package com.dfp2p.core.admin.Capital_user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminCapital_userDao")
public class AdminCapital_userDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getCapital_userList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,wv.totalWithdrawMoney,rv.totalMoney,m.id,mi.real_name,m.reg_time,m.user_name,mm.money_freeze,mm.money_collect,mm.account_money,m.customer_name";
		String paramJoin1 ="user_count mm ON mm.uid=m.id";
		String paramJoin2 ="recharge_view rv ON rv.uid=m.id";
		String paramJoin3 ="withdraw_view wv ON wv.uid=m.id";
		String paramJoin4 ="user_info mi ON mi.uid=m.id";
		String orderBy = "mm.account_money desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin4).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin4).W(paramCondition).O(orderBy).L(begin,pageSize)/*.O(orderBy)*/.Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	public HashMap<String, Object> getCapital_userExcelList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,wv.totalWithdrawMoney,rv.totalMoney,m.id,mi.real_name,m.reg_time,m.user_name,mm.money_freeze,mm.money_collect,mm.account_money,m.customer_name";
		String paramJoin1 ="user_count mm ON mm.uid=m.id";
		String paramJoin2 ="recharge_view rv ON rv.uid=m.id";
		String paramJoin3 ="withdraw_view wv ON wv.uid=m.id";
		String paramJoin4 ="user_info mi ON mi.uid=m.id";
//		String orderBy = "m.id desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin4).W(paramCondition)/*.O(orderBy)*/.Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		return pageVar;
	}


	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("reg_time", dao.parseTime(map.get("reg_time")));
		}
	}




	 

}
