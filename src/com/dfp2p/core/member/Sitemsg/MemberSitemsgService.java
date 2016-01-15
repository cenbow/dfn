package com.dfp2p.core.member.Sitemsg;

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
import javax.swing.text.MaskFormatter;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberSitemsgService")
public class MemberSitemsgService{

	private static Log logger = LogFactory.getLog(MemberSitemsgService.class);
	
	@Resource(name="memberSitemsgDao")
	private MemberSitemsgDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	





	public HashMap<String, Object> getSitemsgList(PageData pd, ModelAndView mv)
{
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		Tools.printData(pd.rqst());
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("s","site_msg");
		whereUtil.setAlias("mi","user_info");
		whereUtil.setAlias("m","user");
		WhereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		mv.addObject("defaultMap",defaultMap);
		
		//当前ID
		whereUtil.getStringCondition("s.uid",userInfo.get("id"));
		
		//当前标签
		String has_read = pd.rqst("has_read");
		if (has_read !=null && !"".equals(has_read))
			whereUtil.getStringCondition("s.has_read", has_read);
		
		
		try{
			
			list = thisDao.getSitemsgList(conn, rp);
		} catch (Exception e) {
			logger.error("getSitemsgList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}







	public String updateSitemsg() {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		//当前ID
		whereUtil.getStringCondition("uid",userInfo.get("id"));
		
		 
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("has_read", "1");
		
		try{
			
			Long count = thisDao.updateSitemsg(conn, map, rp);
			if (count > 0)
				MySQL.commit(conn);
			return "success";
		} catch (Exception e) {
			logger.error("updateSitemsg失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return "fail";
	}


 

 
}












 


 

	

	

