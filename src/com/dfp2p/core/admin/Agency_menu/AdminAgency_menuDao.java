package com.dfp2p.core.admin.Agency_menu;

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

@Repository("adminAgency_menuDao")
public class AdminAgency_menuDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getAgency_menuList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
			{
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "am.sort_order asc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet ds = T.load("agency_menu am", conn).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("add_time", dao.parseTime(map.get("add_time")));
		}
	}



	 




	public Long addAgency_menu(Connection conn,
			Map<String, Object> paramMap) throws SQLException {
			return dao.insert(conn, "agency_menu", paramMap);
	}




	public Long delAgency_menu(Connection conn,
			HashMap<String, Object> rp) throws SQLException, ClassNotFoundException, DataException, IOException {
		return dao.delete(conn, "agency_menu", rp);
	}
 

 


	 



	 

}
