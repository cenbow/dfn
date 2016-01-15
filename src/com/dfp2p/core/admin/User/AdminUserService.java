package com.dfp2p.core.admin.User;

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
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;

import org.apache.commons.lang.StringUtils;


@Service("adminUserService")
public class AdminUserService{

	private static Log logger = LogFactory.getLog(AdminUserService.class);
	
	@Resource(name="adminUserDao")
	private AdminUserDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	
	public HashMap<String, Object> getUserList(PageData pd,  ModelAndView mv) 
	{
			Connection conn = MySQL.getConnectionReadOnly(true);
			
			
			HashMap<String, Object> list = null;
			HashMap<String,Object> rp = new HashMap<String,Object>();
			WhereUtil whereUtil = new WhereUtil();
			whereUtil.setAlias("m","user");
			whereUtil.setAlias("mm","user_count");
			whereUtil.setAlias("mi","user_info");
			whereUtil.parseSearchMap(pd,whereUtil,conn);			

			rp.put("paramCondition",whereUtil.getParamConditionList());
			if(pd.containsKey("toExcel")&&"1".equals(pd.get("toExcel"))) rp.put("toExcel", "1");
			
			HashMap<String,String> defaultMap =  whereUtil.getCommonMap();			
			//是否VIP
			baseService.isVip("isVip", whereUtil, pd, mv);		
			//会员类型
			baseService.isEqualed("m.user_type",whereUtil, pd, mv);		
			//注册时间
			baseService.timeFrame("m.reg_time",whereUtil, pd, mv);		
			//可用余额|冻结资金
			String balanceType = pd.get("balanceType");
			String compareSign = pd.get("compareSign");
			String balanceNum = pd.get("balanceNum");
			if (balanceType != null && balanceNum != null && !"".equals(balanceNum.trim()))
			{
					whereUtil.getStringCondition(balanceType.trim(), balanceNum, compareSign);
					defaultMap.put("balanceType", balanceType);
					defaultMap.put("compareSign", compareSign);
					defaultMap.put("balanceNum", balanceNum);
			}
			mv.addObject("defaultMap",defaultMap);			
			try{			
				list = thisDao.getUserList(conn, rp);
			} catch (Exception e) {
				logger.error("getUserList失败", e);
			} finally {
				MySQL.closeConnection(conn);
			}
			return list;
		}



