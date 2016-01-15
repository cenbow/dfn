package com.dfp2p.core.home.Common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("CommonService")
public class CommonService{

	private static Log logger = LogFactory.getLog(CommonService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	public List<Map<String, String>> getArea(WhereUtil searchMap) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		List<Map<String, String>> arealist =null;
		try {
			DataSet userDataSet = T.load("area", conn).W(searchMap.getParamConditionList()).Q(null);
			arealist = BeanMapUtils.dataSetToListMap(userDataSet);
		} catch (Exception e) {
			
		}finally{
			MySQL.closeConnection(conn);
		}
		
		return arealist;
	}

	

	
}
