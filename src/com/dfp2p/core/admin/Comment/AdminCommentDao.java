package com.dfp2p.core.admin.Comment;

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

@Repository("adminCommentDao")
public class AdminCommentDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getCommentList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField =  "c.*,m.user_name";
		String paramJoin1 = "user m on m.id = c.uid";
		String orderBy = "c.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("comment c", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("comment c", conn).LJ(paramJoin1).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			String timeMillis = dao.parseTime(map.get("edit_time"));
			map.put("edit_time", timeMillis);
			String timeMillis1 = dao.parseTime(map.get("add_time"));
			map.put("add_time", timeMillis1);
		}
	}


}
