package com.dfp2p.core.home.Transfer;

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
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Logger;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("TransferDao")
public class TransferDao {
	private static Log logger = LogFactory.getLog(TransferDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public Map<String, String> getBorrowInfo(Connection conn,HashMap<String, String> pd) throws Exception {
		DataSet borrowInfoDataSet = T.load("borrow_info", conn).W(Tools.BuildWhereMap("id", pd.get("borrow_id"), "=")).Q(null);
		Map<String, String> borrowInfo = BeanMapUtils.dataSetToListMap(borrowInfoDataSet).get(0);
		return borrowInfo;
	}
	
	public Map<String, String> getTransferInfo(Connection conn,PageData pd) throws Exception {
		logger.info("PDID"+pd.rqst("id"));
		DataSet borrowInfoDataSet = T.load("credit_assignment", conn).W(Tools.BuildWhereMap("id", pd.rqst("id"), "=")).Q(null);
		Map<String, String> borrowInfo = BeanMapUtils.dataSetToListMap(borrowInfoDataSet).get(0);
		return borrowInfo;
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
		String paramField = "bi.investor_capital,bi.add_time,m.user_name,bi.is_auto";
		String paramJoin1 = "user m ON m.id=bi.investor_uid";
		String orderBy = "bi.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) pram.get("whereMap");

		DataSet totalCount;
		try {
			totalCount = T.load("borrow_investor bi", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
			String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
			int count = Integer.parseInt(countStr);
			
			page.setTotalCount(count);
			page.setAjaxPageBar("borrow_page");
			long begin = page.getPageStart();
			long pageSize = page.getPageSize();
			
			
			DataSet ds = T.load("borrow_investor bi", conn).LJ(paramJoin1).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
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
			logger.error("可能无投标数据或者出错：Home.investDao.getInvestorList"+e.toString());
		}

		pageVar.put("data", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


	public List<Map<String, String>> getTransferDetailList(Connection conn,HashMap<String, Object> pram){
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "id,invest_id,capital,interest,deadline,sort_order,total,borrow_id,status";
		String orderBy = "id ASC";
		List<Object[]> paramCondition =  (List<Object[]>) pram.get("whereMap");

		DataSet totalCount;
		try {
			DataSet ds = T.load("investor_detail", conn).W(paramCondition).O(orderBy).Q(paramField); 
			list = BeanMapUtils.dataSetToListMap(ds);
			
			int i=0;
			for(Map<String, String> map:list){
				i++;
				map.put("sn", i+"");
				map.put("deadline", Tools.TimeStamp2Date(map.get("deadline"), "yyyy-MM-dd"));
				map.put("status_info", ("7".equals(map.get("status")))?"已还款":"待还款");
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			logger.error("可能无投标数据或者出错：Home.investDao.getInvestorList"+e.toString());
		}

		return list;
	}


	public HashMap<String, Object> getAcceptDetailList(Connection conn,HashMap<String, Object> pram){
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "cd.{add_time,receive_money},m.{user_name}";
		String paramJoin1 = "user m ON m.id=cd.receiver";
		String orderBy = "cd.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) pram.get("whereMap");

		DataSet totalCount;
		try {
			totalCount = T.load("assignment_detail cd", conn).LJ(paramJoin1).W(paramCondition) .Q("count(1) as totalCount");
			String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
			int count = Integer.parseInt(countStr);
			
			page.setTotalCount(count);
			page.setAjaxPageBar("borrow_page");
			long begin = page.getPageStart();
			long pageSize = page.getPageSize();

			DataSet ds = T.load("assignment_detail cd", conn).W(paramCondition).LJ(paramJoin1).G("cd.receiver,cd.add_time").Q(paramField); 
			list = BeanMapUtils.dataSetToListMap(ds);
			
			int i=0;
			for(Map<String, String> map:list){
				i++;
				map.put("sn", (begin+i)+"");
				map.put("add_time", Tools.TimeStamp2Date(map.get("add_time"), "yyyy-MM-dd"));
				//map.put("status_info", ("7".equals(map.get("status")))?"已还款":"待还款");
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			logger.error("可能无转让数据或者出错：Home.TransferDao.getAcceptDetailList"+e.toString());
		}
		pageVar.put("list", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}

}
