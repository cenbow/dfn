package com.dfp2p.core.home.Category;

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


@Service("CategoryService")
public class CategoryService{

	private static Log logger = LogFactory.getLog(CategoryService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="CategoryDao")
	private CategoryDao thisDao;

	public HashMap<String, String> getCategoryInfo(String cateId) throws Exception {	
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, String> categoryInfo = (HashMap<String, String>) thisDao.getCategoryInfo(conn, cateId);
		MySQL.closeConnection(conn);
		return categoryInfo;
	}	

	public List<Map<String, String>> getCategoryTree(String parentID) throws Exception {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, String> articleInfo= new HashMap<>();
		List<Map<String, String>> categoryInfo = thisDao.getCategoryList(conn, parentID);
		MySQL.closeConnection(conn);
		return categoryInfo;
	}

	public Map<String, String> getNewArticle(String cateId) throws Exception {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> articleInfo = thisDao.getNewArticle(conn, cateId);
		MySQL.closeConnection(conn);
		return articleInfo;
	}
	
	public Map<String, Object> getCategoryArticle(String cateId,int size) {

		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> pram= new HashMap<>();
		pram.put("whereMap", Tools.BuildWhereMap("cat_id", cateId, "="));
		pram.put("sizes", size);

		Map<String, Object> articleList = thisDao.getCategoryArticle(conn, pram);
		MySQL.closeConnection(conn);
		return articleList;
	}
	
	public Map<String, Object> getCategoryArticleImg(String cateId,int size) {

		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, Object> pram= new HashMap<>();
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("cat_id", cateId);
		mapUtil.getStringCondition("thumburl", "1","is not null and ");
		pram.put("whereMap", mapUtil.getParamConditionList());
		pram.put("size", size);
		

		Map<String, Object> articleList = thisDao.getCategoryArticle(conn, pram);
		MySQL.closeConnection(conn);
		return articleList;
	}
	
	
}
