package com.dfp2p.core.admin.User_upload;

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

@Repository("adminUser_uploadDao")
public class AdminUser_uploadDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getUploadList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
			{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "u.*,m.reg_time,m.user_name,m.customer_name,m.user_leve,m.time_limit,mi.real_name";
		String paramJoin1 = "user_info mi ON mi.uid=u.uid";
		String paramJoin2 = "user m ON u.uid=m.id";
		String orderBy = "m.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("user_upload u", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user_upload u", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
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


	public HashMap<String, Object> getUser_info(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException,
			SQLException, ClassNotFoundException, IOException {
		// TODO Auto-generated method stub
		Page page = new Page();
		HashMap<String, Object> pageVar = new HashMap<String, Object>();
		List<Map<String, String>> list = null;
		String paramField = "m.user_phone,mi.card_img,mi.real_name,mi.idcard,mi.age,mi.province,mi.city_now,mi.sex,mi.marry,mi.education,mi.income,"
				+ "mi.zy,mi.info,mi.address,mci.contact,mci.department,"
				+ "mci.financial,mci.house,mci.ensure";
		String paramJoin1 = "user_info mi ON mi.uid=m.id";
		String paramJoin2 = "user_common_info mci ON mci.uid=m.id";
		List<Object[]> paramCondition = (List<Object[]>) rp
				.get("paramCondition");

		String orderBy = "m.id";
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2)
				.W(paramCondition).Q(paramField);
		list = BeanMapUtils.dataSetToListMap(ds);
		Map<String, Object> card_img = dao.parsePHPSerializerToMap(list,
				"card_img");
		pageVar.put("PHP_card_img", card_img);

		Map<String, Object> contact = dao.parsePHPSerializerToMap(list,
				"contact");
		pageVar.put("PHP_contact", contact);
		Map<String, Object> department = dao.parsePHPSerializerToMap(list,
				"department");
		pageVar.put("PHP_department", department);
		Map<String, Object> financial = dao.parsePHPSerializerToMap(list,
				"financial");
		pageVar.put("PHP_financial", financial);
		Map<String, Object> house = dao.parsePHPSerializerToMap(list,
				"house");
		pageVar.put("PHP_house", house);
		Map<String, Object> ensure = dao.parsePHPSerializerToMap(list,
				"ensure");
		pageVar.put("PHP_ensure", ensure);
         
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	public HashMap<String, Object> getEgroupList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		
		
		DataSet ds = T.load("egroup e", conn).W(paramCondition).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		
		pageVar.put("data", list);
		return pageVar;
	}


	public Long addEgroup(Connection conn, Map<String, Object> paramMap) throws SQLException {
		return dao.insert(conn, "egroup", paramMap);
	}

	public Long delete_egroup(Connection conn, Map<String, Object> paramMap) throws SQLException, ClassNotFoundException, DataException, IOException {
		return dao.delete(conn, "egroup", paramMap);
	}

}
