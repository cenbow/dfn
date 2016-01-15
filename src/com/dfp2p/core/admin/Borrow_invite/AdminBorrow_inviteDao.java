package com.dfp2p.core.admin.Borrow_invite;

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

@Repository("adminBorrow_inviteDao")
public class AdminBorrow_inviteDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	


	public HashMap<String, Object> getBorrow_inviteList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,m.customer_name,bi.id,bi.borrow_type,bi.borrow_name,bi.borrow_money,bi.repayment_type,bi.borrow_duration"
				+ ",bi.borrow_fee, bi.add_time,bi.has_borrow,bi.collect_time";
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
			map.put("unit", "4".equals(map.get("repayment_type"))?"天":"个月");
			map.put("add_time", dao.parseTime(map.get("add_time")));
		}
	}

	public Map<String,String> getBorrowInfo(Connection conn, Map<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "*";
		String paramJoin1 = "borrow_addinfo ba ON ba.borrow_id=b.id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("borrow_info b", conn).LJ(paramJoin1).W(paramCondition).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}
	
	public  Long saveVerify(Connection conn, Map<String, Object> rp) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.update(conn, "borrow_verify", rp, null);
	}
	public  Long eidtBorrowInfo(Connection conn, Map<String, Object> rp) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.update(conn, "borrow_info", rp,null);
	}
	

}
