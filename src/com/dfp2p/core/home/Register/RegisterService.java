package com.dfp2p.core.home.Register;

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

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("RegisterService")
public class RegisterService{

	private static Log logger = LogFactory.getLog(RegisterService.class);
	@Resource(name="baseDao")
	private BaseDao baseDao;
	@Resource(name="RegisterDao")
	private RegisterDao thisDao;
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	public String registerUser(PageData pd,HttpServletResponse response) {
		Connection conn = MySQL.getConnectionReadOnly(false);

		HashMap<String, Object> userInfoHashMap = new HashMap<>();
		userInfoHashMap.put("user_name", pd.post("user_name"));
		userInfoHashMap.put("user_phone", pd.post("user_phone"));
		userInfoHashMap.put("user_pass", pd.post("pass_word"));
		userInfoHashMap.put("reg_time", Tools.getLongTime()+"");
		userInfoHashMap.put("reg_ip", Tools.getClientIp());
		userInfoHashMap.put("user_email", pd.post("email"));
		Map<String, String>	 xcodeMap = new HashMap<>();
		boolean xcodeCK=true;
		//推荐人
		if(!StringUtils.isBlank(pd.post("recommend_id"))){		
			try {
				xcodeMap = thisDao.ckXCode(conn, Tools.BuildWhereMap("xcode", pd.post("recommend_id"), "="));
			} catch (Exception e) {
				xcodeCK=false;
			}
			if(xcodeMap!=null&&!StringUtils.isBlank(xcodeMap.get("ukey"))){
				userInfoHashMap.put("recommend_id", xcodeMap.get("ukey"));
				userInfoHashMap.put("recommend_time", Tools.getLongTime()+"");			
				userInfoHashMap.put("recommend_type", "1");	
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

		
		//查询条件
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.getStringCondition("user_name", userInfoHashMap.get("user_name")+"");
		//查询条件
		WhereUtil whereUtil2 = new WhereUtil();
		whereUtil2.getStringCondition("user_phone", userInfoHashMap.get("user_phone")+"");
		//查询条件
		WhereUtil whereUtil3 = new WhereUtil();
		whereUtil3.getStringCondition("user_email", userInfoHashMap.get("user_email")+"");
		int userCount=0;
		int userEmail=0;
		int userPhone=0;
		try {
			userCount = thisDao.checkUser(conn, whereUtil.getParamConditionList());
			userPhone = thisDao.checkUser(conn, whereUtil2.getParamConditionList());
			if(!StringUtils.isBlank(pd.post("email"))) userEmail = thisDao.checkUser(conn, whereUtil3.getParamConditionList());
			else userEmail=0;
		} catch (Exception e1) {
			userCount=1;
			userEmail=1;
			userPhone=1;
		}
		
		userInfoHashMap.put("user_pass", borrowAndInvest.userPassCreate(userInfoHashMap.get("user_pass")+""));
		//验证信息
		HashMap<String, Object> userVerifyHashMap = new HashMap<>();
		userVerifyHashMap.put("phone_status", "0");
		
		String reString = "";
		if(fieldCheck.size()==0&&userPhone==0&&userEmail==0&&userCount==0){
			try {
				long uid = thisDao.regiserUser(conn, userInfoHashMap);
				//验证信息
				userVerifyHashMap.put("uid", uid);
				thisDao.addUserVerify(conn, userVerifyHashMap);
				//会员基本信息
				HashMap<String, Object> userInfoMap = new HashMap<>();
				userInfoMap.put("uid", uid);
				thisDao.addUserInfo(conn, userInfoMap);
				Common.addUserCard(uid+"", "4", "注册送红包", "50", 0, 1, 1, conn);
				
				//登陆
				baseService.memberLogin(uid+"",conn,0,response);		
				MySQL.commit(conn);
				reString="success";
			} catch (Exception e) {
				MySQL.rollback(conn);
				reString="数据校验有误!";
			}finally{
				MySQL.closeConnection(conn);
			}
		}else{
			if(userCount>0) reString="用户名已被人使用";
			else if(userEmail>0) reString="邮件已被人使用";
			else if(userPhone>0) reString="手机已被人使用";
			else reString=fieldCheck.get(0);
		}
		
		return reString;
		
	}

	public void updateUser(Map<String, Object>upuser) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		try{
			BaseDao.update(conn, "user", upuser, null);
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
		}finally{
			MySQL.closeConnection(conn);
		}
		
	}

 

	

	
}
