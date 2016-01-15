package com.dfp2p.core.member.Myborrow;

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
import com.dfp2p.util.WhereUtil;

@Repository("memberMyborrowDao")
public class MemberMyborrowDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	



	public HashMap<String, Object> getMyborrowList(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.id,m.user_name as borrow_user,b.borrow_duration,b.has_pay,b.total,b.borrow_interest_rate,b.borrow_status"
				+ ",b.add_time,b.full_time,b.borrow_interest,b.borrow_fee,b.borrow_money,b.borrow_name,mm.credits,b.repayment_type,b.borrow_type";
		String paramJoin1 = "user m ON m.id=b.borrow_uid";
		String paramJoin2 = "user_count mm ON mm.uid=b.borrow_uid";
		String orderBy ="b.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet totalCount = T.load("borrow_info b", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).Q("count(1) as totalCount");
		String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
		int count = Integer.parseInt(countStr);
		
		page.setTotalCount(count);
		page.setAjaxPageBar("invest_page");
		long begin = page.getPageStart();
		long pageSize = page.getPageSize();
		
		
		DataSet ds = T.load("borrow_info b", conn).LJ(paramJoin1).LJ(paramJoin2).L(begin,pageSize).W(paramCondition).O(orderBy).Q(paramField); 
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
			map.put("full_time", dao.parseTime(map.get("full_time")));
			map.put("deadline", dao.parseTime(map.get("deadline")));
			map.put("repayment_time", dao.parseTime(map.get("repayment_time")));
			map.put("url", Common.getBorrowUrlString(map.get("id")));
			if(map.containsKey("receive_interest")){//还款详细
				if(Double.valueOf(map.get("receive_interest"))>0) map.put("has_pay_interest",DfMath.s2add(map.get("receive_interest"), map.get("interest_fee"))+"");
				else map.put("has_pay_interest","0");
			}
		}
	}


 

	public List<Map<String,String>> getRepaymentDetail(Connection conn,	HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String field="sum(capital) as capital,sum(interest) as interest,sum(interest_fee) as interest_fee,sum(receive_interest) as receive_interest,sum(receive_capital) as receive_capital,sort_order,deadline,status,total,repayment_time,borrow_id";
		String orderBy = "sort_order ASC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		
		DataSet ds = T.load("investor_detail", conn).G("sort_order").W(paramCondition).O(orderBy).Q(field); 
		list = BeanMapUtils.dataSetToListMap(ds);
		filterList(list);
		return list;
	}

	
	public Map<String, String> getBorrowInfo(Connection conn,PageData pd) throws Exception {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		WhereUtil where = new WhereUtil();
		where.getStringCondition("id", pd.rqst("id"));
		where.getStringCondition("borrow_uid", userInfo.get("id"));
		DataSet borrowInfoDataSet = T.load("borrow_info", conn).W(where.getParamConditionList()).Q(null);
		Map<String, String> borrowInfo = BeanMapUtils.dataSetToListMap(borrowInfoDataSet).get(0);
		return borrowInfo;
	}






	 

	 



	 

}
