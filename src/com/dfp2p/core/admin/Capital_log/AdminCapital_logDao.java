package com.dfp2p.core.admin.Capital_log;

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

@Repository("adminCapital_logDao")
public class AdminCapital_logDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getCapital_logList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "l.id,l.add_time,m.user_name,l.info,l.affect_money,l.freeze_money,l.collect_money,l.account_money,l.target_uname,l.type";
		String paramJoin1 ="user m ON m.id=l.uid";
		String orderBy = "l.id desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("user_moneylog l", conn).LJ(paramJoin1).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user_moneylog l", conn).LJ(paramJoin1).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}




	public Map<String,Object> menu_add(Connection conn, Map<String, Object> rp) throws NumberFormatException, SQLException {
		List<Map<String,String>> list = null;
		String paramField = "*";
		String orderBy = "v.id asc";
		
		DataSet ds = T.load("nav v", conn).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		Map<String,Object> map =  new HashMap<String,Object>();
		map.put("data", list);
		return map;
	}



	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			String timeMillis = dao.parseTime(map.get("add_time"));
			map.put("add_time", timeMillis);
		}
	}




	public HashMap<String, Object> getCapital_logExcelList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "l.id,l.add_time,m.user_name,l.info,l.affect_money,l.freeze_money,l.collect_money,l.account_money,l.target_uname,l.type";
		String paramJoin1 ="user m ON m.id=l.uid";
		String orderBy = "l.id desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("user_moneylog l", conn).LJ(paramJoin1).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		return pageVar;
	}


	
 



 






	 

	 



	 

}
