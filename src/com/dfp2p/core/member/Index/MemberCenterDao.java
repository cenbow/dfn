package com.dfp2p.core.member.Index;

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
import com.dfp2p.util.Tools;
import com.sun.mail.util.BEncoderStream;

@Repository("memberCenterDao")
public class MemberCenterDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	


	public List<Map<String, String>> getMoneyLogPermonth(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		DataSet moneyLog = T.load("user_moneylog", conn).W((List<Object[]>) rp.get("whereMap")).G("month").O("month asc").Q("FROM_UNIXTIME(add_time,'%Y-%m') as month,sum(affect_money) as money");
		List<Map<String, String>> moneyLogLlist = BeanMapUtils.dataSetToListMap(moneyLog);
		return moneyLogLlist;
	}


	public List<Map<String, String>> getInvestorTypeCount(Connection conn,HashMap<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		DataSet investorLog = T.load("borrow_investor", conn).W((List<Object[]>) rp.get("whereMap")).G("status").Q("count(id) as num,status");
		List<Map<String, String>> investorLogLlist = BeanMapUtils.dataSetToListMap(investorLog);
		return investorLogLlist;
	}







 






	 

	 



	 

}
