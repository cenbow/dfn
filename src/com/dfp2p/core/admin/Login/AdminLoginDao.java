package com.dfp2p.core.admin.Login;

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

@Repository("adminLoginDao")
public class AdminLoginDao {

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public Map<String, String> getUserInfo(Connection conn,
			HashMap<String, Object> rp) throws Exception 
		{
		
		DataSet ds = T.load("admin_user", conn).W((List<Object[]>) rp.get("paramCondition")).Q(null); 
		List<Map<String, String>> userInfos = BeanMapUtils.dataSetToListMap(ds);
		//filterList(list);		
		return userInfos.get(0);
	}

 







	 

	 



	 

}
