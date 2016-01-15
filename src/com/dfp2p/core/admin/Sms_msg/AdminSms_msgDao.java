package com.dfp2p.core.admin.Sms_msg;

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

@Repository("adminSms_msgDao")
public class AdminSms_msgDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getSms_msgList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField =  null;
		String orderBy = "s.send_time DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("sms_msg s", conn).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("sms_msg s", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
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
		}
	}


	public  Long addUser(Connection conn, Map<String, Object> rp) throws SQLException {
		return dao.insert(conn, "user", rp);
	}
	public  Long addUser_info(Connection conn, Map<String, Object> rp) throws SQLException {
		return dao.insert(conn, "user_info", rp);
	}

	public Map<String,String> getUser_edit(Connection conn, Map<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "m.id,mi.uid,"
						+	"m.user_name,"
						+   "m.user_type,"
						+   "m.is_ban,"
						+   "m.user_phone ,"
						+   "m.user_email ,"
						+   "m.customer_id ,"
						+   "mi.address ,"
						+   "mi.age ,"
						+   "mi.idcard ,";
		
		
		String paramJoin1 = "user_count mm ON mm.uid=m.id";
		String paramJoin2 = "user_info mi ON mi.uid=m.id";
		String orderBy = "m.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}

	public Long doEdit(Connection conn, String tableName, Map<String, Object> updateFields,List<Object[]> paramCondition) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.update(conn, tableName, updateFields, paramCondition);
	}

	public Map<String, String> getCredit_edit(Connection conn,
			Map<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,mm.*";
		
		String paramJoin1 = "user_count mm ON m.id=mm.uid";
		String orderBy = "m.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}

	public Map<String, String> getMoney_edit(Connection conn,
			Map<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		return getCredit_edit(conn, rp);
	}

	public Map<String, Object> getUser_nameList(Connection conn,
			Map<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Map<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "*";
		String paramJoin1 = "user_count mm ON mm.uid=m.id";
		String paramJoin2 = "user_info mi ON mi.uid=m.id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
	 
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);

		pageVar.put("data", list);
//		pageVar.put("pageBar", page.getPageBar());
		Tools.printData(list);
		return pageVar;
	}

}
