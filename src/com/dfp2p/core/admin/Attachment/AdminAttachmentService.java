package com.dfp2p.core.admin.Attachment;

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

import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.WhereUtil;


@Service("adminAttachmentService")
public class AdminAttachmentService{

	private static Log logger = LogFactory.getLog(AdminAttachmentService.class);
	
	@Resource(name="adminAttachmentDao")
	private AdminAttachmentDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getAttachmentList(PageData pd,
			ModelAndView mv)
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("a","attachment");
			whereUtil.setAlias("m","user");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			
			
			
			//上传时间
			baseService.timeFrame("a.add_time",whereUtil, pd, mv);
			
			//会员|后台 名
			String userType = pd.rqst("userType");
			if(userType!=null && !"".equals(userType))
			{
				if ("admin".equals(userType) )
					whereUtil.getMultiCondition("a.event_type", "6||7");
				else
					whereUtil.getMultiCondition("a.event_type", "6&&7");
				mv.addObject("userType",userType);
			}
			
			
			try{
				
				list = thisDao.getAttachmentList(conn, rp);
			} catch (Exception e) {
				logger.error("getUserList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}


 


	

	
}
