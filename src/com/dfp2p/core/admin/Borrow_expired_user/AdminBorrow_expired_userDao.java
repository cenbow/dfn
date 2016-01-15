package com.dfp2p.core.admin.Borrow_expired_user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;

import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminBorrow_expired_userDao")
public class AdminBorrow_expired_userDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 



	public HashMap<String, Object> getBorrow_expired_userList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "d.id,m.user_name,mi.real_name,m.customer_name,count(*) as num,sum(d.capital) as capital_all,sum(d.interest) as interest_all,d.borrow_uid";
		String paramJoin1 = "borrow_info b ON b.id=d.borrow_id";
		String paramJoin2 = "user m ON m.id=b.borrow_uid";
		String paramJoin3 = "user_info mi ON mi.uid=b.borrow_uid";
		String orderBy = "d.deadline ASC";
		String groupBy = "d.sort_order,d.borrow_id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).G(groupBy) .Q(null);
		int count = BeanMapUtils.dataSetToListMap(totalCount).size();
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).G(groupBy) .L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}
	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("deadline", dao.parseTime(map.get("deadline")));
		}
	}
	public HashMap<String, Object> getBorrow_expired_userExcelList(
			Connection conn, HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "d.id,m.user_name,mi.real_name,m.customer_name,count(*) as num,sum(d.capital) as capital_all,sum(d.interest) as interest_all,d.borrow_uid";
		String paramJoin1 = "borrow_info b ON b.id=d.borrow_id";
		String paramJoin2 = "user m ON m.id=b.borrow_uid";
		String paramJoin3 = "user_info mi ON mi.uid=b.borrow_uid";
		String orderBy = "d.deadline ASC";
		String groupBy = "d.sort_order,d.borrow_id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		
		DataSet ds = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).G(groupBy) .O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		return pageVar;
	}


 

}
