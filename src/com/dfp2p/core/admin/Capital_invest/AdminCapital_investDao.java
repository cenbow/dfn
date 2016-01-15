package com.dfp2p.core.admin.Capital_invest;

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

@Repository("adminCapital_investDao")
public class AdminCapital_investDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getInvestorList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "i.investor_uid as id,count(i.id) as num,sum(i.investor_capital*b.total-i.use_reward_money*b.total) as investor_capital_duration,sum(i.investor_capital-i.use_reward_money) as investor_capital,sum(i.investor_interest) as investor_interest,sum(i.receive_capital-i.use_reward_money) as receive_capital,sum(i.receive_interest) as receive_interest,sum(i.invest_fee) as invest_fee,sum(i.paid_fee) as paid_fee";
		paramField+=",m.{user_name},mi.real_name";
		String paramJoin1 ="user m ON m.id=i.investor_uid";
		String paramJoin2 ="user_info mi ON mi.uid=i.investor_uid";
		String paramJoin3 ="borrow_info b ON b.id=i.borrow_id";
		String orderBy = "i.investor_capital DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_investor i", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).G("i.investor_uid").Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count =Integer.parseInt(countStr);
		
		page.setTotalCount(count);
		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_investor i", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).L(begin,pageSize).O(orderBy).G("i.investor_uid").Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list);
		
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



	public HashMap<String, Object> getCapital_investExcelList(
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
