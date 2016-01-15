package com.dfp2p.core.home.Getpassword;

import java.io.IOException;
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
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.home.Register.RegisterService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.other.message.SendToEmail;
import com.dfp2p.other.message.SendToPhone;
import com.dfp2p.util.PageData;
import com.dfp2p.util.VerifyCode.ValidateCode;
import com.lowagie.text.xml.xmp.PdfA1Schema;

@Controller
public class GetpasswordController extends BaseHomeController {
	public String tplPath = "Getpassword";
	@Resource(name="GetpasswordService")
	private GetpasswordService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView steptwo(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HttpSession session = request.getSession();
		String stepString=(String) session.getAttribute("getStep");
		if(!"2".equals(stepString)){
			session.removeAttribute("getpassUid");
			session.removeAttribute("getpassAccount");
			session.removeAttribute("getpassStep");
			return this.showTip(mv, "error", "3", "访问出错", tplCommon.U("home/getpassword/index"));
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView stepthree(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		HttpSession session = request.getSession();
		String stepString=(String) session.getAttribute("getStep");
		if(!"3".equals(stepString)){
			session.removeAttribute("getpassUid");
			session.removeAttribute("getpassAccount");
			session.removeAttribute("getpassStep");
			return this.showTip(mv, "error", "3", "访问出错", tplCommon.U("home/getpassword/index"));
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView success(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void verifyCode(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
		SiteVerifyCode(4,request, response);
	}
	
	
	
	
	public void verifyAccount(HttpServletRequest request,HttpServletResponse response) {
		HashMap<String, Object> jsonMsg = new HashMap<>();
		HttpSession session = request.getSession();
		PageData pd = new PageData(request);
		String vcode= pd.rqst("vcode");
		String isRepeat = pd.rqst("isRepeat");
		if((vcode==null || !vcode.toLowerCase().equals(session.getAttribute("code"))) && !"1".equals(isRepeat)) {
			ajaxmsg("验证码错误", 0, response);
			return ;
		}
		
		long UserId = thisService.checkAccount(pd.rqst("account"));
		String Code = borrowAndInvest.rand_string(UserId+"", "1", 1, 6);
		if(UserId>0&&!"_fail".equals(Code)){
			jsonMsg.put("msg", "操作成功");
			jsonMsg.put("status", "1");
			session.setAttribute("getpassUid", UserId+"");
			session.setAttribute("getStep", "2");
			session.setAttribute("getpassAccount", pd.rqst("account"));
		}else{
			jsonMsg.put("msg", "帐户信息有误");
			jsonMsg.put("status", "0");
		}
		
		
		sendScode(request,response);
		jsonMsg.put("url", tplCommon.U("home/getpassword/steptwo"));
		this.echoJson(jsonMsg, response);
	}
	
	public void sendScode(HttpServletRequest request,HttpServletResponse response) {
		HashMap<String, Object> jsonMsg = new HashMap<>();
		HttpSession session = request.getSession();
		PageData pd = new PageData(request);
		Object getpassAccountO = session.getAttribute("getpassAccount");
		if(getpassAccountO==null||StringUtils.isBlank(String.valueOf(getpassAccountO))){
			session.removeAttribute("getpassUid");
			session.removeAttribute("getpassAccount");
			session.removeAttribute("getpassStep");
			jsonMsg.put("msg", "验证出错");
			jsonMsg.put("status", "0");
			jsonMsg.put("url", tplCommon.U("home/getpassword/index"));
			this.echoJson(jsonMsg, response);
			return ;
		}
		String getpassAccount = String.valueOf(getpassAccountO);
		//************************************
		String code = new ValidateCode().getCode();
		session.setAttribute("scode", code);
		if(getpassAccount.contains("@")){
			Map<String, String> rmap=new HashMap<>();
			rmap.put("#UserName#", getpassAccount);
			rmap.put("#CODE#", code);
			SendToEmail.sendTplEmail(getpassAccount, "getPassWord", rmap);
		}else{
			Map<String, String> rmap=new HashMap<>();
			rmap.put("#UserName#", getpassAccount);
			rmap.put("#CODE#", code);
			SendToPhone.sendTplText(getpassAccount, "getPassWord", rmap);
		}
		
	}
	
	public void verifySCode(HttpServletRequest request,HttpServletResponse response) {
		HashMap<String, Object> jsonMsg = new HashMap<>();
		HttpSession session = request.getSession();
		String stepString=(String) session.getAttribute("getStep");
		if(!"2".equals(stepString)){
			session.removeAttribute("getpassUid");
			session.removeAttribute("getpassAccount");
			session.removeAttribute("getpassStep");
			jsonMsg.put("msg", "验证出错");
			jsonMsg.put("status", "0");
			jsonMsg.put("url", tplCommon.U("home/getpassword/index"));
			this.echoJson(jsonMsg, response);
			return ;
		}

		PageData pd = new PageData(request);
		String scode= pd.rqst("scode");
		String UserId = (String) session.getAttribute("getpassUid");
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``
		Object obj;
		String session_scode = ( (obj=session.getAttribute("scode")) != null)?obj.toString():"";
		boolean flag = session_scode.equalsIgnoreCase(scode);
		//String res = borrowAndInvest.is_verify(UserId, scode, session_scode, false);
//		if(StringUtils.isBlank(res)){
		if (!flag){
			ajaxmsg("验证失败", 0, response);
			return ;
		}else{
			session.setAttribute("getpassUid", UserId);
			session.setAttribute("getStep", "3");
			//*************
			session.removeAttribute("scode");
			jsonMsg.put("msg", "验证成功");
			jsonMsg.put("status", "1");
			jsonMsg.put("url", tplCommon.U("home/getpassword/stepthree"));
			this.echoJson(jsonMsg, response);
		}
	}
	
	public void setnewPass(HttpServletRequest request,HttpServletResponse response) {
		HashMap<String, Object> jsonMsg = new HashMap<>();
		HttpSession session = request.getSession();
		String stepString=(String) session.getAttribute("getStep");
		if(!"3".equals(stepString)){
			session.removeAttribute("getpassUid");
			session.removeAttribute("getpassAccount");
			session.removeAttribute("getpassStep");
			jsonMsg.put("msg", "验证出错");
			jsonMsg.put("status", "0");
			jsonMsg.put("url", tplCommon.U("home/getpassword/index"));
			this.echoJson(jsonMsg, response);
			return ;
		}
		
		PageData pd = new PageData(request);
		String newpass= pd.rqst("newpass");
		String UserId = (String) session.getAttribute("getpassUid");
		long upres = thisService.setNewPass(UserId, newpass);
		
		if(upres>0){
			session.removeAttribute("getpassUid");
			session.removeAttribute("getpassAccount");
			session.removeAttribute("getpassStep");
			
			jsonMsg.put("msg", "更新成功");
			jsonMsg.put("status", "1");
			jsonMsg.put("url", tplCommon.U("home/getpassword/success"));
			this.echoJson(jsonMsg, response);
		}else{
			ajaxmsg("更新失败，请联系客服", 0, response);
			return ;
		}
	}
	
}


