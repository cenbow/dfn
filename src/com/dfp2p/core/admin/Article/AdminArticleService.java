package com.dfp2p.core.admin.Article;

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
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminArticleService")
public class AdminArticleService{

	private static Log logger = LogFactory.getLog(AdminArticleService.class);
	
	@Resource(name="adminArticleDao")
	private AdminArticleDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getArticleList(PageData pd, ModelAndView mv) 
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("a","article");
		whereUtil.setAlias("c","article_category");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		if (pd.get("id")!= null)
			whereUtil.getStringCondition("a.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
	 
		 
		//添加时间
		baseService.timeFrame("a.add_time", whereUtil, pd, mv);
		
		
		try{
			
			list = thisDao.getArticleList(conn, rp);
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	public String addArticle(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("article");
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("title","文章标题不能为空", !StringUtils.isBlank(paramMap.get("title")+"")));
		validatorMap.add(Tools.buildValidatorObject("sort_order","排序只能是数字", ValidatorUtil.isDigits(paramMap.get("sort_order")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		//Tools.printData(pd);
		try{
			if(fieldCheck.size()==0){
			Long key = thisDao.addArticle(conn, paramMap);
			MySQL.commit(conn);
			}else{
				return fieldCheck.get(0);
			}
			//return "success";
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addArticle失败", e);
			return "文章添加失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}





	public String editArticle(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		
		String[] nonRequired_str = {};
		Map<String, Object> paramMap = pd.getFormHandler("article" , nonRequired_str);
		Tools.printData(paramMap);
		
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("title","文章标题不能为空", !StringUtils.isBlank(paramMap.get("title")+"")));
		validatorMap.add(Tools.buildValidatorObject("sort_order","排序只能是数字", ValidatorUtil.isDigits(paramMap.get("sort_order")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	

		try{
			if(fieldCheck.size()==0){
			 BaseDao.update(conn, "article", paramMap, null);
			 MySQL.commit(conn);
			}else{
				return fieldCheck.get(0);
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editArticle失败", e);
			return "数据更新失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}





	public boolean deleteArticle(HashMap<String, Object> delMap) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			
			Long count = thisDao.deleteArticle(conn, delMap);
			MySQL.commit(conn);
			if (count > 0)	return true;
		} catch (Exception e) {
			logger.error("deleteArticle失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}





	 


	 




	
 


 

	

	
}
