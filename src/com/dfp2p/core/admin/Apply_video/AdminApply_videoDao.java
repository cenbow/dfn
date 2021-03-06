package com.dfp2p.core.admin.Apply_video;

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
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;

@Repository("adminApply_videoDao")
public class AdminApply_videoDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getApply_videoList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {

		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "v.apply_status,v.id,v.add_time,v.uid,m.reg_time,m.user_name"
				+ ",m.is_ban,m.user_phone,m.user_leve,m.time_limit,mi.real_name,mm.money_freeze,mm.money_collect,mm.account_money";
		String paramJoin1 = "user m ON m.id=v.uid";
		String paramJoin2 = "user_count mm ON mm.uid=v.uid";
		String paramJoin3 = "user_info mi ON mi.uid=v.uid";
		String orderBy = "v.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("apply_video v", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("apply_video v", conn).LJ(paramJoin1).LJ(paramJoin2).LJ(paramJoin3).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("reg_time", dao.parseTime(map.get("reg_time")));
			map.put("add_time", dao.parseTime(map.get("add_time")));
		}
	}


}
