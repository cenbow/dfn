package com.dfp2p.core.app.msg;

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

@Repository("appMsgDao")
public class AppMsgDao {
	private static Log logger = LogFactory.getLog(AppMsgDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.id,b.borrow_name,b.borrow_interest_rate,b.borrow_money,b.has_borrow,b.collect_time,b.borrow_duration,b.repayment_type";
		String orderBy = "field(b.borrow_status,'2','4','6','7'),b.id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet totalCount = T.load("borrow_info b", conn).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_info b", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		pageVar.put("totalPage",page.getTotalPage()+"");
		pageVar.put("curPage",page.getCurrentPage()+"");
		filterList(list);
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	 

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			map.put("collect_time", dao.parseTime(map.get("collect_time")));
			map.put("borrow_times", dao.parseTime(map.get("borrow_times")));
		}
	}



	public Map<String,String> getDetail(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "s.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		 
		DataSet ds = T.load("site_msg s", conn).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		dao.parseResultDate(list,new String[]{"add_time"});
		return list!=null?list.get(0):null;
	}



	public HashMap<String, Object> getInvestinfo(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "bi.investor_capital,bi.add_time,m.user_name,bi.is_auto";
		String join = "user m ON bi.investor_uid = m.id";
		String orderBy = "bi.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet ds = T.load("borrow_investor bi", conn).LJ(join).W(paramCondition).L(0,100).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		dao.parseResultDate(list,new String[]{"full_time","check_time","borrow_times"});
		pageVar.put("data", list);
		return pageVar;
	}



	public HashMap<String, Object> getSite_msgList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {

		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "s.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet totalCount = T.load("site_msg s", conn).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("site_msg s", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		pageVar.put("totalPage",page.getTotalPage()+"");
		pageVar.put("curPage",page.getCurrentPage()+"");
		dao.parseResultDate(list,new String[]{"full_time","check_time","borrow_times","send_time"});
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}



	public int getSite_msgByHas_readCount(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = null;
		String orderBy = "s.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet totalCount = T.load("site_msg s", conn).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		return count;
	}

	 

}
