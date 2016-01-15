package com.dfp2p.core.admin.Management;

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

@Repository("adminManagementDao")
public class AdminManagementDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getManagementList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{	
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "au.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("admin_user au", conn).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("admin_user au", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		
		filterList(list);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}
	public List<Map<String,String>> getRoleList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{	
		DataSet ds = T.load("admin_group", conn).Q("group_id,groupname"); 
		List<Map<String, String>> list = BeanMapUtils.dataSetToListMap(ds);

		return list;
	}
 

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("last_log_time", dao.parseTime(map.get("last_log_time")));
		}
	}


	public Long addManagement(Connection conn, Map<String, Object> paramMap) throws SQLException {
		return dao.insert(conn, "admin_user", paramMap);
	}


	public Long delManagement(Connection conn, HashMap<String, Object> rp) throws ClassNotFoundException, SQLException, DataException, IOException {
		return dao.delete(conn, "admin_user", rp);
	}


}
