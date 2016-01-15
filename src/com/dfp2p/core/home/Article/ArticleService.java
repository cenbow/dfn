package com.dfp2p.core.home.Article;

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


@Service("ArticleService")
public class ArticleService{

	private static Log logger = LogFactory.getLog(ArticleService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="ArticleDao")
	private ArticleDao thisDao;

	public HashMap<String, String> getArticleInfo(String id,ModelAndView mv) throws Exception {	
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, String> articleInfo= new HashMap<>();
		try {
			articleInfo = (HashMap<String, String>) thisDao.getArticleInfo(conn,id);
		} catch (Exception e) {
			return null;
		}
		MySQL.closeConnection(conn);
		return articleInfo;
	}	

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

}
