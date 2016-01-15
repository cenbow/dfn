package com.dfp2p.core.home.Borrow;

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
import com.dfp2p.fun.Home.HomeData;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("BorrowService")
public class BorrowService{

	private static Log logger = LogFactory.getLog(BorrowService.class);

	public String submitBorrow(Map<String, Object> borrowInfo,HashMap<String, Object>borrowAddInfo,ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			Long borrow_id = BaseDao.insert(conn, "borrow_info", borrowInfo);
			borrowAddInfo.put("borrow_id",borrow_id);
			BaseDao.insert(conn, "borrow_addinfo", borrowAddInfo);
			MySQL.commit(conn);
		}catch(Exception e){
			MySQL.rollback(conn);
			return "数据保存出错";
		}finally{
			MySQL.closeConnection(conn);
		}
		return "success";
	}
	

	
}
