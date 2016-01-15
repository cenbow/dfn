package com.dfp2p.core.home.Article;

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
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.Logger;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("ArticleDao")
public class ArticleDao {
	private static Log logger = LogFactory.getLog(ArticleDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public Map<String, String> getArticleInfo(Connection conn,String id) throws Exception {
		DataSet articleInfo = T.load("article", conn).W(Tools.BuildWhereMap("id", id, "=")).Q(null);
		Map<String, String> articleData = BeanMapUtils.dataSetToListMap(articleInfo).get(0);
		return articleData;
	}
	public Map<String, String> getCategoryInfo(Connection conn,String id) throws Exception {
		DataSet articleInfo = T.load("article_category", conn).W(Tools.BuildWhereMap("id", id, "=")).Q(null);
		Map<String, String> articleData = BeanMapUtils.dataSetToListMap(articleInfo).get(0);
		return articleData;
	}
	
	public  List<Map<String, String>> getCategoryList(Connection conn,String parentID) throws Exception{
		String[] eField = {"content"};
		DataSet cateInfo = T.load("article_category", conn).W(Tools.BuildWhereMap("parent_id", parentID, "=")).O("sort_order ASC").Q(null,eField);
		List<Map<String, String>> cateData = BeanMapUtils.dataSetToListMap(cateInfo);
		logger.info("EEEEEEEEEEEEEEEEEE"+parentID);
		filterList(cateData);
		return cateData;
	}

	private void filterList(List<Map<String, String>> list) {
		for(Map<String, String> map:list)
		{
			String cateUrl = "3".equals(map.get("cate_type"))?map.get("url"):tplCommon.U("home/category/index")+"?id="+map.get("id");
			map.put("url", cateUrl);
		}
	}

}
