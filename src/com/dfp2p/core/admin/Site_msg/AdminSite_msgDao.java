package com.dfp2p.core.admin.Site_msg;

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
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminSite_msgDao")
public class AdminSite_msgDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getSite_msgList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,mi.real_name,i.is_important,i.msg,i.send_time,i.title,i.has_read,i.read_time,i.id,i.uid";
		String paramJoin1 = "user m ON i.uid=m.id";
		String paramJoin2 = "user_info mi ON mi.uid=i.uid";
		String orderBy = "i.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("site_msg i", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("site_msg i", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("send_time", dao.parseTime(map.get("send_time")));
			map.put("read_time", dao.parseTime(map.get("read_time")));
		}
	}

	public Long deleteMsg(Connection conn, HashMap<String, Object> rp) throws ClassNotFoundException, SQLException, DataException, IOException {
		return dao.delete(conn, "site_msg", rp);
	}


	 

}
