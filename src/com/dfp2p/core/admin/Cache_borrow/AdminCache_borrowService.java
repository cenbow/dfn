package com.dfp2p.core.admin.Cache_borrow;

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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("adminCache_borrowService")
public class AdminCache_borrowService{

	private static Log logger = LogFactory.getLog(AdminCache_borrowService.class);
	
	@Resource(name="adminCache_borrowDao")
	private AdminCache_borrowDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	

 


	public boolean editCache_borrow(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);	
		
		//修改信息
		Map<String, Object> rv = new HashMap<String, Object>();
		
		//借款相关费用
		Map<String, Object> borrowMap = new HashMap<String, Object>();
		String call = pd.post("call");
		String expired = pd.post("expired");
		borrowMap.put("call",call);
		borrowMap.put("expired",expired);
		rv.put("borrow", borrowMap);
		
		//投资相关费用
		Map<String, Object> investMap = new HashMap<String, Object>();
		String moneyRate = pd.post("moneyRate");
		String todayReward = pd.post("todayReward");
		String rewardInvest = pd.post("rewardInvest");
		investMap.put("moneyRate",moneyRate);
		investMap.put("todayReward",todayReward);
		investMap.put("rewardInvest",rewardInvest);
		rv.put("invest", investMap);
		
		//认证相关费用
		Map<String, Object> applyMap = new HashMap<String, Object>();
		String vip = pd.post("vip");
		String video = pd.post("video");
		String face = pd.post("face");
		String limitVip = pd.post("limitVip");
		applyMap.put("vip",vip);
		applyMap.put("video",video);
		applyMap.put("face",face);
		applyMap.put("limitVip",limitVip);
		rv.put("apply", applyMap);
		
		//充值提现相关
		Map<String, Object> withdrawMap = new HashMap<String, Object>();
		String type = pd.post("type");
		String fee = pd.post("fee");
		withdrawMap.put("type",type);
		withdrawMap.put("fee",fee);
		rv.put("withdraw", withdrawMap);
		Map<String, Object> rechargeMap = new HashMap<String, Object>();
		String offReward = pd.post("offReward");
		withdrawMap.put("offReward",offReward);
		rv.put("recharge", rechargeMap);
		
		//推广奖励
		Map<String, Object> promoteMap = new HashMap<String, Object>();
		String vip_promote = pd.post("vip_promote");
		String x = pd.post("x");
		String j = pd.post("j");
		String d = pd.post("d");
		String b = pd.post("b");
		String m = pd.post("m");
		String l = pd.post("l");
		String money_type = pd.post("money_type");
		promoteMap.put("vip_promote",vip_promote);
		promoteMap.put("x",x);
		promoteMap.put("j",j);
		promoteMap.put("d",d);
		promoteMap.put("b",b);
		promoteMap.put("m",m);
		promoteMap.put("l",l);
		promoteMap.put("money_type",money_type);
		rv.put("promote", promoteMap);
		
		 
		 
		
		try{
			ConfigCache.doEditCache("cache_borrow",rv);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editCache_borrow失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}




 





	public Map<String, Object> getCache_borrowList(PageData pd,
			ModelAndView mv) {
		 
		return ConfigCache.getCacheList("cache_borrow");
	}





 
	
}












 


 

	

	

