package com.dfp2p.core.admin.Borrow_expired;

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

@Repository("adminBorrow_expiredDao")
public class AdminBorrow_expiredDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 



	public HashMap<String, Object> getBorrow_expiredList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,m.customer_name,d.substitute_time,d.borrow_id as id,b.borrow_name"
				+ ",d.status,d.total,d.borrow_id,b.borrow_money,b.borrow_uid,d.sort_order,sum(d.capital) as capital"
				+ ",sum(d.interest) as interest,sum(d.substitute_money) as substitute_money,d.deadline,mi.real_name";
		String paramJoin1 = "borrow_info b ON b.id=d.borrow_id";
		String paramJoin2 = "user m ON m.id=b.borrow_uid";
		String paramJoin3 = "user_info mi ON mi.uid=b.borrow_uid";
		String orderBy = "d.deadline ASC";
		String groupBy = "d.sort_order,d.borrow_id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).G(groupBy) .Q(null);
		int count = BeanMapUtils.dataSetToListMap(totalCount).size();
		
		System.out.println("count="+count);
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
	public HashMap<String, Object> getBorrow_expiredExcelList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,m.customer_name,d.substitute_time,d.borrow_id as id,b.borrow_name"
				+ ",d.status,d.total,d.borrow_id,b.borrow_money,b.borrow_uid,d.sort_order,sum(d.capital) as capital"
				+ ",sum(d.interest) as interest,sum(d.substitute_money) as substitute_money,d.deadline,mi.real_name";
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
