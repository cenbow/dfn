package com.dfp2p.core.admin.Group;

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

@Repository("adminGroupDao")
public class AdminGroupDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	public HashMap<String, Object> getRoleList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "g.{group_id,status,groupname,groupinfo}";
		String orderBy = "g.group_id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");


		DataSet totalCount = T.load("admin_group g", conn).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
		page.setAjaxPageBar("list_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("admin_group g", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}
	
	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			//map.put("add_time", dao.parseTime(map.get("add_time")));
		}
	}

	public Map<String, String> getGroupData(Connection conn,PageData pd) throws NumberFormatException, ClassNotFoundException, SQLException, IOException,IndexOutOfBoundsException {
		String id=pd.get("id");
		DataSet groupInfoData = T.load("admin_group", conn).W(Tools.BuildWhereMap("id",id , "=")).Q(null);
		Map<String, String> groupInfo = BeanMapUtils.dataSetToListMap(groupInfoData).get(0);
		return groupInfo;
	}
	 
	public HashMap<String, Object> getMenuList(Connection conn,PageData pd) throws NumberFormatException, ClassNotFoundException, SQLException, IOException,IndexOutOfBoundsException {
		String id=pd.get("id");
		DataSet groupInfoData = T.load("admin_group", conn).W(Tools.BuildWhereMap("id",id , "=")).Q(null);
		Map<String, String> groupInfo = BeanMapUtils.dataSetToListMap(groupInfoData).get(0);
		return null;
	}
	
	public Map<String, String> role_edit(Connection conn,Map<String, Object>rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException,IndexOutOfBoundsException {
		DataSet groupInfoData = T.load("admin_group", conn).W((List<Object[]>) rp.get("paramCondition")).Q(null);
		Map<String, String> groupInfo = BeanMapUtils.dataSetToListMap(groupInfoData).get(0);
		return groupInfo;
	}
	
	public  Long addGroup(Connection conn, Map<String, Object> rp) throws SQLException {
			return dao.insert(conn, "admin_group", rp);
	}

	public Long editGroup(Connection conn, String tableName, Map<String, Object> updateFields) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.update(conn, tableName, updateFields, null);
	}

	public Long deleteGroup(Connection conn, String tableName, Map<String, Object> paramFields) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.delete(conn, tableName, paramFields);
	}






	 

	 



	 

}
