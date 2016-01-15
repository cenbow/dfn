package com.dfp2p.core.admin.Borrow_repayment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.dfp2p.base.BaseDao;
import com.dfp2p.core.admin.Borrow_check.AdminBorrow_checkDao;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Logger;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.logDb;

@Repository("adminBorrow_repaymentDao")
public class AdminBorrow_repaymentDao {
	private static Log logger = LogFactory.getLog(AdminBorrow_repaymentDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	


	public HashMap<String, Object> getBorrow_repaymentList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException
		{
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "m.user_name,m.customer_name,bi.id,bi.borrow_type,bi.borrow_name,bi.borrow_money,bi.repayment_type,bi.borrow_duration"
				+ ",bi.borrow_fee, bi.add_time,bi.repayment_money,bi.repayment_interest,bi.total,bi.has_pay,bi.borrow_fee,bi.deadline";
		String paramJoin1 = "user m ON bi.borrow_uid=m.id";
		String orderBy = "bi.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_info bi", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_info bi", conn).LJ(paramJoin1).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list,conn);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list,Connection conn) {
		for(Map<String, String> map:list)
		{
			HashMap<String, String> wmapHashMap = new HashMap<>();
			wmapHashMap.put("borrow_id", map.get("id"));
			wmapHashMap.put("sort_order", (Integer.valueOf(map.get("has_pay"))+1)+"");
			Map<String, String> detailInfo;
			try {
				detailInfo = getBorrowLeastRepayment(conn,wmapHashMap);
				map.put("capital", detailInfo.get("capital"));
				map.put("interest", detailInfo.get("interest"));
				map.put("sort_order", detailInfo.get("sort_order"));
				map.put("this_deadline", dao.parseTime(detailInfo.get("deadline")));
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				logger.error("获取近期还款详情出错"+e.toString());
			}
			map.put("unit", "4".equals(map.get("repayment_type"))?"天":"个月");
			map.put("add_time", dao.parseTime(map.get("add_time")));
			//map.put("deadline", dao.parseTime(map.get("deadline")));
		}
	}

	public Map<String,String> getBorrowLeastRepayment(Connection conn, Map<String, String> map) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		List<Object[]> paramCondition = new ArrayList<>();
		paramCondition.add(Tools.BuildWhereMapObj("borrow_id", map.get("borrow_id"),"="));
		paramCondition.add(Tools.BuildWhereMapObj("status", "7","="));
		paramCondition.add(Tools.BuildWhereMapObj("sort_order", map.get("sort_order"),"="));
		
		DataSet ds = T.load("investor_detail", conn).W(paramCondition).Q("sort_order,sum(capital-receive_capital) as capital,sum(interest-receive_interest) as interest,deadline"); 
		List<Map<String, String>> list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
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
	
	public  Long addVerify(Connection conn, Map<String, Object> rp) throws SQLException {
		return dao.insert(conn, "borrow_verify", rp);
	}
	public  Long eidtBorrowInfo(Connection conn, Map<String, Object> rp) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.update(conn, "borrow_info", rp,null);
	}
	

 

}
