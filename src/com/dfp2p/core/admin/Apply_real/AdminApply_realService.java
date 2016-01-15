package com.dfp2p.core.admin.Apply_real;

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
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminApply_realService")
public class AdminApply_realService{

	private static Log logger = LogFactory.getLog(AdminApply_realService.class);
	
	@Resource(name="adminApply_realDao")
	private AdminApply_realDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	



	public HashMap<String, Object> getApply_realList(PageData pd,
			ModelAndView mv) 
		{
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mm","user_count");
		whereUtil.setAlias("mi","user_info");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		if(!defaultMap.containsKey("mi#id_status")) whereUtil.getStringCondition("mi.id_status", "0", ">=");
		
		
		//是否vip
		baseService.isVip("isVip", whereUtil, pd, mv);
		
		 
		//注册时间
		baseService.timeFrame("m.reg_time", whereUtil, pd, mv);
		
		
		try{
			
			list = thisDao.getApply_realList(conn, rp);
		} catch (Exception e) {
			logger.error("getApply_videoList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}




	public String doedit(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);	

		Map<String, Object> user_infoMap = new HashMap<>();
		user_infoMap.put("uid", pd.post("uid"));
		user_infoMap.put("id_status", pd.post("id_status"));
		
		Map<String, Object> user_verifyMap = new HashMap<>();
		user_verifyMap.put("uid", pd.post("uid"));
		user_verifyMap.put("id_status", pd.post("id_status"));
		
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("uid","会员ID有误", ValidatorUtil.isDigits(user_infoMap.get("uid")+"")));
		validatorMap.add(Tools.buildValidatorObject("id_status","状态值不对", ValidatorUtil.isDigits(user_infoMap.get("id_status")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	

		try{
			if(fieldCheck.size()==0){
				BaseDao.update(conn,"user_verify", user_verifyMap,null);
				BaseDao.update(conn,"user_info", user_infoMap,null);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (ClassNotFoundException | SQLException | IOException	| DataException e) {
			MySQL.rollback(conn);
			logger.error("applyrealname审核失败", e);
			return "数据提交失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}




	
 


 

	

	
}
