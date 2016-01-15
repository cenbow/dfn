package com.dfp2p.core.admin.Daily;

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
import com.dfp2p.util.WhereUtil;

@Repository("adminDailyDao")
public class AdminDailyDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getDailyList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "*";
		String orderBy = "f.id desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("financing f", conn).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("list_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("financing f", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}



	public HashMap<String, Object> getDaily(Connection conn,String id) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "*";
		
		DataSet ds = T.load("financing f", conn).W(Tools.BuildWhereMap("f.id", id, "=")).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list.get(0));
		return pageVar;
	}


	public HashMap<String, Object> getDailyDetailList(Connection conn,String detailId) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		WhereUtil wm=new WhereUtil();
		wm.getStringCondition("id", detailId, "in");
		
		DataSet ds = T.load("investor_detail", conn).W(wm.getParamConditionList()).Q("sort_order,total,capital,interest");
		list = BeanMapUtils.dataSetToListMap(ds);
		
		pageVar.put("data", list);
		return pageVar;
	}




	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			//String timeMillis = dao.parseTime(map.get("add_time"));
			//map.put("add_time", timeMillis);
		}
	}




	public HashMap<String, Object> getDailyExcelList(Connection conn,
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
