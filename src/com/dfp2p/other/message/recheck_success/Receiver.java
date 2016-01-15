package com.dfp2p.other.message.recheck_success;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.other.message.MessageManager;
import com.dfp2p.other.message.getReceiver;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.Tools;
public class Receiver implements getReceiver {
	public static Log logger = LogFactory.getLog(Receiver.class);

	/**
	 * 获取初审失败的发送列表，需要传入borrow_id
	 */
	@Override
	public List<HashMap<String, String>> getReceiverList(String event,HashMap<String, String> map,Connection conn) {
		List<HashMap<String, String>> sendList=new ArrayList<>();
		Map<String, Object> list = ConfigCache.getCacheList("cache_msgset");
		Map<String, Object> msgSetConfig = (Map<String, Object>)list.get("msgset");
		Map<String, Object> PhoneTPL = (Map<String, Object>) ConfigCache.getCacheList("msg_phone").get("msgPhone");
		Map<String, Object> SiteTPL = (Map<String, Object>) ConfigCache.getCacheList("msg_site").get("msgSite");
		Map<String, Object> EmailTPL = (Map<String, Object>) ConfigCache.getCacheList("msg_email").get("msgEmail");

		if(((Map<String, String>)msgSetConfig.get("borrow")).containsKey(event)){
			DataSet msgInfoDS;
			try {
				msgInfoDS = T.load("borrow_info b", conn).LJ("user u ON u.id=b.borrow_uid").W(Tools.BuildWhereMap("b.id", map.get("borrow_id"), "=")).Q("u.id as uid,u.user_phone,u.user_email,b.id as '#BORROW_ID#',b.borrow_name as '#BORROW_NAME#',u.user_name as '#UserName#'");
				Map<String, String> msgInfo = BeanMapUtils.dataSetToListMap(msgInfoDS).get(0);	
			
				String setConf = ((Map<String, String>)msgSetConfig.get("borrow")).get(event);
				String msgKeyString="borrow_"+event;
				//logger.info("当前配置："+setConf+"Key="+msgKeyString+"List="+PhoneTPL);
				if(!StringUtils.isBlank(msgInfo.get("user_phone"))&&setConf.contains("1")&&PhoneTPL!=null&&PhoneTPL.containsKey("phone_"+msgKeyString)){//手机
					String newTextString=MessageManager.replaceHandler(PhoneTPL.get("phone_"+msgKeyString)+"",msgInfo);
					
					HashMap<String, String> thisReceiver = new HashMap<>();
					thisReceiver.put("type", "phone");
					thisReceiver.put("receiver", msgInfo.get("user_phone"));
					thisReceiver.put("text", newTextString);
					sendList.add(thisReceiver);
				}
				if(!StringUtils.isBlank(msgInfo.get("user_email"))&&setConf.contains("2")&&EmailTPL!=null&&EmailTPL.containsKey(msgKeyString)){//邮箱
					String newTextString=MessageManager.replaceHandler(((Map<String, String>)EmailTPL.get(msgKeyString)).get("content")+"",msgInfo);
					String newTitleString=MessageManager.replaceHandler(((Map<String, String>)EmailTPL.get(msgKeyString)).get("title")+"",msgInfo);
					
					HashMap<String, String> thisReceiver = new HashMap<>();
					thisReceiver.put("type", "email");
					thisReceiver.put("receiver", msgInfo.get("user_email"));
					thisReceiver.put("text", newTextString);
					thisReceiver.put("title", newTitleString);
					sendList.add(thisReceiver);
				}
				if(!StringUtils.isBlank(msgInfo.get("uid"))&&setConf.contains("3")&&SiteTPL!=null&&SiteTPL.containsKey("site_"+msgKeyString)){//站内信
					String newTextString=MessageManager.replaceHandler(((Map<String, String>)SiteTPL.get("site_"+msgKeyString)).get("content")+"",msgInfo);
					String newTitleString=MessageManager.replaceHandler(((Map<String, String>)SiteTPL.get("site_"+msgKeyString)).get("title")+"",msgInfo);
					
					HashMap<String, String> thisReceiver = new HashMap<>();
					thisReceiver.put("type", "site");
					thisReceiver.put("receiver", msgInfo.get("uid"));
					thisReceiver.put("text", newTextString);
					thisReceiver.put("title", newTitleString);
					sendList.add(thisReceiver);
				}
			} catch (Exception e) {
				logger.error("获取发送列表出错"+e.toString());
			}

		}


		if(((Map<String, String>)msgSetConfig.get("invest")).containsKey(event)){
			DataSet msgInfoDSL;
			try {
				msgInfoDSL = T.load("borrow_investor i", conn).LJ("user u ON u.id=i.investor_uid").LJ("borrow_info b ON b.id=i.borrow_id").W(Tools.BuildWhereMap("i.borrow_id", map.get("borrow_id"), "=")).Q("u.id as uid,u.user_phone,u.user_email,i.investor_capital as '#INVEST_MONEY#',i.investor_interest as '#INVEST_INTEREST#',b.id as '#BORROW_ID#',b.borrow_name as '#BORROW_NAME#',u.user_name as '#UserName#'");
				List<Map<String, String>> msgInfoL = BeanMapUtils.dataSetToListMap(msgInfoDSL);	
				for (int i = 0; i < msgInfoL.size(); i++) {
					Map<String, String> msgInfo = msgInfoL.get(i);
					String setConf = ((Map<String, String>)msgSetConfig.get("borrow")).get(event);
					String msgKeyString="invest_"+event;
					//logger.info("当前配置："+setConf+"Key="+msgKeyString+"List="+PhoneTPL);
					if(!StringUtils.isBlank(msgInfo.get("user_phone"))&&setConf.contains("1")&&PhoneTPL!=null&&PhoneTPL.containsKey("phone_"+msgKeyString)){//手机
						String newTextString=MessageManager.replaceHandler(PhoneTPL.get("phone_"+msgKeyString)+"",msgInfo);
						
						HashMap<String, String> thisReceiver = new HashMap<>();
						thisReceiver.put("type", "phone");
						thisReceiver.put("receiver", msgInfo.get("user_phone"));
						thisReceiver.put("text", newTextString);
						sendList.add(thisReceiver);
					}
					if(!StringUtils.isBlank(msgInfo.get("user_email"))&&setConf.contains("2")&&EmailTPL!=null&&EmailTPL.containsKey(msgKeyString)){//邮箱
						String newTextString=MessageManager.replaceHandler(((Map<String, String>)EmailTPL.get(msgKeyString)).get("content")+"",msgInfo);
						String newTitleString=MessageManager.replaceHandler(((Map<String, String>)EmailTPL.get(msgKeyString)).get("title")+"",msgInfo);
						
						HashMap<String, String> thisReceiver = new HashMap<>();
						thisReceiver.put("type", "email");
						thisReceiver.put("receiver", msgInfo.get("user_email"));
						thisReceiver.put("text", newTextString);
						thisReceiver.put("title", newTitleString);
						sendList.add(thisReceiver);
					}
					if(!StringUtils.isBlank(msgInfo.get("uid"))&&setConf.contains("3")&&SiteTPL!=null&&SiteTPL.containsKey("site_"+msgKeyString)){//站内信
						String newTextString=MessageManager.replaceHandler(((Map<String, String>)SiteTPL.get("site_"+msgKeyString)).get("content")+"",msgInfo);
						String newTitleString=MessageManager.replaceHandler(((Map<String, String>)SiteTPL.get("site_"+msgKeyString)).get("title")+"",msgInfo);
						
						HashMap<String, String> thisReceiver = new HashMap<>();
						thisReceiver.put("type", "site");
						thisReceiver.put("receiver", msgInfo.get("uid"));
						thisReceiver.put("text", newTextString);
						thisReceiver.put("title", newTitleString);
						sendList.add(thisReceiver);
					}
				}
			} catch (Exception e) {
				logger.error("获取发送列表出错"+e.toString());
			}

		}

		
		//logger.info("最终获取的列表"+sendList);
		return sendList;
	}


}
