package com.dfp2p.core.admin.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.core.home.Borrow.BorrowController;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Logger;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminUserDao")
public class AdminUserDao {
	private static Log logger = LogFactory.getLog(AdminUserDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getUserList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.id,m.reg_time,m.user_phone,m.user_name,m.user_type,m.customer_name,m.user_leve,m.time_limit,mi.real_name,mm.money_freeze,mm.money_collect,mm.account_money,mm.credits";
		String paramJoin1 = "user_count mm ON mm.uid=m.id";
		String paramJoin2 = "user_info mi ON mi.uid=m.id";
		String orderBy = "m.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		/*for (int i = 0; i < paramCondition.size(); i++) {
			Object[] array_element = paramCondition.get(i);
			for (int j = 0; j < array_element.length; j++) {
				Object objects = array_element[j];
				System.out.print("#######最终查询条件########"+objects.toString()+"\r\n");
			}
		}*/


		DataSet totalCount = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		DataSet ds;
		if(rp.containsKey("toExcel")&&"1".equals(rp.get("toExcel")))   ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).O(orderBy).Q(paramField); 
		else  ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	public  Long addUser(Connection conn, Map<String, Object> rp) throws SQLException {
		return dao.insert(conn, "user", rp);
	}
	public  Long addUser_info(Connection conn, Map<String, Object> rp) throws SQLException {
		return dao.insert(conn, "user_info", rp);
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("reg_time", dao.parseTime(map.get("reg_time")));
		}
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
						+   "mi.idcard ,m.time_limit,m.user_leve,";
		
		
		String paramJoin1 = "user_count mm ON mm.uid=m.id";
		String paramJoin2 = "user_info mi ON mi.uid=m.id";
		String orderBy = "m.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}

	public Long doEdit(Connection conn, String tableName, Map<String, Object> updateFields,List<Object[]> paramCondition) throws SQLException, ClassNotFoundException, IOException, DataException {
		try{
		if(!"0".equals(updateFields.get("customer_id"))){
			DataSet auds = T.load("admin_user", conn).W(Tools.BuildWhereMap("id", updateFields.get("customer_id")+"", "=")).Q("user_name");
			Map<String, String> aui = BeanMapUtils.dataSetToListMap(auds).get(0);
			updateFields.put("customer_name", aui.get("user_name"));
		}
		}catch(Exception e){
			
		}
		
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
