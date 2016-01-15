package com.dfp2p.core.admin.Xcode;

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
import java.util.UUID;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.ShortCode;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;

import org.apache.commons.lang.StringUtils;


@Service("adminXcodeService")
public class AdminXcodeService{

	private static Log logger = LogFactory.getLog(AdminXcodeService.class);
	
	@Resource(name="adminXcodeDao")
	private AdminXcodeDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getCodeList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("m","user");
			whereUtil.setAlias("x","xcode");
			 
			whereUtil.parseSearchMap(pd,whereUtil,conn);			

			rp.put("paramCondition",whereUtil.getParamConditionList());
			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();			
			 
			//添加时间
			baseService.timeFrame("x.add_time",whereUtil, pd, mv);		
			 
			mv.addObject("defaultMap",defaultMap);			
			try{			
				list = thisDao.getCodeList(conn, rp);
			} catch (Exception e) {
				logger.error("getUserList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}




	public String addXcode(PageData pd) {
		String codex = pd.post("xcode");
		if (codex != null && !"".equals(codex))
		{	
			Connection conn = MySQL.getConnectionReadOnly(false);
			//处理插入表需要的传入值
			try{
			Map<String, Object> paramMap = pd.getFormHandler("xcode");
			paramMap.put("xcode", codex);
			paramMap.put("add_time", Tools.getLongTime());
			paramMap.put("status", 0);
			paramMap.put("ukey", pd.rqst("ukey"));
			Long key = thisDao.addXcode(conn, paramMap);
			
/*			List<String> list = getXcodeList(count);
			try{
				for (int i=0;i < list.size();i++)
				{
					Map<String, Object> paramMap = pd.getFormHandler("xcode");
					paramMap.put("xcode", list.get(i));
					paramMap.put("add_time", Tools.getLongTime());
					paramMap.put("status", 0);
					paramMap.put("ukey", pd.rqst("ukey"));
					Long key = thisDao.addXcode(conn, paramMap);
					if (key == 0)
						throw new Exception(count+"个xcode创建失败！");
				}
*/				
				MySQL.commit(conn);
				return "success";
			} catch (Exception e) {
				MySQL.rollback(conn);
				logger.error("addUser失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
		}
		return "fail";
	}



	private List<String> getXcodeList(int count) {
		List<String> list  = new ArrayList<String>();
	 
		for (int i=0;i < count;i+=4)
		{
			String[] xcodeArr = ShortCode.shortUrl(UUID.randomUUID().toString());
			int  k = count-i;
			if (k >= 4)
			{
				for (String str:xcodeArr)
					list.add(str);
			}
			else
				for (int j = 0;j<k;j++)
					list.add(xcodeArr[j]);
		}
		return list;
		
	}



	public Map<String, String> edit_page(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("x", "xcode");
		whereUtil.getStringCondition("x.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getEdit_page(conn, rp);
		} catch (Exception e) {
			logger.error("addUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}



	public String doEdit(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		 
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", pd.post("id"));
		map.put("status", pd.post("status"));
		map.put("xcode", pd.post("xcode"));
		try{
			  
			thisDao.update(conn, "xcode", map, null);
			MySQL.commit(conn);
			return "success";
		} catch (Exception e) {
			MySQL.rollback(conn);
		} finally {
			MySQL.closeConnection(conn);
		}
		return "fail";
	}


	public HashMap<String, Object> getXcodeExcelList(PageData pd,
			ModelAndView mv) {
		pd = Tools.convertDollar(pd);

		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		HashMap<String, Object> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("x","xcode");
		whereUtil.parseSearchMap(pd,whereUtil,conn);			
		HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
		
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		mv.addObject("defaultMap",defaultMap);
		
		 
		//添加时间
		baseService.timeFrame("x.add_time",whereUtil, pd, mv);		
		 
		
		try{
			 list = thisDao.getXcodeExcelList(conn, rp);
		} catch (Exception e) {
			logger.error("getXcodeExcelList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}

}