	public boolean addUser(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("user");
		Map<String, Object> paramMap2 = pd.getFormHandler("user_info");
		
		try{
			Long key = thisDao.addUser(conn, paramMap);
			paramMap2.put("uid", key);
			thisDao.addUser_info(conn, paramMap2);
			MySQL.commit(conn);
			return true;
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return false;
	}


	public Map<String, String> User_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getUser_edit(conn, rp);
			 //Tools.printData(data);
		} catch (Exception e) {
			logger.error("addUser失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}


	public String editUser(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);	
		
		
		String[] cannotEditField = null;//{"user_name"};
		Map<String, Object> userMap = pd.getFormHandler("user",cannotEditField);
		
		String[] nonRequired_str = {"card_img","id_time","id_status"};
		Map<String, Object> user_infoMap = pd.getFormHandler("user_info" , nonRequired_str);
		user_infoMap.put("uid", userMap.get("id"));
		
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名必须在6-20个字符之间", ValidatorUtil.strLenCheck(userMap.get("user_name")+"", 6, 20)));
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名中不能包含特殊字符", ValidatorUtil.stringCheck(userMap.get("user_name")+"")));
		validatorMap.add(Tools.buildValidatorObject("user_phone","手机号码格式不正确", ValidatorUtil.isPhone(userMap.get("user_phone")+"")));
		validatorMap.add(Tools.buildValidatorObject("user_email","邮箱格式不正确", ValidatorUtil.isEmail(userMap.get("user_email")+"")));
		validatorMap.add(Tools.buildValidatorObject("age","年龄只能是数字", ValidatorUtil.isDigits(user_infoMap.get("age")+"")));
		if(!"0".equals(userMap.get("user_leve"))){
			validatorMap.add(Tools.buildValidatorObject("time_limit","请输入正确的等级有效期", (userMap.get("time_limit")+"").length()==10));
			if((userMap.get("time_limit")+"").length()==10) userMap.put("time_limit", Tools.strToTime(pd.post("time_limit")+" 23:59:59"));
		}else{
			userMap.put("time_limit", "0");
		}
		
		List<String> fieldCheck = PageData.getError(validatorMap);	

		String password = userMap.get("user_pass").toString();
		String pin_password = userMap.get("pin_pass").toString();
		//登陆密码
		if(StringUtils.isBlank(password))		userMap.remove("user_pass");
		else	userMap.put("user_pass", borrowAndInvest.userPassCreate(password));
		//支付密码
		if(StringUtils.isBlank(pin_password))		userMap.remove("pin_pass");
		else	userMap.put("pin_pass", borrowAndInvest.userPassCreate(pin_password));		
		
		try{
			if(fieldCheck.size()==0){
				thisDao.doEdit(conn,"user", userMap,null);
				thisDao.doEdit(conn,"user_info", user_infoMap,null);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (ClassNotFoundException | SQLException | IOException	| DataException e) {
			MySQL.rollback(conn);
			logger.error("editUser失败", e);
			return "数据提交失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}



	public Map<String, String> credit_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, String> data = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mm", "user_count");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			 data = thisDao.getCredit_edit(conn, rp);
		} catch (Exception e) {
			logger.error("credit_edit失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return data;
	}



	public String card_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Map<String, String> data = null;
		

		HashMap<String, Object>add= new HashMap<>();
		add.put("uid",pd.post("id"));
		add.put("type",pd.post("type"));
		add.put("card",pd.post("name"));
		add.put("affect_money",pd.post("affect_money"));
		if(StringUtils.isBlank(pd.post("expired_time"))&&!StringUtils.isBlank(pd.post("card_cat"))) add.put("expired_time",Common.getCardExpiredTime(pd.post("card_cat")));
		else add.put("expired_time",Tools.strToTime(pd.post("expired_time")+" 23:59:59"));
		add.put("add_time",Tools.getLongTime());
		add.put("add_ip",Tools.getClientIp());
		add.put("card_cat",pd.post("card_cat"));
		
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("card","券卡名称不能为空", !StringUtils.isBlank(add.get("card")+"")));
		validatorMap.add(Tools.buildValidatorObject("affect_money","卡券金额只能是数字", ValidatorUtil.isNumeric(add.get("affect_money")+"")));
		validatorMap.add(Tools.buildValidatorObject("expired_time","过期时间不能为空", DfMath.toIntValue(add.get("expired_time")+"")>0));
		//validatorMap.add(Tools.buildValidatorObject("affect_money","卡券金额必须大于0", (DfMath.toIntValue(add.get("affect_money")+"")>0)));
		List<String> fieldCheck = PageData.getError(validatorMap);	
	
		try{
			if(fieldCheck.size()==0){
				BaseDao.insert(conn, "user_card", add);
				MySQL.commit(conn);
			}else{
				MySQL.rollback(conn);
				return fieldCheck.get(0);				
			}
		} catch (Exception e) {
			logger.error("card_edit失败", e);
			return "保存失败";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public String do_money_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		String uid = pd.post("id");
		String account_money = pd.post("account_money");
		String money_freeze = pd.post("money_freeze");
		String money_collect = pd.post("money_collect");
		String credits = pd.post("credits");
		String info = pd.post("info");
		String reString1="success";
		String reString2="success";
		String reString3="success";
		String reString4="success";
		if("".equals(info)) return "调整说明不能为空";
		if(Double.valueOf(account_money)!=0){
			HashMap<String, String> moneyType = new HashMap<>();
			moneyType.put("account_money", "+");
			reString1 = borrowAndInvest.memberMoneyLog(uid, "12", account_money, info, "", "", moneyType,conn);
		}
		
		if(Double.valueOf(money_freeze)!=0){
			HashMap<String, String> moneyType1 = new HashMap<>();
			moneyType1.put("money_freeze", "+");
			reString2=borrowAndInvest.memberMoneyLog(uid, "13", money_freeze, info, "", "", moneyType1,conn);
		}

		if(Double.valueOf(money_collect)!=0){
			HashMap<String, String> moneyType2 = new HashMap<>();
			moneyType2.put("money_collect", "+");
			reString3=borrowAndInvest.memberMoneyLog(uid, "14", money_collect, info, "", "", moneyType2,conn);
		}

		if(Double.valueOf(credits)!=0){
			reString4 = borrowAndInvest.memberCreditsLog(uid, "2", credits, info,conn);
		}
		
		try{
			if("success".equals(reString1)&&"success".equals(reString2)&&"success".equals(reString3)&&"success".equals(reString4)) MySQL.commit(conn);
			else{
				MySQL.rollback(conn);
				return "数据修改失败";
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			return "数据提交出错";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}


	public String do_limit_edit(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		String uid = pd.post("id");
		String credit_limit = pd.post("credit_limit");
		String borrow_vouch_limit = pd.post("borrow_vouch_limit");
		String invest_vouch_limit = pd.post("invest_vouch_limit");
		String relate = pd.post("relate");
		String info = pd.post("info");
		String reString1="success";
		String reString2="success";
		String reString3="success";
		if("".equals(info)) return "调整说明不能为空";
//		if(Double.valueOf(credit_limit)!=0){
//			HashMap<String, String> moneyType = new HashMap<>();
//			moneyType.put("credit_cuse", "+");
//			if("yes".equals(relate)) moneyType.put("credit_limit", "+");
//			reString1 = borrowAndInvest.memberLimitLog(uid, "2", credit_limit, info, moneyType,conn);
//		}
//		
//		if(Double.valueOf(borrow_vouch_limit)!=0){
//			HashMap<String, String> moneyType1 = new HashMap<>();
//			moneyType1.put("borrow_vouch_cuse", "+");
//			if("yes".equals(relate)) moneyType1.put("borrow_vouch_limit", "+");
//			reString2=borrowAndInvest.memberLimitLog(uid, "2", borrow_vouch_limit, info,moneyType1,conn);
//		}
//
//		if(Double.valueOf(invest_vouch_limit)!=0){
//			HashMap<String, String> moneyType2 = new HashMap<>();
//			moneyType2.put("invest_vouch_cuse", "+");
//			if("yes".equals(relate)) moneyType2.put("invest_vouch_limit", "+");
//			reString3=borrowAndInvest.memberLimitLog(uid, "2", invest_vouch_limit, info, moneyType2,conn);
//		}
		
		try{
			if("success".equals(reString1)&&"success".equals(reString2)&&"success".equals(reString3)) MySQL.commit(conn);
			else{
				MySQL.rollback(conn);
				return "数据修改失败";
			}
		} catch (Exception e) {
			MySQL.rollback(conn);
			return "数据提交出错";
		} finally {
			MySQL.closeConnection(conn);
		}
		return "success";
	}



	public Map<String, Object> getUser_nameList(PageData pd, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		Map<String, Object> list = null;
		

		String id = pd.get("id");
		WhereUtil whereUtil = new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mm", "user_count");
		whereUtil.setAlias("mi", "user_info");
		whereUtil.getStringCondition("m.id", id);
		Map<String, Object> rp = new HashMap<String, Object>();
		rp.put("paramCondition",whereUtil.getParamConditionList()); 
		
		
		try{
			list = thisDao.getUser_nameList(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_nameList失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return list;
	}
	



	

	
}
