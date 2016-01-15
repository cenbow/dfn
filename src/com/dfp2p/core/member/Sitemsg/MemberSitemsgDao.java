package com.dfp2p.core.member.Sitemsg;

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
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("memberSitemsgDao")
public class MemberSitemsgDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	



	public HashMap<String, Object> getSitemsgList(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page(99999);
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String paramJoin1 = "user m ON m.id=s.uid";
		String paramJoin2 = "user_info mi ON mi.uid=s.uid";
		String orderBy = "s.send_time DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("site_msg s", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("list_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("site_msg s", conn).LJ(paramJoin1).LJ(paramJoin2).L(begin,pageSize).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list,conn);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list,Connection conn) {
		for(Map<String, String> map:list)
		{
			map.put("send_time", dao.parseTime(map.get("send_time")));
			map.put("read_time", dao.parseTime(map.get("read_time")));
		}
	}

	public Long updateSitemsg(Connection conn,
			HashMap<String, Object> paramFields, HashMap<String, Object> rp) throws ClassNotFoundException, SQLException, IOException, DataException {
		return BaseDao.update(conn, "site_msg", paramFields, (List<Object[]>)rp.get("paramCondition"));
	}


 

	 

	 



	 

}
