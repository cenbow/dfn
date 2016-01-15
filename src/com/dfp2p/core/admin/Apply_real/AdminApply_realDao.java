package com.dfp2p.core.admin.Apply_real;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminApply_realDao")
public class AdminApply_realDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	

	 

	public HashMap<String, Object> getApply_realList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException 
			{

		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.reg_time,m.user_name,m.user_phone,m.user_leve,m.time_limit,mi.uid,mi.card_img"
				+ ",mi.idcard,mi.id_status,mi.id_time,mi.real_name,mm.money_freeze,mm.money_collect,mm.account_money";
		String paramJoin1 = "user m ON m.id=mi.uid";
		String paramJoin2 = "user_count mm ON mm.uid=mi.uid";
		String orderBy = "mi.uid DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("user_info mi", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("user_info mi", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 

		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		dao.parsePHPSerializer(list,"card_img");
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			String timeMillis = dao.parseTime(map.get("reg_time"));
			map.put("reg_time", timeMillis);
			String timeMillis1 = dao.parseTime(map.get("id_time"));
			map.put("id_time", timeMillis1);
		}
		
	}


 


	 



	 

}
