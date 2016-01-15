package com.dfp2p.core.app.member;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.baseController.BaseAppController;
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.core.member.Safe.MemberSafeController;
import com.dfp2p.core.member.Safe.MemberSafeService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AppMemberController extends BaseAppController {
	public String tplPath = "Member";
	
	@Resource(name="appMemberService")
	private AppMemberService thisService;
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	@Resource(name="memberSafeController")
	private MemberSafeController memberSafeController;
	@Resource(name="memberSafeService")
	private MemberSafeService memberSafeService;
	
	public void center(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, Object> map = thisService.getBorrow_infoList();
		String userId = getId(request);
		Map<String, String> loginMap = thisService.getUser_login(userId);
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String,Object> vof = getMemberMoneySummary(userId);
		result.put("list",map);
		result.put("num",map.get("totalCount"));
		result.put("account_money",DfMath.s2round((String) ((Map)vof.get("tj")).get("account_money")));
		result.put("add_time",loginMap.get("add_time"));
		result.put("sy",DfMath.s2round((String) ((Map)vof.get("tj")).get("jzlx"))+DfMath.s2round((String) ((Map)vof.get("tj")).get("dslxzekyj")));
		
		ajaxmsg(result,response);
	}
	
	public void resetpass  (HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String userId = getId(request);
		Map<String, String> userMap = adminUserService.User_edit(pd, mv);
		
		String sms_vcode = pd.rqst("sms_vcode");
		String newpassword = borrowAndInvest.userPassCreate(pd.rqst("newpassword"));
		String res = borrowAndInvest.is_verify(userId, sms_vcode, "1", true);
//		if(StringUtils.isBlank(res))
		boolean flag=false;//假设
		if(flag)
		{
			ajaxmsg("验证失败", "0", response);
		}
		else
		{
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("pin_pass", newpassword);
			userValueMap.put("id", userId);
			boolean result = memberSafeService.updateUser(userValueMap);
			if(!result)
			{
				ajaxmsg("修改失败", "0", response);
			}else{
				ajaxmsg("sucess", "1", response);
			}	
		}
	}
	public void sendphone(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		memberSafeController.sendToPhone(request, response, mv);
	}
	public void phoneverify(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String userId = getId(request);
		String code = pd.rqst("code");
		String res = borrowAndInvest.is_verify(userId, code, "1", true);
		boolean flag = StringUtils.isBlank(res);
		if (!flag)
			ajaxmsg("手机验证码不对，请重新输入！","2",response);
		else
			ajaxmsg("success","1",response);
	}
	public void getphonestatus(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String userId = getId(request);
		String phone_status = BaseService.checkField("user_verify", "uid", userId, "phone_status");
		String phone = BaseService.checkField("user", "id", userId, "user_phone");
		Map<String,Object> map = new  HashMap<String, Object>();
		map.put("phone_status", phone_status);
		map.put("phone", phone);
		
		ajaxmsg(map, response);
	}
	public void getidstatus(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String userId = getId(request);
		Map<String,Object> result = new  HashMap<String, Object>();
		String id_status = BaseService.checkField("user_verify", "uid", userId, "id_status");
		result.put("id_status", id_status);
		Map<String, String> map = BaseService.checkFieldMap("user_info", "uid", userId, "real_name,idcard");
		if (map!=null)
		{
			result.put("real_name", map.get("real_name"));
			result.put("idcard",  map.get("idcard"));
		}
		
		ajaxmsg(result, response);
	}
	public void saveid(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		String userId = getId(request);
		Map<String,Object> result = new  HashMap<String, Object>();
		result.put("real_name", pd.rqst("real_name"));
		result.put("idcard", pd.rqst("idcard"));
		result.put("id_status", "0");
		result.put("id_time", Tools.getLongTime());
		result.put("uid", userId);
		String idcardCheck = BaseService.checkField("user_info", "idcard", pd.rqst("idcard"), "uid");
		
		if (empty(result.get("real_name")))
			ajaxmsg("请填写真实姓名和身份证号码","0",response);
		else if (idcardCheck!=null&&!userId.equals(userId))
			ajaxmsg("此身份证号码已被人使用","0",response);
		else 
		{
			String newId = BaseService.checkField("user_info", "uid", userId, "uid");
			Long count = 0l;
			if (!"0".equals(newId))
				count = thisService.updateUser_info(result);
			else
				count = thisService.addUser_info(result);
			if(count>0)
			{
				Map<String,Object> value = new  HashMap<String, Object>();
				value.put("id_status", 0);
				boolean flag = thisService.updateUser_verify(value);
				if(flag)
					ajaxmsg("认证信息保存成功，请等待审核","1",response);
				else
					ajaxmsg("保存失败，请重试","0",response);
			}
		}
	}
	private boolean empty(Object object) {
		// TODO 自动生成的方法存根
		return false;
	}

	public void bank(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String userId = getId(request);
		Map<String,Object> result = new  HashMap<String, Object>();
		String id_status = BaseService.checkField("user_verify", "uid", userId, "id_status");
		if ("1".equals(id_status))
		{
			List<Map<String,String>> bank_list = thisService.getBankListByUid(userId);
			Map<String,String> xf = getOneCardInfo(userId);
//			Map<String,String> row = new  HashMap<String, String>();
//			row.put("bank_num", xf.get("bank"));
//			row.put("bank_name", "快捷支付");
			for (Map<String,String> map:bank_list)
			{
				map.put("bank_num", hidecard(xf.get("bank"),3,"您还没有登记银行卡"));
				map.put("bank_name", "快捷支付");
			}
			result.put("list",bank_list);
			result.put("status","1");
			String account_money = BaseService.checkField("user_count", "uid", userId, "account_money");
			result.put("account_money",account_money);
			
			ajaxmsg(result,response);
			
		}
		else
			ajaxmsg("您还未完成身份认证","0",response);
	}
	
	public void withdraw(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);	
		String userId = getId(request);
		String txtPassword = borrowAndInvest.userPassCreate(pd.rqst("txtPassword"));
		double withdraw_money = DfMath.s2round(pd.rqst("withdrawMoney"));
		Map<String,String> map = thisService.getUserByUid(userId);
		if(DfMath.s2round(map.get("account_money"))<withdraw_money)
			ajaxmsg("提现金额不能小于10元","0",response);
		else if (10 > withdraw_money)
		{
			Map<String,String> xf = getOneCardInfo(userId);
			Map<String,Object> moneydata = new  HashMap<String, Object>();
			moneydata.put("withdraw_money", withdraw_money);
			moneydata.put("withdraw_fee", "0");
			moneydata.put("withdraw_status", "0");
			moneydata.put("uid", userId);
			moneydata.put("add_time", Tools.getLongTime());
			moneydata.put("add_ip", Tools.getClientIp());
			Long newId = 0l;
			if(!empty(map.get("bank")))
				newId = thisService.addUserWithdraw(moneydata,map.get("bank"));
			else
				newId =thisService. addUserWithdraw(moneydata);
			
			if(!empty(map.get("bank")))
			{
				List<Map<String,String>> list = thisService .getLlpay_logList(userId);
				//$oncardMoney = $affectMoney+$fee;
				double oncardMoney = 0l;//...................看不懂
				for (Map<String,String> value :list)
				{
					double thisleftMoney = DfMath.s2round(value.get("money"))-DfMath.s2round(value.get("withdraw_money"));
					oncardMoney -= thisleftMoney;
					Map<String,Object> save = new  HashMap<String, Object>();
					save.put("id",value.get("id"));
					if(oncardMoney>0)
					{
						save.put("status","3");
						save.put("withdraw_money",new String[]{"exp","`money`"});
					}
					else
						save.put("withdraw_money",new String[]{"exp","`withdraw_money`"+thisleftMoney});
					save.put("withdraw_order",newId);
					
					thisService.saveLlpay_log(save);
				}
			}
			
			if ("0".equals(newId))
			{
				memberMoneyLog(userId,4,-(withdraw_money),"提现");
				ajaxmsg("恭喜，提现申请提交成功","0",response);
			}
		}
	}
	
	private String hidecard(String string, int i, String string2) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private Map<String, String> getOneCardInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private Map<String, Object> getMemberMoneySummary(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private void memberMoneyLog(String userId, int i, double d, String string) {
		// TODO Auto-generated method stub
		
	}
	
//	
		
}
