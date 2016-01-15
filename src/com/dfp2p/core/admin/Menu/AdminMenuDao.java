package com.dfp2p.core.admin.Menu;

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

@Repository("adminMenuDao")
public class AdminMenuDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getMenuList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		Page page = new Page(9999);
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "m.sort_order asc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("menu m", conn).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("list_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("menu m", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
//		dao.parseTime(list, "reg_time");
		
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




	public Long addMenu(Connection conn, Map<String, Object> paramMap) throws SQLException {
		return dao.insert(conn, "menu", paramMap);
	}




	public Long deleteMenu(Connection conn, HashMap<String, Object> rp) throws ClassNotFoundException, SQLException, DataException, IOException {
		return dao.delete(conn, "menu", rp);
	}



 






	 

	 



	 

}
