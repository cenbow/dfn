package com.dfp2p.core.app.member;

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
import com.dfp2p.util.WhereUtil;

@Repository("appMemberDao")
public class AppMemberDao {
	private static Log logger = LogFactory.getLog(AppMemberDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public HashMap<String, Object> getBorrow_infoList(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "b.{borrow_name,borrow_interest_rate,id,borrow_status}";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet ds = T.load("borrow_info b", conn).W(paramCondition).L(0,2).Q(paramField);  
		list = BeanMapUtils.dataSetToListMap(ds);
		dao.parseResultDate(list,new String[]{"collect_time","borrow_times"});
		pageVar.put("data", list);
		return pageVar;
	}

	 
	public Map<String, String> getUser_login(Connection conn,
			WhereUtil rp) throws Exception {
		Page page = new Page();
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String orderBy = "u.id DESC";
		String paramField = null;
		
		DataSet ds = T.load("user_login u", conn).W(rp.getParamConditionList()).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		dao.parseResultDate(list,new String[]{"add_time"});
		return list!=null?list.get(0):null;
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


	public List<Map<String, String>> getBankListByUid(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = null;
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet ds = T.load("user_banks b", conn).W(paramCondition).Q(paramField);  
		list = BeanMapUtils.dataSetToListMap(ds);
		 
		return list;
	}


	public Map<String, String> getUserByUid(Connection conn,
			WhereUtil rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "mm.account_money,m.user_leve,m.time_limit,m.user_pass";
		String join ="user_count mm on mm.uid = m.id";
		String orderBy = "m.id DESC";
		 
		DataSet ds = T.load("user m", conn).LJ(join).W(rp.getParamConditionList()).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		dao.parseResultDate(list,new String[]{"add_time"});
		return (list!=null&&list.size()>0)?list.get(0):null;
	}


	public List<Map<String, String>> getLlpay_logList(Connection conn,
			HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "id,bank,withdraw_money,money";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");

		DataSet ds = T.load("llpay_log l", conn).W(paramCondition).Q(paramField);  
		list = BeanMapUtils.dataSetToListMap(ds);
		 
		return list;
	}


 






	

 

	 

}
