package com.dfp2p.core.member.Safe;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.other.message.SendToEmail;
import com.dfp2p.other.message.SendToPhone;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class MemberSafeController extends BaseMemberController {
	public String tplPath = "Safe";
	
	@Resource(name="memberSafeService")
	private MemberSafeService thisService;
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String adminId = getId(request);
		pd.get().put("id", adminId);
		Map<String, String> userMap = thisService.getUser(pd, mv);
		mv.addObject("user_info", userMap);

		Map<String, String> verifyStatus = thisService.getVerifyStatus(getId(request));
		mv.addObject("verifyStatus", verifyStatus);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void retPasswordWithCode(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String userId = getId(request);
		
		String sms_vcode = pd.rqst("sms_vcode");
		String newpassword = borrowAndInvest.userPassCreate(pd.rqst("newpassword"));
		String res = borrowAndInvest.is_verify(userId, sms_vcode, "1", true);
		if(StringUtils.isBlank(res))
		{
			ajaxmsg("验证失败", 0, response);
		}
		else
		{
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("pin_pass", newpassword);
			userValueMap.put("id", userId);
			boolean result = thisService.updateUser(userValueMap);
			if(!result)
			{
				ajaxmsg("修改失败", 0, response);
			}else{
				ajaxmsg("修改成功", 1, response);
			}	
		}
				
	}
	
	
	public void retPayPassword(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String adminId = getId(request);
		pd.get().put("id", adminId);
		Map<String, String> userMap = thisService.getUser(pd, mv);
		
		String pin_pass = userMap.get("pin_pass");
		if(StringUtils.isBlank(pin_pass)) pin_pass=userMap.get("user_pass");
		String oldpassword = pd.rqst("oldpassword");
		String newPassword = borrowAndInvest.userPassCreate(pd.rqst("newpassword"));
		String encryptPassword = borrowAndInvest.userPassCreate(oldpassword);
		if (pin_pass.equals(encryptPassword)||"".equals(pin_pass))
		{
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("pin_pass", newPassword);
			userValueMap.put("id", adminId);
			boolean flag = thisService.updateUser(userValueMap);
			if (flag)
				ajaxmsg("修改成功", 1, response);
			else
				ajaxmsg("修改失败", 0, response);
		}
		else
			ajaxmsg("原始密码不对", 0, response);
	}
	public void retLoginPassword(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String adminId = getId(request);
		pd.get().put("id", adminId);
		Map<String, String> userMap = thisService.getUser(pd, mv);
		
		String user_pass = userMap.get("user_pass");
		String loginPassword = pd.rqst("oldpassword");
		String newPassword = borrowAndInvest.userPassCreate(pd.rqst("newpassword"));
		String encryptPassword = borrowAndInvest.userPassCreate(loginPassword);
		
		if (user_pass.equals(encryptPassword))
		{
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("user_pass", newPassword);
			userValueMap.put("id", adminId);
			boolean flag = thisService.updateUser(userValueMap);
			if (flag)
				ajaxmsg("修改成功", 1, response);
			else
				ajaxmsg("修改失败", 0, response);
		}
		else
			ajaxmsg("原始密码不对", 0, response);
	}
	public ModelAndView retEmail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String userId = pd.rqst("id");
		String newEmail =pd.rqst("email");
		String email_code = pd.rqst("email_code");
		
		String res = borrowAndInvest.is_verify(userId, email_code, "1", true);
		boolean flag = true;
		 
		if(!StringUtils.isBlank(res))
		{
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("user_email", newEmail);
			userValueMap.put("id", userId);
			flag = thisService.updateUser(userValueMap);			
			 
		}
		if (flag)
			mv.setViewName("/member/Safe/sucess");
		else
			mv.setViewName("/member/Safe/fail");
		return mv;
	}
 
	public void realNameVerify(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		String UserId = getId(request);
		
		String realName = pd.rqst("realName");
		String card_id = pd.rqst("card_id");
		Map<String, String> idcardE = thisService.findUserByIdCard(card_id);
		logger.info(idcardE+"FFFFFF"+(idcardE==null)+("null".equals(idcardE)));
		if(idcardE==null){
		
		//托管绑定
		ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
		HashMap<String, String> bindVerifyHashMap=new HashMap<>();
		bindVerifyHashMap.put("uid", UserId);
		bindVerifyHashMap.put("real_name", realName);
		bindVerifyHashMap.put("idcard", card_id);
		HashMap<String, Object> bindRes = tpsetController.set_real_name(request, response, bindVerifyHashMap);
		
		if("success".equals(bindRes.get("df_res"))){
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("real_name", realName);
			userValueMap.put("idcard", card_id);
			userValueMap.put("uid", UserId);
			boolean flag = thisService.updateUser_info(userValueMap);			
			if (flag){
				Map<String, Object> upmap=new HashMap<>();
				upmap.put("uid", UserId);
				upmap.put("id_status", "1");
				thisService.upVerify(upmap);
				ajaxmsg("认证成功", 1, response);
			}
			else	ajaxmsg("认证失败", 0, response);
		}else{
			ajaxmsg("身份信息有误", 0, response);
		}
		}else{
			ajaxmsg("身份信息已被别人使用", 0, response);
		}
		 
	}
	public void retPhone(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		pd.get().put("id",getId(request));
		Map<String, String> userMap = thisService.getUser(pd, mv);
		
		String vcode = pd.rqst("sms_vcode");
		String phone = pd.rqst("phone");
		String res = borrowAndInvest.is_verify(phone, vcode, "1", true);
		
		if(StringUtils.isBlank(res)){
			ajaxmsg("验证失败", 0, response);
		}else{
			Map<String, String> verifyStatus = thisService.getVerifyStatus(getId(request));
			if(verifyStatus!=null&&!"1".equals(verifyStatus.get("phone_status"))){
				Map<String, Object> upmap=new HashMap<>();
				upmap.put("uid", getId(request));
				upmap.put("phone_status", "1");
				thisService.upVerify(upmap);
				
				Map<String, Object> userValueMap = new HashMap<String, Object>();
				userValueMap.put("user_phone", phone);
				userValueMap.put("id", getId(request));
				thisService.updateUser(userValueMap);
				
				//托管绑定
				ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
				HashMap<String, String> bindVerifyHashMap=new HashMap<>();
				bindVerifyHashMap.put("uid", getId(request));
				bindVerifyHashMap.put("verify_type", "phone");
				bindVerifyHashMap.put("verify_data", phone);
				tpsetController.binding_verify(request, response, bindVerifyHashMap);
			}
			ajaxmsg("验证成功", 1, response);
		}
		 
	}
	public void retPhone2(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HttpSession session = request.getSession();
		PageData pd = new PageData(request);
		String userId = getId(request);
		pd.get().put("id",userId );
		
		String sms_vcode = pd.rqst("sms_vcode");
		String phone = pd.rqst("phone");

		String res = borrowAndInvest.is_verify(phone, sms_vcode, "1", true);
		if(StringUtils.isBlank(res)||StringUtils.isBlank(session.getAttribute("phone_step_2")+"")||!"s".equals(session.getAttribute("phone_step_2")))
		{
			ajaxmsg("验证失败", 0, response);
		}
		else
		{
			Map<String, Object> userValueMap = new HashMap<String, Object>();
			userValueMap.put("user_phone", phone);
			userValueMap.put("id", userId);
			boolean result = thisService.updateUser(userValueMap);
			if(!result)
			{
				ajaxmsg("验证失败", 0, response);
			}else{
				session.removeAttribute("phone_step_2");
				//托管绑定
				ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
				HashMap<String, String> bindVerifyHashMap=new HashMap<>();
				bindVerifyHashMap.put("uid", getId(request));
				bindVerifyHashMap.put("verify_type", "phone");
				bindVerifyHashMap.put("verify_data", phone);
				tpsetController.binding_verify(request, response, bindVerifyHashMap);
				ajaxmsg("验证成功", 1, response);
			}	
		}
				
			
			
		
	}
	
	public void sendToEmail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv)
	{
		PageData pd = new PageData(request);
		String UserId = getId(request);
		String newEmail = pd.rqst("email");
		String oldEmail = pd.rqst("oldemail");
		pd.get().put("id",UserId );
		Map<String, String> userMap = thisService.getUser(pd, mv);
		String user_email = userMap.get("user_email");
		Map<String, String> verifyStatus = thisService.getVerifyStatus(getId(request));
		if (user_email.equals(oldEmail)||!"1".equals(verifyStatus.get("email_status")))
		{
			String Code = borrowAndInvest.rand_string(UserId, "1", 1, 6);
			
			boolean flag = false;
			if(!"".equals(UserId)&&!"_fail".equals(Code)){

				Map<String,String> config_map = new HashMap<String,String>();
				if(userMap!=null)
				{
					config_map.put("#UserName#", userMap.get("user_name"));
					String url = BaseService.getProjectURL(request)+"memberSafe/retEmail.do?email="+newEmail+"&id="+UserId+"&email_code="+Code+"  ";
					config_map.put("#LINK#", url);
				}
				flag =SendToEmail.sendTplEmail(newEmail, "reg", config_map);
				
				if(flag)
					ajaxmsg("success", 1, response);
				else
					ajaxmsg("fail", 0, response);
			}
		}
		else
			ajaxmsg("旧邮箱验证失败", 0, response);
		
	}
	public void sendToPhone(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HttpSession session = request.getSession();
		String UserId = getId(request);
		String phone = pd.rqst("phone");
		String Code = "";
		pd.get().put("id",getId(request));
		Map<String, String> verifyStatus = thisService.getVerifyStatus(getId(request));
		if("pin".equals(pd.rqst("type"))){
			if(verifyStatus!=null&&"1".equals(verifyStatus.get("phone_status"))){
				Code = borrowAndInvest.rand_string(getId(request), "1", 1, 6);
				Map<String, String> upm = BaseService.getOne("user", Tools.BuildWhereMap("id", getId(request), "="), "user_phone");
				Map<String, Object> userInfo = (Map<String,Object>)session.getAttribute("UserInfo");
				Map<String,String> config_map = new HashMap<String,String>();
				if(userInfo!=null)
				{
					config_map.put("#UserName#", userInfo.get("user_name")+"");
					config_map.put("#CODE#", Code);
				}
				
				Map<String, Object> list = ConfigCache.getCacheList("msg_phone");
				boolean flag=false;
				flag = SendToPhone.sendTplText(upm.get("user_phone"), "getPassWord", config_map);
				if(flag){
					ajaxmsg("发送成功", 1, response);
				}else{
					ajaxmsg("发送失败",0, response);
				}
			}else{
				ajaxmsg("请先通过手机认证或者联系客服重置支付密码", 0, response);
			}		
		}else{
			boolean flagp =false;
			String errorMsgString="";
			if(!StringUtils.isBlank(session.getAttribute("phone_step_2")+"")&&"s".equals(session.getAttribute("phone_step_2"))){
				Map<String, String> userMapp = thisService.findUserByPhone(phone);
				flagp = (userMapp==null||!UserId.equals(userMapp.get("id")));
				errorMsgString="此手机号已被人使用";
			}else if(verifyStatus!=null&&"1".equals(verifyStatus.get("phone_status"))){
				Map<String, String> userMapp = thisService.getUser(pd, mv);
				flagp = userMapp.get("user_phone").equals(phone);
				errorMsgString="原手机号错误";
			}else{//首次验证
				flagp = true;
			}
			if(flagp){
				Code = borrowAndInvest.rand_string(phone, "1", 1, 6);
				boolean flag = false;
				if(!"".equals(UserId)&&!"_fail".equals(Code)){
					pd.get().put("id",UserId );
					Map<String, String> userMap = thisService.getUser(pd, mv);
		
					Map<String,String> config_map = new HashMap<String,String>();
					if(userMap!=null)
					{
						config_map.put("#UserName#", userMap.get("user_name"));
						config_map.put("#CODE#", Code);
					}
					flag =SendToPhone.sendTplText(phone, "verify", config_map);
				}
				if(flag){
					session.setAttribute("phone_step_2", "s");
					ajaxmsg("发送成功", 1, response);
				}
				else	ajaxmsg("发送失败", 0, response);
			}else{
				ajaxmsg(errorMsgString, 0, response);
			}
		}
	}
	
	private String getId(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Object UserInfo= session.getAttribute("UserInfo");
		String userId = "0";
		if(UserInfo!=null){
			userId = ((HashMap<String, String>)UserInfo).get("id");
		}
		return userId;
	}
	
	
}
