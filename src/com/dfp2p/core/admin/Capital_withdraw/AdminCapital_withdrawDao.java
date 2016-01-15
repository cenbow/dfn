package com.dfp2p.core.admin.Capital_withdraw;

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

@Repository("adminCapital_withdrawDao")
public class AdminCapital_withdrawDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getWithdraw_logList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "wv.*,m.user_name,m.customer_name,mi.real_name";
		String paramJoin1 ="user m ON m.id=wv.uid";
		String paramJoin2 ="user_info mi ON mi.uid=wv.uid";
		String orderBy = "wv.totalWithdrawMoney DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("withdraw_view wv", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("withdraw_view wv", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}




	public HashMap<String, Object> getCapital_withdrawExcelList(
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
