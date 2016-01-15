package com.dfp2p.core.app.login;

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

@Repository("appLoginDao")
public class AppLoginDao {
	private static Log logger = LogFactory.getLog(AppLoginDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;

	public Map<String, String> getUser(Connection conn,WhereUtil rp) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = "m.{id,user_name,user_email,user_pass,is_ban}";
			 
		DataSet ds = T.load("user m", conn).W(rp.getParamConditionList()).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
//		dao.parseResultDate(list,new String[]{"full_time","check_time","borrow_times"});
		return list!=null?list.get(0):null;
	}
	
	 
	 
	 

}
