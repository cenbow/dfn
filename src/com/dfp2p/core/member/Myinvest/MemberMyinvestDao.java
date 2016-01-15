package com.dfp2p.core.member.Myinvest;

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
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("memberMyinvestDao")
public class MemberMyinvestDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	



	public HashMap<String, Object> getMyinvestList(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "i.{id,investor_capital,investor_interest,status,deadline,add_time as invest_time,borrow_id},m.user_name as borrow_user,b.borrow_duration,b.has_pay,b.borrow_interest_rate"
				+ ",b.add_time as borrow_time,b.borrow_money,b.borrow_name,mm.credits,b.repayment_type,b.borrow_type,b.has_pay,b.total,c.id as cid";
		String paramJoin1 = "borrow_info b ON b.id=i.borrow_id";
		String paramJoin2 = "user m ON m.id=b.borrow_uid";
		String paramJoin3 = "user_count mm ON mm.uid=b.borrow_uid";
		String paramJoin4 = "credit_assignment c ON c.invest_id=i.id";
		String orderBy = "i.add_time DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_investor i", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin4).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("invest_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_investor i", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin4).L(begin,pageSize).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list,conn);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list,Connection conn) {
		for(Map<String, String> map:list)
		{
			map.put("invest_time", dao.parseTime(map.get("invest_time")));
			map.put("deadline", dao.parseTime(map.get("deadline")));
			map.put("url", Common.getBorrowUrlString(map.get("borrow_id")));
		}
	}


 

	public List<Map<String,String>> getInvestorDetail(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String orderBy = "sort_order ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet ds = T.load("investor_detail", conn).W(paramCondition).O(orderBy).Q(null); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list,conn);
		
		return list;
	}
	
	public Map<String, String> getTransferInfo(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		DataSet ds = T.load("credit_assignment", conn).W(paramCondition).Q("id"); 
		Map<String, String> list = BeanMapUtils.dataSetToListMap(ds).get(0);
		return list;
	}







	 

	 



	 

}
