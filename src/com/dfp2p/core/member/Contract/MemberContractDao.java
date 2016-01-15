package com.dfp2p.core.member.Contract;

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

@Repository("memberContractDao")
public class MemberContractDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	
	public Map<String, String> getArticleInfo(Connection conn,String id) throws Exception {
		DataSet articleInfo = T.load("article", conn).W(Tools.BuildWhereMap("id", id, "=")).Q(null);
		Map<String, String> articleData = BeanMapUtils.dataSetToListMap(articleInfo).get(0);
		return articleData;
	}

	 
	
	public Map<String, String> getBorrowInfo(Connection conn,String id) throws Exception {
		DataSet borrowInfoDataSet = T.load("borrow_info b", conn).LJ("borrow_addinfo ba ON ba.borrow_id=b.id").W(Tools.BuildWhereMap("b.id", id, "=")).Q(null);
		Map<String, String> borrowInfo = BeanMapUtils.dataSetToListMap(borrowInfoDataSet).get(0);
		return borrowInfo;
	}
	
	public Map<String, String> getCreditAssignmentInfo(Connection conn,String id) throws Exception {
		DataSet creditAssignmentInfoDataSet = T.load("credit_assignment b", conn).W(Tools.BuildWhereMap("b.id", id, "=")).Q(null);
		Map<String, String> creditAssignmentInfo = BeanMapUtils.dataSetToListMap(creditAssignmentInfoDataSet).get(0);
		return creditAssignmentInfo;
	}
	
	public Map<String, String> getInvestInfo(Connection conn,String id) throws Exception {
		DataSet investInfoDataSet = T.load("borrow_investor", conn).W(Tools.BuildWhereMap("id", id, "=")).Q(null);
		Map<String, String> investInfo = BeanMapUtils.dataSetToListMap(investInfoDataSet).get(0);
		return investInfo;
	}
	
	public Map<String, String> getBorrowUserInfo(Connection conn,String borrowUserId) throws Exception {
		DataSet borrowUserInfoDataSet = T.load("user", conn).W(Tools.BuildWhereMap("id", borrowUserId, "=")).Q(null);
		Map<String, String> borrowUserInfo = BeanMapUtils.dataSetToListMap(borrowUserInfoDataSet).get(0);
		return borrowUserInfo;
	}



	public Map<String, Object> getInvestorList(Connection conn,HashMap<String, Object> pram){
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "bi.investor_capital,bi.add_time,m.user_name,bi.is_auto,mi.real_name,bi.investor_interest,mi.idcard,bi.investor_capital+bi.investor_interest as investor_return";
		String paramJoin1 = "user m ON m.id=bi.investor_uid";
		String paramJoin2 = "user_info mi ON m.id=mi.uid";
		String orderBy = "bi.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) pram.get("whereMap");

		DataSet totalCount;
		try {
			totalCount = T.load("borrow_investor bi", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
			String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
			int count = Integer.parseInt(countStr);
			
			page.setTotalCount(count);
			page.setAjaxPageBar("investor_page");
			long begin = page.getPageStart();
			long pageSize = page.getPageSize();
			
			
			DataSet ds = T.load("borrow_investor bi", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
			list = BeanMapUtils.dataSetToListMap(ds);
			
			int i=0;
			for(Map<String, String> map:list){
				i++;
				map.put("sn", (begin+i)+"");
				map.put("add_time", Tools.TimeStamp2Date(map.get("add_time"), "yyyy-MM-dd"));
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			//logger.error("可能无投标数据或者出错：Home.investDao.getInvestorList"+e.toString());
		}

		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}
	

	public Map<String, String> getUser_info(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException,
			SQLException, ClassNotFoundException, IOException {
		List<Map<String, String>> list = null;
		String paramField = "m.user_name,m.user_phone,mi.card_img,mi.real_name,mi.idcard,mi.age,mi.province,mi.city_now,mi.sex,mi.marry,mi.education,mi.income,"
				+ "mi.zy,mi.info,mi.address,mci.contact,mci.department,"
				+ "mci.financial,mci.house,mci.ensure";
		String paramJoin1 = "user_info mi ON mi.uid=m.id";
		String paramJoin2 = "user_common_info mci ON mci.uid=m.id";
		@SuppressWarnings("unchecked")
		List<Object[]> paramCondition = (List<Object[]>) rp
				.get("paramCondition");

		@SuppressWarnings("static-access")
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2)
				.W(paramCondition).Q(paramField);
		list = BeanMapUtils.dataSetToListMap(ds);
	
		return list.get(0);
	}

}
