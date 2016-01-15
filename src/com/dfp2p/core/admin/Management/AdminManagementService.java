package com.dfp2p.core.admin.Management;

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

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("adminManagementService")
public class AdminManagementService{

	private static Log logger = LogFactory.getLog(AdminManagementService.class);
	
	@Resource(name="adminManagementDao")
	private AdminManagementDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getManagementList(PageData pd,
			ModelAndView mv) {
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("au","admin_user");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();
			if (pd.get("id")!=null)
				whereUtil.getStringCondition("au.id", pd.get("id"));
			rp.put("paramCondition",whereUtil.getParamConditionList());
			mv.addObject("defaultMap",defaultMap);
			
			
			//最后登录时间
			baseService.timeFrame("last_log_time", whereUtil, pd, mv);
			
			try{
				
				list = thisDao.getManagementList(conn, rp);
			} catch (Exception e) {
				logger.error("getManagementList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public String editManagement(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		String[] nonRequired_str = {};
		Map<String, Object> map = pd.getFormHandler("admin_user" , nonRequired_str);
		
		Map<String, String> oldAdmin = BaseDao.getOne("admin_user", Tools.BuildWhereMap("id", map.get("id")+"", "="), "user_name", conn);
		
		String password = map.get("user_pass").toString();
		String repassword = pd.post("user_pass_re").toString();
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名必须在6-20个字符之间", ValidatorUtil.strLenCheck(map.get("user_name")+"", 6, 20)));
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名中不能包含特殊字符", ValidatorUtil.stringCheck(map.get("user_name")+"")));
		if(!StringUtils.isBlank(password))	 validatorMap.add(Tools.buildValidatorObject("user_pass","密码与确认密码不相同", password.equals(repassword)));
		List<String> fieldCheck = PageData.getError(validatorMap);	

		//登陆密码
		if(StringUtils.isBlank(password))		map.remove("user_pass");
		else	map.put("user_pass", borrowAndInvest.userPassCreate(password));

		try{
			if(fieldCheck.size()==0){
				BaseDao.update(conn, "admin_user", map, null);
				if(!oldAdmin.get("user_name").equals(map.get("user_name"))){
					Map<String, Object> upUserMap=new HashMap<>();
					upUserMap.put("customer_name", map.get("user_name"));
					BaseDao.update(conn, "user", upUserMap, Tools.BuildWhereMap("customer_id", map.get("id")+"", "="));
				}
				
				MySQL.commit(conn);
			}else {
				return fieldCheck.get(0);
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("editManagement失败", e);
			return "管理员信息修改失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}



	public String addManagement(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("admin_user");
		//注册时间
		paramMap.put("add_time", Tools.getLongTime());
		
		Tools.printData(pd);
		String password = paramMap.get("user_pass").toString();
		String repassword = pd.post("user_pass_re").toString();
		
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名必须在6-20个字符之间", ValidatorUtil.strLenCheck(paramMap.get("user_name")+"", 6, 20)));
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名中不能包含特殊字符", ValidatorUtil.stringCheck(paramMap.get("user_name")+"")));
		validatorMap.add(Tools.buildValidatorObject("user_pass","密码不能为空", !StringUtils.isBlank(password)));
		if(!StringUtils.isBlank(password))	 validatorMap.add(Tools.buildValidatorObject("user_pass","密码与确认密码不相同", password.equals(repassword)));
		List<String> fieldCheck = PageData.getError(validatorMap);	

		paramMap.put("user_pass", borrowAndInvest.userPassCreate(password));

		try{
			if(fieldCheck.size()==0){
			Long key = thisDao.addManagement(conn, paramMap);
			MySQL.commit(conn);
			}else{
				return fieldCheck.get(0);
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addManagement失败", e);
			return "fail";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}



	public boolean delManagement(HashMap<String, Object> pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		
		Long count=0l;
		try{
			
			count = thisDao.delManagement(conn, pd);
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("delManagement失败", e);
			return false;
		} finally {
			MySQL.closeConnection(conn);
		}
		return (count > 0)?true:false;
	}

	public Map<String, String> getRoleList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> roleListMap = new HashMap<String, String>();
		try{
			List<Map<String, String>> list = thisDao.getRoleList(conn, pd);
			for (int i = 0; i < list.size(); i++) {
				Map<String, String> thisRole = list.get(i);
				roleListMap.put(thisRole.get("group_id"), thisRole.get("groupname"));
			}
			return roleListMap;
		} catch (Exception e) {
			logger.error("delManagement失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return null;
		
	}

 

	
}
