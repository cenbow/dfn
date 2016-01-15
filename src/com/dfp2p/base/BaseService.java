package com.dfp2p.base;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.mySql.data.dao.Table;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.dfp2p.util.AuthCode.AuthCode;
import com.dfp2p.util.dfCache.Cache;
import com.dfp2p.util.dfCache.CacheManager;

@Service("baseService")
public class BaseService {
	private static Log logger = LogFactory.getLog(BaseService.class); 
	
	@Resource(name="baseDao")
	private BaseDao baseDao;
	 
	/**是否是vip
	 * @param field 字段名（包含别名）或 表单name属性
	 * @param whereUtil 
	 * @param pd 
	 * @param mv 
	 */
	public void isVip(String name, WhereUtil whereUtil, PageData pd, ModelAndView mv)
	{
		String isVip = pd.get(name);
		if (isVip !=null && !"".equals(isVip) && Integer.parseInt(isVip.trim()) > 0)
		{
			whereUtil.getStringCondition("m.user_leve",	"0", ">");
			whereUtil.getStringCondition("m.time_limit", Tools.getLongTime()+"",">");
			mv.addObject("isVip", isVip);
		}
		else if (isVip !=null && !"".equals(isVip) && Integer.parseInt(isVip.trim()) == 0)
		{
			whereUtil.getStringCondition("m.user_leve",	"=");
			mv.addObject("isVip", isVip);
		}
	}

	 
	
	public void isEqualed(String field, WhereUtil whereUtil, PageData pd,
			ModelAndView mv)
	{
		String[] arr = field.split("\\.");
		String str = arr[0].trim()+"#"+arr[1].trim();
		String value = pd.get(str);
		if (value != null && !"".equals(value))
		{
			whereUtil.getStringCondition(field,	value);
			mv.addObject(str, value);
			return;
		}
		List<Object[]> lists = whereUtil.getParamConditionList();
		for (int i = 0; i < lists.size(); i++)
		{
			Object[] obj = lists.get(i);
			if (obj instanceof String[])
			{
				if (field.equals(((String[])obj)[0]))
					lists.remove(i);
			}
		}
	}

	/**比较填入的数字大小
	 * @param field
	 * @param whereUtil
	 * @param pd
	 * @param mv
	 */
	public void compareNum(String field,WhereUtil whereUtil, PageData pd,
			ModelAndView mv)
	{

		String compareSign = pd.get("compareSign");
		String balanceNum = pd.get("balanceNum");
		if (balanceNum != null && !"".equals(balanceNum.trim()))
		{
				whereUtil.getStringCondition(field, balanceNum, compareSign);
				mv.addObject("compareSign", compareSign);
				mv.addObject("balanceNum", balanceNum);
		}
	}
	
	public void timeFrame(String field, WhereUtil whereUtil, PageData pd,
			ModelAndView mv) {
		String startTime = pd.get("startTime");
		String endTime = pd.get("endTime");
		try {
			if (startTime != null && endTime !=null && !"".equals(startTime.trim()) && !"".equals(endTime.trim()))
			{
				whereUtil.getMultiCondition(field, +new SimpleDateFormat("yyyy-MM-dd").parse(startTime).getTime()/1000+"&"+new SimpleDateFormat("yyyy-MM-dd").parse(endTime).getTime()/1000);
				mv.addObject("startTime", startTime);
				mv.addObject("endTime", endTime);
			}
			else if (startTime != null && (endTime ==null || "".equals(endTime.trim())) && !"".equals(startTime.trim()))
			{
				whereUtil.getMultiCondition(field, +new SimpleDateFormat("yyyy-MM-dd").parse(startTime).getTime()/1000+"&");
				mv.addObject("startTime", startTime);
			}
			else if ((startTime ==null || "".equals(startTime.trim())) && endTime !=null && !"".equals(endTime.trim()))
			{
				whereUtil.getMultiCondition(field, "&"+new SimpleDateFormat("yyyy-MM-dd").parse(endTime).getTime()/1000);
				mv.addObject("endTime", endTime);
			}
		} catch (ParseException e1) {
			logger.error("搜索——注册时间解析失败");
		}
		
	}
	
	/**排序方法
	 * @param conn
	 * @param pdMaps 表单参数集合
	 * @param table  表名
	 * @param priName 主键字段名
	 * @param separator 分隔符 如 "#sort#"
	 * @param fieldName 字段名
	 * @param nonRequired_str 忽略的字段名
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public static void sortOrderHandler(Connection conn, Map<String, String> pdMaps, String table
			, String priName, String separator,String fieldName,String[] nonRequired_str) throws ClassNotFoundException, SQLException, IOException
	{
		for (Map.Entry<String, String> entry : pdMaps.entrySet())
		{
			String key = entry.getKey();
			String value = entry.getValue();
//			System.out.println(key+" = "+value);
			if (key.indexOf(separator) != -1)
			{
				String[] arr = key.split(separator);
				String id = arr[0];
				String field = arr[1];
				
				
				Map<String, Object> map = PageData.getFormHandler(table,(Map<String, String>)Tools.cloneObject(pdMaps), nonRequired_str !=null ?Arrays.asList(nonRequired_str):null);
				
				map.put(priName, id);
				map.put(fieldName, value);
				//错误信息，未处理。。。
/*				List<String> errorList_user = PageData.getError(map);
				if( errorList_user!= null)
				{
					//...
				}
*/				
				
