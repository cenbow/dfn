package com.dfp2p.core.home.Category;

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
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Logger;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Repository("CategoryDao")
public class CategoryDao {
	private static Log logger = LogFactory.getLog(CategoryDao.class);

	@Resource(name="baseDao")
	private BaseDao dao;
	
	public Map<String, String> getCategoryInfo(Connection conn,String id) throws Exception {
		DataSet articleInfo = T.load("article_category", conn).W(Tools.BuildWhereMap("id", id, "=")).Q(null);
		Map<String, String> articleData = BeanMapUtils.dataSetToListMap(articleInfo).get(0);
		return articleData;
	}
	public Map<String, String> getNewArticle(Connection conn,String id) throws Exception {
		DataSet articleInfo = T.load("article", conn).W(Tools.BuildWhereMap("cat_id", id, "=")).O("sort_order DESC").L(0, 1).Q(null);
		Map<String, String> articleData = BeanMapUtils.dataSetToListMap(articleInfo).get(0);
		return articleData;
	}
	
	public  List<Map<String, String>> getCategoryList(Connection conn,String parentID) throws Exception{
		String[] eField = {"content"};
		DataSet cateInfo = T.load("article_category", conn).W(Tools.BuildWhereMap("parent_id", parentID, "=")).O("sort_order ASC").Q(null,eField);
		List<Map<String, String>> cateData = BeanMapUtils.dataSetToListMap(cateInfo);
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

	public Map<String, Object> getCategoryArticle(Connection conn,HashMap<String, Object> pram){
		
		Page page = null;
		if(pram.containsKey("sizes")) page=new Page(Integer.valueOf(pram.get("sizes")+""));
		else page =new Page();
		
		HashMap<String,Object> pageVar = new HashMap<String,Object>();
		List<Map<String,String>> list = null;
		String paramField = "id,cat_id,title,description,keywords,attr,thumburl,add_time,url";
		String orderBy = "sort_order DESC";
		List<Object[]> paramCondition =  (List<Object[]>) pram.get("whereMap");

		DataSet totalCount;
		try {
			totalCount = T.load("article", conn).W(paramCondition) .Q("count(1) as totalCount");
			String countStr = BeanMapUtils.dataSetToListMap(totalCount).get(0).get("totalCount");
			int count = Integer.parseInt(countStr);
			
			page.setTotalCount(count);
			page.setAjaxPageBar("index");
			long begin = page.getPageStart();
			long pageSize = page.getPageSize();
			
			
			DataSet ds = T.load("article", conn).W(paramCondition).L(begin,pageSize).O(orderBy).Q(paramField); 
			list = BeanMapUtils.dataSetToListMap(ds);
			
			int i=0;
			for(Map<String, String> map:list){
				String artUrl = "2".equals(map.get("attr"))?map.get("url"):tplCommon.U("home/article/index")+"?id="+map.get("id");
				map.put("url", artUrl);
				map.put("add_time", Tools.TimeStamp2Date(map.get("add_time"), "yyyy-MM-dd"));
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			logger.error("可能无投标数据或者出错：getCategoryArticle"+e.toString());
		}

		
		pageVar.put("list", list);
		pageVar.put("pageBar", page.getPageBar());
		return pageVar;
	}


}
