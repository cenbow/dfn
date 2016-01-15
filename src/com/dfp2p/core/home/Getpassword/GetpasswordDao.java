package com.dfp2p.core.home.Getpassword;

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
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("GetpasswordDao")
public class GetpasswordDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public Long regiserUser(Connection conn,HashMap<String, Object> userInfoHashMap) throws Exception {
		Long uid = BaseDao.insert(conn, "user", userInfoHashMap);
		return uid;
	}

	public Long addUserVerify(Connection conn,HashMap<String, Object> userVerifyHashMap) throws Exception {
		long rs= BaseDao.insert(conn, "user_verify", userVerifyHashMap);
		return rs;
	}

	public int checkUser(Connection conn,List<Object[]> paramCondition) throws Exception {
		DataSet cts = T.load("user", conn).W(paramCondition).Q("id");
		List<Map<String, String>> res = BeanMapUtils.dataSetToListMap(cts);
		return res.size();
	}

}