				try {
					BaseDao.update(conn,table,map,null);
				} catch (DataException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @param list
	 * @return Map<String, String>的List集合
	 */
	public List<Map<String, String>> getTreeNavSelect(List<Map<String, String>> list) {
		List<Map<String, String>> result = Tools.getTreeList(list,"0","id", "parent_id", "text"," ");
			
//		for (Object str:result)
//			System.out.println(((Map<String, String>)str).get("text"));
		return result;
	}
	public List<Map<String, String>> getTreeNavList(List<Map<String, String>> list) {
		List<Map<String, String>> result = Tools.getTreeList(list,"0","id", "parent_id", "text","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
//		for (Object str:result)
//			System.out.println(((Map<String, String>)str).get("text"));
		return result;
	}

	public List<Map<String, String>> getTreeMenu(
			List<Map<String, String>> list) {
		List<Map<String, String>> result = Tools.getTreeList(list,"0","id", "parentid", "name","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
//		for (Object str:result)
//			System.out.println(((Map<String, String>)str).get("name"));
		return result;
	}

	public List<Map<String, String>> getTreeArticle_category(
			List<Map<String, String>> list) {
		List<Map<String, String>> result = Tools.getTreeList(list,"0","id", "parent_id", "cate_name","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
//		for (Object str:result)
//			System.out.println(((Map<String, String>)str).get("name"));
		return result;
	}



	public List<Map<String, String>> getTreeArticle_categorySelect(
			List<Map<String, String>> list) {
		List<Map<String, String>> result = Tools.getTreeList(list,"0","id", "parent_id", "cate_name","&nbsp;");
		return result;
	}



	public List<Map<String, String>> getTreeMenuSelect(
			List<Map<String, String>> list) {
		List<Map<String, String>> result = Tools.getTreeList(list,"0","id", "parentid", "name","&nbsp;");
		return result;
	}



	public List<Map<String, String>> getTreeNavSelectList(
			List<Map<String, String>> datalist) {
		List<Map<String, String>> result = Tools.getTreeList(datalist,"0","id", "parent_id", "text","&nbsp;");
		return result;
	}



	public List<Map<String, String>> getTreeArea(
			List<Map<String, String>> datalist) {
		List<Map<String, String>> result = Tools.getTreeList(datalist,"0","id", "reid", "name","&nbsp;&nbsp;");
		return result;
	}



	public static boolean memberLogin(String uid,Connection conn,int rember_min,HttpServletResponse response) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		HttpSession session = Common.getCommonSession();
		
		DataSet userDataSet = T.load("user", conn).W(Tools.BuildWhereMap("id", uid,"=")).Q("user_name,id,third_uid,third_account");
		Map<String, String> userInfoLogin = BeanMapUtils.dataSetToListMap(userDataSet).get(0);
		userInfoLogin.put("third_uid", userInfoLogin.get("third_account"));
		
		if(rember_min>0){
			String cookieKey = "";
			Map<String, Object> cacheConfigSite = ConfigCache.getCacheList("cache_configIndex");
			if(cacheConfigSite!=null&&!Common.isBlankInMap(cacheConfigSite, "cookieKey"))  cookieKey=cacheConfigSite.get("cookieKey")+"";

			int cookieSecond = rember_min*60;
			String loginCookieStr = AuthCode.authcodeEncode(userInfoLogin.get("id"),cookieKey,cookieSecond);
			Cookie cookie = new Cookie("usl", loginCookieStr);
			cookie.setHttpOnly(true);
			cookie.setPath("/");
			cookie.setMaxAge(cookieSecond);
			response.addCookie(cookie);
		}
		
		HashMap<String, Object> loginInfoMap = new HashMap<>();
		loginInfoMap.put("uid", userInfoLogin.get("id"));
		loginInfoMap.put("ip", Tools.getClientIp());
		loginInfoMap.put("add_time", Tools.getLongTime());
		T.load("user_login", conn).I(loginInfoMap);
		session.setAttribute("UserInfo", userInfoLogin);
		return true;
	}



	 
	public static String checkField(String table,String pri,String userId,String param) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("t",table);
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		whereUtil.getStringCondition(pri, userId);
		 		
		try{			
			list = BaseDao.checkFieldMap(conn, rp, table,param);
			if(list!=null)
				return list.get(param);
		} catch (Exception e) {
			logger.error("checkField失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
	}
	public static Map<String, String> checkFieldMap(String table,String pri,String userId,String param) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("t",table);
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		whereUtil.getStringCondition(pri, userId);
		
		try{			
			list = BaseDao.checkFieldMap(conn, rp, table,param);
		} catch (Exception e) {
			logger.error("checkFieldMap失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

	public static String getProjectURL(HttpServletRequest request)
	{
		return request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
	}
	
	
	public static long upTable(String tableName,HashMap<String, Object>updata,List<Object[]>map) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long res =null;
		try{
			res = BaseDao.update(conn, tableName, updata, map);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("upTable失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
	public static long addOne(String tableName,HashMap<String, Object> Idata) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		long res =0l;
		try{
			res = T.load(tableName, conn).I(Idata);
			MySQL.commit(conn);
		} catch (Exception e) {
			logger.error("addOne失败", e);
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
	public static Map<String, String> getOne(String tableName,List<Object[]>map,String field,String orderBy,int start,int num) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).O(orderBy).L(start, num).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getOne失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
	public static Map<String, String> getOne(String tableName,List<Object[]>map,String field,String orderBy) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).O(orderBy).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getOne失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
	public static Map<String, String> getOne(String tableName,List<Object[]>map,String field) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getOne失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
	public static List<Map<String, String>> getList(String tableName,List<Object[]>map,String field,int limit,String orderBy) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		List<Map<String, String>> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).L(0, limit).O(orderBy).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds);
		} catch (Exception e) {
			logger.error("getList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
	public static List<Map<String, String>> getList(String tableName,List<Object[]>map,String field,int limit) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		List<Map<String, String>> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).L(0, limit).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds);
		} catch (Exception e) {
			logger.error("getList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return res;		
	}
	
}

 
	 