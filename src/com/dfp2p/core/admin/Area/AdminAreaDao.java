package com.dfp2p.core.admin.Area;

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

@Repository("adminAreaDao")
public class AdminAreaDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getAreaList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "a.sort_order asc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		
		
		DataSet ds = T.load("area a", conn).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		
		pageVar.put("data", list);
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("add_time", dao.parseTime(map.get("add_time")));
		}
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




	public Long addMenu(Connection conn, Map<String, Object> paramMap) throws SQLException {
		return dao.insert(conn, "menu", paramMap);
	}




	public Long deleteMenu(Connection conn, HashMap<String, Object> rp) throws ClassNotFoundException, SQLException, DataException, IOException {
		return dao.delete(conn, "menu", rp);
	}



 






	 

	 



	 

}
