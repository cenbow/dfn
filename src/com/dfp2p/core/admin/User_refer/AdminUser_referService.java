package com.dfp2p.core.admin.User_refer;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminUser_referService")
public class AdminUser_referService{

	private static Log logger = LogFactory.getLog(AdminUser_referService.class);
	
	@Resource(name="adminUser_referDao")
	private AdminUser_referDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getUser_referList(PageData pd,
			ModelAndView mv) 
			{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("m","user");
			whereUtil.setAlias("rm","user");
			whereUtil.setAlias("mi","user_info");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			
			rp.put("paramCondition",whereUtil.getParamConditionList());
			if(pd.rqst().containsKey("pagebar")) rp.put("pagebar", pd.rqst("pagebar"));
			mv.addObject("defaultMap",defaultMap);
			
			//是否VIP
			baseService.isVip("isVip", whereUtil, pd, mv);
			 
			//注册时间
			 baseService.timeFrame("m.reg_time", whereUtil, pd, mv);
			 
			
			try{
				
				list = thisDao.getUser_referList(conn, rp);
			} catch (Exception e) {
				logger.error("getUser_bankList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}


	public String doappoint(String uid,String recommendUser) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		String ress="";
		Map<String, String> rusInfo=new HashMap<>();
		try{
			DataSet rus = T.load("user", conn).W(Tools.BuildWhereMap("user_name", recommendUser, "=")).Q("id");
			rusInfo = BeanMapUtils.dataSetToListMap(rus).get(0);
		}catch(Exception e){
			ress= "输入的推荐人不存在";
		}
		if(rusInfo.size()==0) ress= "输入的推荐人不存在";
		if(uid.equals(rusInfo.get("id"))) ress= "推荐人不能是自己";
		try{
			if(!"".equals(ress)){
				return ress;
			}else{
				HashMap<String, Object> recommendHashMap=new HashMap<>();
				recommendHashMap.put("id", uid);
				recommendHashMap.put("recommend_id", rusInfo.get("id"));
				recommendHashMap.put("recommend_type", "2");
				recommendHashMap.put("recommend_time", Tools.getLongTime());
				BaseDao.update(conn, "user", recommendHashMap, null);
				MySQL.commit(conn);
			}
		} catch (Exception e) {
			logger.error("doappoint失败", e);
			MySQL.rollback(conn);
			return "保存失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public String removerefer(String uid) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{

				HashMap<String, Object> recommendHashMap=new HashMap<>();
				recommendHashMap.put("id", uid);
				recommendHashMap.put("recommend_id", 0);
				recommendHashMap.put("recommend_type", "0");
				recommendHashMap.put("recommend_time", 0);
				BaseDao.update(conn, "user", recommendHashMap, null);
				MySQL.commit(conn);

		} catch (Exception e) {
			logger.error("doappoint失败", e);
			MySQL.rollback(conn);
			return "保存失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	 


	 

	
}
