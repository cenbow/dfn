package com.dfp2p.core.admin.Group;

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

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminGroupService")
public class AdminGroupService{

	private static Log logger = LogFactory.getLog(AdminGroupService.class);
	
	@Resource(name="adminGroupDao")
	private AdminGroupDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	public Map<String, String> role_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("group_id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.role_edit(conn, rp);
		} catch (Exception e) {
			logger.error("获取分组出错", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}


	public String addGroup(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//����������Ҫ�Ĵ���ֵ
		Map<String, Object> paramMap = pd.getFormHandler("admin_group");
		String[] listMenuid = (String[]) pd.postArray("menuIds");
		paramMap.put("controller",JSON.toJSONString(listMenuid));

		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("groupname","��ɫ��Ʋ���Ϊ��", !StringUtils.isBlank(paramMap.get("groupname")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		
		try{
			if(fieldCheck.size()==0){
				Long key = thisDao.addGroup(conn, paramMap);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("groupʧ��", e);
			return "����Ա��ɫ���ʧ��";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public HashMap<String, Object> getRoleList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("g","admin_group");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			

			rp.put("paramCondition",whereUtil.getParamConditionList());
			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();			
			mv.addObject("defaultMap",defaultMap);			
			try{			
				list = thisDao.getRoleList(conn, rp);
			} catch (Exception e) {
				logger.error("getRoleListʧ��", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}

	public String editGroup(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//����������Ҫ�Ĵ���ֵ
		Map<String, Object> paramMap = pd.getFormHandler("admin_group");
		String[] listMenuid = (String[]) pd.postArray("menuIds");
		paramMap.put("controller",JSON.toJSONString(listMenuid));

		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("groupname","��ɫ��Ʋ���Ϊ��", !StringUtils.isBlank(paramMap.get("groupname")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		
		try{
			if(fieldCheck.size()==0){
				Long key = thisDao.editGroup(conn,"admin_group", paramMap);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("groupʧ��", e);
			return "����Ա��ɫ�޸�ʧ��";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
		
	}
	
 
	public String deleteGroup(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//����������Ҫ�Ĵ���ֵ
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("group_id",pd.get("id"));
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("group_id","Ҫɾ���ID����Ϊ��", !StringUtils.isBlank(paramMap.get("group_id")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		try{
			if(fieldCheck.size()==0){
				Long key = thisDao.deleteGroup(conn,"admin_group", paramMap);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("groupʧ��", e);
			return "����Ա��ɫɾ��ʧ��";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
		
	}

 
}












 


 

	

	

