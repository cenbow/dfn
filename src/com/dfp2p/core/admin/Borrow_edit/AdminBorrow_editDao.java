package com.dfp2p.core.admin.Borrow_edit;

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
import com.dfp2p.core.admin.User.AdminUserDao;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("adminBorrow_editDao")
public class AdminBorrow_editDao {
	private static Log logger = LogFactory.getLog(AdminBorrow_editDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	

	public Map<String,String> getBorrowInfo(Connection conn, Map<String, Object> rp) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "*";
		String paramJoin1 = "borrow_addinfo ba ON ba.borrow_id=b.id";
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		 
		DataSet ds = T.load("borrow_info b", conn).LJ(paramJoin1).W(paramCondition).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}

	public  Long eidtBorrowInfo(Connection conn, Map<String, Object> rp) throws SQLException, ClassNotFoundException, IOException, DataException {
		return dao.update(conn, "borrow_info", rp,null);
	}
	

 

}
