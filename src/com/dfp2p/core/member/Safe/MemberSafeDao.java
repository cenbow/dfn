package com.dfp2p.core.member.Safe;

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
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("memberSafeDao")
public class MemberSafeDao {

	@Resource(name="baseDao")
	private BaseDao dao;

	public Long updateUser_info(Connection conn, Map<String, Object> hashMap) throws ClassNotFoundException, SQLException, IOException, DataException {
		return BaseDao.update(conn, "user_info", hashMap, null);
	}

	public Long updateUser(Connection conn, Map<String, Object> userMap) throws ClassNotFoundException, SQLException, IOException, DataException {
		return BaseDao.update(conn, "user", userMap, null);
	}

	public Map<String, String> getUser(Connection conn, Map<String, Object> rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = null;
		String paramJoin1 = "user_count mm ON mm.uid=m.id";
		String paramJoin2 = "user_info mi ON mi.uid=m.id";
		String orderBy = "m.id DESC";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("user m", conn).LJ(paramJoin1).LJ(paramJoin2).W(paramCondition).O(orderBy).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}
	



	 

	 

}
