package com.dfp2p.core.admin.Ad;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

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
import com.dfp2p.util.WhereUtil;


@Service("adminAdService")
public class AdminAdService{

	private static Log logger = LogFactory.getLog(AdminAdService.class);
	
	@Resource(name="adminAdDao")
	private AdminAdDao thisDao;
	
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
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}





	public boolean addAd(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("ad");
		if("0".equals(pd.post("remove_p"))){
			if((paramMap.get("content")+"").startsWith("<p>")){
				paramMap.put("content", ((paramMap.get("content")+"").substring(3, (paramMap.get("content")+"").length()-3)));
			}
		}
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		paramMap.put("start_time", Tools.strToTime(paramMap.get("start_time").toString()) );
		paramMap.put("end_time", Tools.strToTime(paramMap.get("end_time").toString()) );
		Tools.printData(pd);
		try{
			Long key = thisDao.addAd(conn, paramMap);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addArticle失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
		
	}






	public boolean editAd(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("ad" , nonRequired_str);
		
		map.put("start_time", Tools.strToTime(map.get("start_time").toString()));
		map.put("end_time", Tools.strToTime(map.get("end_time").toString()));

		if("2".equals(map.get("ad_type"))){
			//广告信息
			Map<String, Object> swfUploadImg = PageData.sortRequestMap(pd.post());
			Map<String, String> swfImgImgList = (Map<String, String>) swfUploadImg.get("swfimglist");
			HashMap<String, String> swfImgInfoList = (HashMap<String, String>) swfUploadImg.get("picinfo");
			HashMap<String, String> swfImgUrlList = (HashMap<String, String>) swfUploadImg.get("picurl");
			List<HashMap<String, String>>imgType_1= new ArrayList<>();
			for( Entry<String, String> e : swfImgImgList.entrySet())
			{
				    HashMap<String, String> thisImgInfo = new HashMap<>();
				  	String imgKey= e.getKey();
				  	String imgValue =e.getValue();
				  	thisImgInfo.put("img", imgValue);
				  	thisImgInfo.put("info", swfImgInfoList.get(imgKey));
				  	thisImgInfo.put("url", swfImgUrlList.get(imgKey));
				  	imgType_1.add(thisImgInfo);
		    }
			HashMap<String, Object> borrowAddInfo = new HashMap<>();
			map.put("content", JSON.toJSONString(imgType_1));
		}else{
			if("0".equals(pd.post("remove_p"))){
				if((map.get("content")+"").startsWith("<p>")){
					map.put("content", ((map.get("content")+"").substring(3, (map.get("content")+"").length()-4)));
				}
			}
		}
		try{
			 BaseDao.update(conn, "ad", map, null);
			 MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editAd失败", e);
			return false;
		} finally {
			MySQL.closeConnection(conn);
		}
		return true;
	}






	public boolean deleteAd(PageData pd) {
Connection conn = MySQL.getConnectionReadOnly(false);
		
		try{
			HashMap<String, Object> rp = new HashMap<>();
			rp.put("id", pd.get("id"));
			Long count = thisDao.deleteAd(conn, rp);
			if (count > 0)
				return true;
		} catch (Exception e) {
			logger.error("deleteAd失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}







	 

 


 




	
 


 

	

	
}
