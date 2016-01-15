package com.dfp2p.core.app.register;

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
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.core.admin.User.AdminUserDao;
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;

import org.apache.commons.lang.StringUtils;


@Service("appRegisterService")
public class AppRegisterService{

	private static Log logger = LogFactory.getLog(AppRegisterService.class);
	
	@Resource(name="appRegisterDao")
	private AppRegisterDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	@Resource(name="adminUserDao")
	private AdminUserDao adminUserDao;
	
	 



	public Map<String, String> ckuser(PageData pd,WhereUtil map) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		Map<String, String> list = null;
		try{			
			list = thisDao.findUser(conn, map);
		} catch (Exception e) {
			logger.error("ckuser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public Map<String, String> ckphone(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		whereUtil.setAlias("mm","user_count");
		whereUtil.setAlias("mi","user_info");
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		String user_phone = pd.rqst("user_phone");
		if (user_phone!=null)
			whereUtil.getStringCondition("m.user_phone", user_phone);
		
		try{			
			list = adminUserDao.getUser_edit(conn, rp);
		} catch (Exception e) {
			logger.error("ckphone失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}



	public boolean verifyphone(PageData pd) {
		String phone = pd.rqst("phone");
		String code = pd.rqst("code");
		String res = borrowAndInvest.is_verify(phone, code, "1", true);
		return StringUtils.isBlank(res);
	}



	public boolean checkIuid(String iuid) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		
		
		Map<String, String> list = null;
		HashMap<String,Object> rp = new HashMap<String,Object>();
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m","user");
		 
		rp.put("paramCondition",whereUtil.getParamConditionList());
		
		 
		whereUtil.getStringCondition("m.id", iuid);
		
		try{			
			list = adminUserDao.getUser_edit(conn, rp);
		} catch (Exception e) {
			logger.error("checkIuid失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list!=null?true:false;
	}


	 
	public String addUserAndUserVerify(PageData pd,Map<String, Object> data,HttpServletResponse response) {
		Map<String, Object> userInfoHashMap = data;
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, String>	 xcodeMap = new HashMap<>();
		boolean xcodeCK=true;
		//推荐人
		if(!StringUtils.isBlank(pd.post("invite_code"))){		
			try {
				xcodeMap = thisDao.ckXCode(conn, Tools.BuildWhereMap("xcode", pd.post("invite_code"), "="));
			} catch (Exception e) {
				xcodeCK=false;
			}
			if(xcodeMap!=null&&!StringUtils.isBlank(xcodeMap.get("ukey"))){
				userInfoHashMap.put("recommend_id", xcodeMap.get("ukey"));
				userInfoHashMap.put("recommend_time", Tools.getLongTime()+"");			
				userInfoHashMap.put("recommend_type", "3");	
				xcodeCK=true;
			}else{
				xcodeCK=false;
			}
		}else{
			userInfoHashMap.put("recommend_id", "");
		}
		//数据校验
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名必须在6-20个字符之间", ValidatorUtil.strLenCheck(userInfoHashMap.get("user_name")+"", 6, 20)));
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名中不能包含特殊字符", ValidatorUtil.stringCheck(userInfoHashMap.get("user_name")+"")));
		validatorMap.add(Tools.buildValidatorObject("user_phone","手机号码格式不正确", ValidatorUtil.isPhone(userInfoHashMap.get("user_phone")+"")));
		validatorMap.add(Tools.buildValidatorObject("user_pass","密码不能为空", !StringUtils.isBlank(userInfoHashMap.get("user_pass")+"")));
		//validatorMap.add(Tools.buildValidatorObject("recommend_id","请输入邀请码", !StringUtils.isBlank(userInfoHashMap.get("recommend_id")+"")));
		//validatorMap.add(Tools.buildValidatorObject("recommend_id","邀请码不存在", xcodeCK));
		if(xcodeMap!=null&&!StringUtils.isBlank(xcodeMap.get("expired_time"))) validatorMap.add(Tools.buildValidatorObject("recommend_id", "邀请码超过有效期", (Long.valueOf(xcodeMap.get("expired_time"))>Tools.getLongTime())));
		if(!StringUtils.isBlank(pd.post("email"))) validatorMap.add(Tools.buildValidatorObject("user_email","邮箱格式不正确", ValidatorUtil.isEmail(userInfoHashMap.get("user_email")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		
		try{
			if(fieldCheck.size()==0){
				Long key = adminUserDao.addUser(conn, data);
				paramMap.put("uid", key);
				paramMap.put("phone_status", 1);
				Long key2 = thisDao.addUser_verify(conn, paramMap);
				
				Map<String, Object> paramMapi = new HashMap<String, Object>();
				paramMapi.put("uid", key);
				Long key3 = thisDao.addUser_info(conn, paramMapi);
				if (key2>0&&key3>0)
				{
					boolean isLogin = baseService.memberLogin(key+"", conn, 0, response);
					MySQL.commit(conn);
					return "success";
				}
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addUserAndUserVerify失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return "fail";
	}



	 
	
}
