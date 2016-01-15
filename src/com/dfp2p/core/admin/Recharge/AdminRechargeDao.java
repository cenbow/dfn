package com.dfp2p.core.admin.Recharge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;

import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminRechargeDao")
public class AdminRechargeDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 
	public Map<String, String> getRecharge(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		DataSet ds = T.load("recharge r", conn).W(Tools.BuildWhereMap("id", rp.get("id")+"","=")).Q(null); 
		Map<String, String> list = BeanMapUtils.dataSetToListMap(ds).get(0);
		return list;
	}
	 
	public Long updateRecharge(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException, DataException 
		{
		Long upres = BaseDao.update(conn, "recharge", rp, null);

		return upres;
	}


	public HashMap<String, Object> getRechargeList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "r.*, m.user_name, m.customer_name, mi.real_name";
		String paramJoin1 = "user m ON m.id=r.uid";
		String paramJoin2 = "user_info mi ON mi.uid=r.uid";
		String orderBy = "r.id desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("recharge r", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("list_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("recharge r", conn).LJ(paramJoin1).LJ(paramJoin2).L(begin,pageSize).W(paramCondition).O(orderBy).Q(paramField); 
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

	public HashMap<String, Object> getRechargeExcelList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "r.*, m.user_name, m.customer_name, mi.real_name";
		String paramJoin1 = "user m ON m.id=r.uid";
		String paramJoin2 = "user_info mi ON mi.uid=r.id";
		String orderBy = "r.id desc";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		 
		
		DataSet ds = T.load("recharge r", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		
		pageVar.put("data", list);
		
		return pageVar;
	}

 







	 

	 



	 

}
