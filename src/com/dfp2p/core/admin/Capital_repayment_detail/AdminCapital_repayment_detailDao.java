package com.dfp2p.core.admin.Capital_repayment_detail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;

import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminCapital_repayment_detailDao")
public class AdminCapital_repayment_detailDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getBorrowList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.{borrow_name,borrow_type},bv.{borrow_id,repayment_time,sort_order,total,deadline,totalInvestCapital as capital,totalInvestInterest as interest,totalInterestFee as interest_fee,totalReceiveInterest as receive_interest,totalReceiveCapital as receive_capital}";
		paramField+=",m.{user_name},mi.real_name";
		String paramJoin1 ="user m ON m.id=bv.borrow_uid";
		String paramJoin2 ="user_info mi ON mi.uid=bv.borrow_uid";
		String paramJoin3 ="borrow_info b ON b.id=bv.borrow_id";
		String orderBy = "bv.borrow_id DESC,bv.sort_order ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet totalCount = T.load("borrow_view bv", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).Q("count(bv.id) as num");
		Map<String, String> countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0);
		int count=DfMath.toIntValue(countStr.get("num"));
		/*for (int i = 0; i < countStr.size(); i++) {
			Map<String, String> array_element = countStr.get(i);
			int tmpcount=DfMath.toIntValue(array_element.get("totalCount"));
			count+=tmpcount;
			System.out.print("总页数是："+tmpcount+"**"+countStr.size()+"\r\n");
		}*/

		
		page.setTotalCount(count);
		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_view bv", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	public HashMap<String, Object> getBorrowListGroup(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.{borrow_name,borrow_type},d.{borrow_id,id,repayment_time,sort_order,total,deadline},sum(d.capital) as capital,sum(d.interest) as interest,sum(d.interest_fee) as interest_fee,sum(d.receive_interest) as receive_interest,sum(d.receive_capital) as receive_capital";
		paramField+=",m.{user_name},mi.real_name,sum(bi.use_reward_money) as use_reward_money";
		String paramJoin1 ="user m ON m.id=d.investor_uid";
		String paramJoin2 ="user_info mi ON mi.uid=d.investor_uid";
		String paramJoin3 ="borrow_info b ON b.id=d.borrow_id";
		String paramJoin5 ="borrow_investor bi ON bi.id=d.invest_id";
		String orderBy = "b.id DESC,d.sort_order ASC";
		String groupBy="d.borrow_id,d.investor_uid,d.sort_order";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet totalCount = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin5).W(paramCondition).G(groupBy).Q("count(1) as totalCount");
		List<Map<String, String>> countStr = BeanMapUtils.dataSetToListMap(totalCount);
		int count=countStr.size();
		/*for (int i = 0; i < countStr.size(); i++) {
			Map<String, String> array_element = countStr.get(i);
			int tmpcount=DfMath.toIntValue(array_element.get("totalCount"));
			count+=tmpcount;
			System.out.print("总页数是："+tmpcount+"**"+countStr.size()+"\r\n");
		}*/

		
		page.setTotalCount(count);
		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin5).W(paramCondition).L(begin,pageSize).G(groupBy).O(orderBy).Q(paramField); 
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



	public HashMap<String, Object> getCapital_repayment_detailExcelList(
			Connection conn, HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.{borrow_name,borrow_type},d.{borrow_id,id,repayment_time,sort_order,total,deadline},d.capital as capital,d.interest as interest,d.interest_fee as interest_fee,d.receive_interest as receive_interest,d.receive_capital as receive_capital";
		paramField+=",m.{user_name},mi.real_name,bi.use_reward_money as use_reward_money";
		String paramJoin1 ="user m ON m.id=d.investor_uid";
		String paramJoin2 ="user_info mi ON mi.uid=d.investor_uid";
		String paramJoin4 ="user_info bmi ON bmi.uid=d.borrow_uid";
		String paramJoin3 ="borrow_info b ON b.id=d.borrow_id";
		String paramJoin5 ="borrow_investor bi ON bi.id=d.invest_id";
		String orderBy = "b.id DESC,d.sort_order ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet ds = T.load("investor_detail d", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).LJ(paramJoin4).LJ(paramJoin5).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		
		for(Map<String, String> map:list)
		{
			map.put("deadline", dao.parseTime(map.get("deadline")));
			map.put("repayment_time", dao.parseTime(map.get("repayment_time")));
			map.put("unit", ("4".equals(map.get("repayment_type")))?"天":"个月");
		}
		
		pageVar.put("data", list);
		return pageVar;
	}
	



 




	
 



 






	 

	 



	 

}
