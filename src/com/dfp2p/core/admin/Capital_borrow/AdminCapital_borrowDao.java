package com.dfp2p.core.admin.Capital_borrow;

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

@Repository("adminCapital_borrowDao")
public class AdminCapital_borrowDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getBorrowList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.{id,deadline,borrow_name,borrow_uid,borrow_duration,borrow_money,borrow_interest,borrow_interest_rate,borrow_fee,has_borrow,repayment_money,repayment_interest,repayment_type,borrow_type,borrow_status,add_time,total,has_pay}";
		paramField+=",(b.has_borrow+b.borrow_interest-b.repayment_money-b.repayment_interest) as dh,m.{user_name},mi.real_name";
		String paramJoin1 ="user m ON m.id=b.borrow_uid";
		String paramJoin2 ="user_info mi ON mi.uid=b.borrow_uid";
		String orderBy = "b.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_info b", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_info b", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
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
			map.put("unit", ("4".equals(map.get("repayment_type")))?"天":"个月");
		}
	}



	public HashMap<String, Object> getCapital_borrowExcelList(
			Connection conn, HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "wv.*,m.user_name,m.customer_name,mi.real_name";
		String paramJoin1 ="user m ON m.id=wv.uid";
		String paramJoin2 ="user_info mi ON mi.uid=wv.uid";
		String orderBy = "wv.totalWithdrawMoney DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("withdraw_view wv", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list);
		
		pageVar.put("data", list);
		return pageVar;
	}
	



 




	
 



 






	 

	 



	 

}
