package com.dfp2p.core.admin.Card;

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
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminUser_cardDao")
public class AdminUser_cardDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 



	public HashMap<String, Object> getUser_cardList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {

		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,c.*";
		String paramJoin1 = "user m ON c.uid=m.id";
		String orderBy = "c.uid DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("user_card c", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user_card c", conn).LJ(paramJoin1).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
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
			if(DfMath.toIntValue(map.get("use_time"))>0) map.put("use_time", dao.parseTime(map.get("use_time")));
			else  map.put("use_time", "未使用");
			map.put("expired_time", dao.parseTime(map.get("expired_time")));
		}
	}

	public HashMap<String, Object> getUser_creditExcelList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,l.*";
		String paramJoin1 = "user m ON l.uid=m.id";
		String orderBy = "l.uid DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet ds = T.load("user_creditslog l", conn).LJ(paramJoin1).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		pageVar.put("data", list);
		return pageVar;
	}
	




 

 


	 



	 

}
