package com.dfp2p.core.member.Mytransfer;

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
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("memberMytransferDao")
public class MemberMytransferDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	



	public HashMap<String, Object> getMyAcceptList(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "ci.{id,total,has_pay,get_all_money,receiver_money,t_id,receiver_money,real_get_money,status,start_time,end_time,add_time as invest_time,borrow_id},b.borrow_duration,b.has_pay,b.borrow_interest_rate"
				+ ",b.add_time as borrow_time,b.borrow_money,b.borrow_name,b.repayment_type,b.borrow_type";
		String paramJoin1 = "borrow_info b ON b.id=ci.borrow_id";
		String orderBy = "ci.add_time DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("credit_assignment_investor ci", conn).LJ(paramJoin1).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
//		page.setPageBar();
		page.setAjaxPageBar("invest_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("credit_assignment_investor ci", conn).LJ(paramJoin1).L(begin,pageSize).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list,conn);
		
		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		
		return pageVar;
	}

	private void filterList(List<Map<String, String>> list,Connection conn) {
		for(Map<String, String> map:list)
		{
			double dayAndreceiveMoney = DfMath.s2multi(DfMath.s2div(DfMath.s2sub(map.get("end_time"), map.get("start_time"))+"","86400", 2)+"",map.get("receiver_money"));
			double difMoneyAndYearDay = DfMath.s2multi(DfMath.s2sub(map.get("get_all_money"), map.get("receiver_money"))+"","365");
			double rate = DfMath.multi(DfMath.div(difMoneyAndYearDay, dayAndreceiveMoney,4),100);
			map.put("invest_time", Tools.TimeStamp2Date(map.get("invest_time"),"yyyy-MM-dd"));
			map.put("start_time", Tools.TimeStamp2Date(map.get("start_time"),"yyyy-MM-dd"));
			map.put("end_time", Tools.TimeStamp2Date(map.get("end_time"),"yyyy-MM-dd"));
			map.put("transfer_rate", rate+"");
			map.put("url", Common.getTransferUrlString(map.get("t_id")));
		}
	}


 

	public List<Map<String,String>> getInvestorDetail(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String orderBy = "sort_order ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet ds = T.load("investor_detail", conn).W(paramCondition).O(orderBy).Q(null); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list,conn);
		
		return list;
	}


	public List<Map<String,String>> getAcceptDetail(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String orderBy = "sort_order ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet ds = T.load("assignment_detail", conn).W(paramCondition).O(orderBy).Q(null); 
		list = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list,conn);
		
		return list;
	}







	 

	 



	 

}
