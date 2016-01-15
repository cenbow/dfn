package com.dfp2p.core.admin.Wx_content;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("AdminWx_contentService")
public class AdminWx_contentService{

	private static Log logger = LogFactory.getLog(AdminWx_contentService.class);
	
	@Resource(name="AdminWx_contentDao")
	private AdminWx_contentDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	




	public HashMap<String, Object> getAdList(PageData pd, ModelAndView mv) 
	{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("a","ad");
		whereUtil.getStringCondition("a.id", pd.get("id"));
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		
		
		try{
			if (pd.get("id")== null)
				list = thisDao.getAdList(conn, rp, true);
			else
				list = thisDao.getAdList(conn, rp, false);
		} catch (Exception e) {
			logger.error("wx_article失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	public String addAd(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("wx_article");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		if("news".equals(paramMap.get("msg_type"))){
			List<Map<String,Object>> listContentList=new ArrayList<>();
			Map<String, Object> listData = (Map<String, Object>) PageData.sortRequestMap(pd.post()).get("news");
			for(Entry<String, Object> entry:listData.entrySet()){
				Map<String, Object> v=(Map<String, Object>) entry.getValue();
				listContentList.add(v);
			}
			paramMap.put("content", JSON.toJSONString(listContentList));
		}

		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("title","标题不能为空", !StringUtils.isBlank(paramMap.get("title")+"")));
		validatorMap.add(Tools.buildValidatorObject("event_key","事件ID不能为空", !StringUtils.isBlank(paramMap.get("event_key")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		try{
			if(fieldCheck.size()==0){
				Long key = thisDao.addAd(conn, paramMap);
				MySQL.commit(conn);
				return "success";
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("wx_article失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return "fail";
		
	}






	public String editAd(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("wx_article" , nonRequired_str);
		map.put("add_time", Tools.getLongTime());
		if("news".equals(map.get("msg_type"))){
			List<Map<String,Object>> listContentList=new ArrayList<>();
			Map<String, Object> listData = (Map<String, Object>) PageData.sortRequestMap(pd.post()).get("news");
			for(Entry<String, Object> entry:listData.entrySet()){
				Map<String, Object> v=(Map<String, Object>) entry.getValue();
				listContentList.add(v);
			}
			map.put("content", JSON.toJSONString(listContentList));
		}

		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("title","标题不能为空", !StringUtils.isBlank(map.get("title")+"")));
		validatorMap.add(Tools.buildValidatorObject("event_key","事件ID不能为空", !StringUtils.isBlank(map.get("event_key")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		try{
			if(fieldCheck.size()==0){
				 BaseDao.update(conn, "wx_article", map, null);
				MySQL.commit(conn);
				return "success";
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("wx_article失败", e);
			return "fail";
		} finally {
			MySQL.closeConnection(conn);
		}
	}






	public boolean deleteAd(PageData pd) {
Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			HashMap<String, Object> rp = new HashMap<>();
			rp.put("id", pd.get("id"));
			Long count = thisDao.deleteAd(conn, rp);
			MySQL.commit(conn);
				return true;
		} catch (Exception e) {
			logger.error("deleteAd失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}







	 

 


 




	
 


 

	

	
}
