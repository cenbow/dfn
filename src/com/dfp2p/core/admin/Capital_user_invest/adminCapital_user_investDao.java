package com.dfp2p.core.admin.Capital_user_invest;

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

@Repository("adminCapital_user_investDao")
public class adminCapital_user_investDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getInvestorList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "i.{id,investor_uid,status,investor_capital,use_reward_money,borrow_id,add_time},b.{borrow_name}";
		paramField+=",m.{user_name},mi.real_name";
		String paramJoin1 ="user m ON m.id=i.investor_uid";
		String paramJoin2 ="user_info mi ON mi.uid=i.investor_uid";
		String paramJoin3 ="borrow_info b ON b.id=i.borrow_id";
		String orderBy = "i.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_investor i", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count =Integer.parseInt(countStr);
		
		page.setTotalCount(count);
		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_investor i", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
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
