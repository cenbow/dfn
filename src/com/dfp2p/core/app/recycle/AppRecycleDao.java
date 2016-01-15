package com.dfp2p.core.app.recycle;

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

@Repository("appRecycleDao")
public class AppRecycleDao {
	private static Log logger = LogFactory.getLog(AppRecycleDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getInvestorByUidList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "i.id,i.investor_capital,i.deadline,i.add_time as invest_time,m.user_name as borrow_user,b.borrow_duration,b.has_pay,b.borrow_interest_rate,b.total,b.recheck_time,b.borrow_money,b.borrow_name,b.repayment_type,b.borrow_type";
		String join1 = "borrow_info b ON b.id=i.borrow_id";
		String join2 = "user m ON m.id=b.borrow_uid";
		String orderBy = "i.deadline ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet totalCount = T.load("borrow_investor i", conn).LJ(join1).LJ(join2).W(paramCondition) .Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("user_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_investor i", conn).LJ(join1).LJ(join2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		pageVar.put("totalPage",page.getTotalPage()+"");
		pageVar.put("curPage",page.getCurrentPage()+"");
		dao.parseResultDate(list,new String[]{"deadline","recheck_time","add_time"});
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

	 

	 


	public Map<String,String> getDetail(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "i.id,i.investor_capital,i.investor_interest,i.receive_capital,i.receive_interest,i.deadline,"
				+ "i.add_time as invest_time,b.borrow_duration,b.has_pay,b.borrow_interest_rate,b.total,b.recheck_time,"
				+ "b.borrow_money,b.borrow_name,b.repayment_type,b.borrow_type,i.deadline";
		String join = "borrow_info b ON b.id=i.borrow_id";
		String orderBy = "i.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		 
		DataSet ds = T.load("borrow_investor i", conn).LJ(join).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		dao.parseResultDate(list,new String[]{"deadline"});
		return list!=null?list.get(0):null;
	}



	 
	 



	 
	 

}
