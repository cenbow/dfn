package com.dfp2p.other.message;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.base.BaseDao;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.Page;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.dfp2p.util.dfCache.Cache;

public class MessageManager {

	private static Log logger = LogFactory.getLog(MessageManager.class);
	
	public static getReceiver getReceiverListUtil(String eventType) {
		Class<?> getReceiverClass;
		getReceiver ReceiverGet =null;
		try {
			getReceiverClass = Class.forName("com.dfp2p.other.message."+eventType+".Receiver");
			ReceiverGet = (com.dfp2p.other.message.getReceiver)getReceiverClass.newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		
		return ReceiverGet;
	}

	public static void sendNotifyMsg(String event,HashMap<String, String> parMap) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, Object> list = ConfigCache.getCacheList("cache_msgset");
		if(list==null) return;
		getReceiver getReceiverU = getReceiverListUtil(event);
		List<HashMap<String, String>> sendList = getReceiverU.getReceiverList(event, parMap, conn);
		
		List<Map<String, Object>> dbListPhone = new ArrayList<>();
		List<Map<String, Object>> dbListEmail = new ArrayList<>();
		List<Map<String, Object>> dbListSite = new ArrayList<>();
		for (int i = 0; i < sendList.size(); i++) {
			HashMap<String, String> thisMap = sendList.get(i);
			HashMap<String, Object> addMap=new HashMap<>();			
			if("site".equals(thisMap.get("type"))){
				addMap.put("uid", thisMap.get("receiver"));
				addMap.put("title", thisMap.get("title"));
				addMap.put("msg", thisMap.get("text"));
				addMap.put("read_time", "0");
				addMap.put("send_time", Tools.getLongTime());
				addMap.put("add_ip",Tools.getClientIp());
				dbListSite.add(addMap);
			}else if ("email".equals(thisMap.get("type"))) {
				addMap.put("type", thisMap.get("type"));
				addMap.put("status", "0");
				addMap.put("user", thisMap.get("receiver"));
				addMap.put("msg", thisMap.get("text"));
				addMap.put("add_time", Tools.getLongTime());

				addMap.put("title", thisMap.get("title"));
				dbListEmail.add(addMap);
			}else if("phone".equals(thisMap.get("type"))){
				addMap.put("type", thisMap.get("type"));
				addMap.put("status", "0");
				addMap.put("user", thisMap.get("receiver"));
				addMap.put("msg", thisMap.get("text"));
				addMap.put("add_time", Tools.getLongTime());

				dbListPhone.add(addMap);
			}
		}
		
		if(dbListPhone.size()>0)	BaseDao.IM("sendmsg_queue", dbListPhone, 50, conn);
		if(dbListSite.size()>0)	BaseDao.IM("site_msg", dbListSite, 50, conn);
		if(dbListEmail.size()>0)	BaseDao.IM("sendmsg_queue", dbListEmail, 50, conn);

		try {
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("通知系统数据库保存失败"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
	}
	
	
	public static String replaceHandler(String text,Map<String,String> map)
	{
		if (map!=null)
		{
			for (Map.Entry<String,String> entry:map.entrySet())
			{
				String key = entry.getKey();
				String value = entry.getValue()+"";
				if (value != null && !"".equals(value))
				{
					text = text.replace(key,value);
				}
			}
		}
		return text;
	}
	
}
