package com.dfp2p.core.admin.Borrow_see;

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
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminBorrow_seeDao")
public class AdminBorrow_seeDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 



	public HashMap<String, Object> getBorrow_seeList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,m.customer_name,bi.id,bi.borrow_type,bi.borrow_name,bi.borrow_money,bi.repayment_type,bi.borrow_duration"
				+ ",bi.borrow_fee, bi.add_time,bi.borrow_use,bi.borrow_interest_rate,bi.borrow_info,bi.can_auto,bi.borrow_pass,bi.collect_day"
				+ ",bi.borrow_max,bi.borrow_status";
		String paramJoin1 = "user m ON bi.borrow_uid=m.id";
		String orderBy = "bi.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_info bi", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_info bi", conn).LJ(paramJoin1).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("add_time", dao.parseTime(map.get("add_time")));
		}
	}

 

}
