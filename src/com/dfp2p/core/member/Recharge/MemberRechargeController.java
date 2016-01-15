package com.dfp2p.core.member.Recharge;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.member.Myinvest.MemberMyinvestService;
import com.dfp2p.core.member.Safe.MemberSafeService;
import com.dfp2p.core.thirdparty.ThirdpartyTpqueryController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.google.zxing.pdf417.encoder.PDF417;
import com.sun.jna.platform.win32.Netapi32Util.UserInfo;

@Controller
public class MemberRechargeController extends BaseMemberController {
	public String tplPath = "Recharge";
	@Resource(name="memberRechargeService")
	private MemberRechargeService thisService;
	@Resource(name="memberSafeService")
	private MemberSafeService safeService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		HashMap<String, String> userMoney = borrowAndInvest.getUserMoneySummary(userInfo.get("id"));
		mv.addObject("userMoney",userMoney);
		
		Map<String, String> verifyStatus = safeService.getVerifyStatus(userInfo.get("id"));
		mv.addObject("verifyStatus", verifyStatus);

		//已绑定银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("uid", userInfo.get("id"));
		mp.getStringCondition("card_type", "q");
		Map<String, String> ckCard = thisService.ckBank(mp);
		mv.addObject("cardInfo", ckCard);
		
		//查询余额
		HashMap<String, String> inHashMap = new HashMap<>();
		inHashMap.put("account_type", "SAVING_POT");//SAVING_POT
		inHashMap.put("id", userInfo.get("id"));
		ThirdpartyTpqueryController tpq = new ThirdpartyTpqueryController();
		HashMap<String, Object> RES = tpq.query_balance(request, response, inHashMap);
		//Tools.printData(RES);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView qcbank(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		
		Map<String, String> verifyStatus = safeService.getVerifyStatus(userInfo.get("id"));
		mv.addObject("verifyStatus", verifyStatus);
		
		Map<String, String> useri = thisService.getUserInfoDetail(userInfo.get("id"));
		mv.addObject("useri", useri);
		
		//已绑定银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("uid", userInfo.get("id"));
		mp.getStringCondition("card_type", "q");
		mp.getStringCondition("verify_status", "1");
		Map<String, String> ckCard = thisService.ckBank(mp);
		mv.addObject("cardInfo", ckCard);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	
	public void bindcard(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> inHashMap= new HashMap<>();
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		PageData pd = new PageData(request);
		HashMap<String, Object> jsonData = new HashMap<>();
		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		if("1".equals(pd.post("step"))){
			//绑定银行卡
	 		inHashMap.put("uid", UserInfo.get("id"));
			inHashMap.put("bank_code", pd.post("bank_name"));
			inHashMap.put("bank_num", pd.post("txt_confirmaccount"));
			inHashMap.put("bank_phone", pd.post("bank_phone"));
			inHashMap.put("province", pd.post("province"));
			inHashMap.put("city", pd.post("city"));
			
			//检查银行卡
			WhereUtil mp=new WhereUtil();
			mp.getStringCondition("bank_num", inHashMap.get("bank_num"));
			mp.getStringCondition("card_type", "d","<>");
			
			Map<String, String> ckCard = thisService.ckBank(mp);
			if(ckCard!=null&&"1".equals(ckCard.get("verify_status"))){
				jsonData.put("status", "1");
				jsonData.put("message", "绑定成功");
				HashMap<String, Object> bbank=new HashMap<>();
				bbank.put("card_type", "q");
				bbank.put("id", ckCard.get("id"));
				BaseService.upTable("user_banks", bbank, null);
			}else{						
				HashMap<String, Object> step1Res = tpset.binding_bank_card(request, response, inHashMap);
				if("success".equals(step1Res.get("df_res"))){
					jsonData.put("status", "1");
					jsonData.put("message", "短信发送成功,请注意查收");
					jsonData.put("ticket", step1Res.get("ex_info"));
					long cardId=0;
					if(ckCard==null){
						//保存卡信息
						HashMap<String, Object> bankInfo = new HashMap<>();
						bankInfo.put("uid", UserInfo.get("id"));
						bankInfo.put("bank_num", inHashMap.get("bank_num"));
						bankInfo.put("bank_province", inHashMap.get("province"));
						bankInfo.put("bank_city", inHashMap.get("city"));
						bankInfo.put("bank_name", inHashMap.get("bank_code"));
						bankInfo.put("add_time",Tools.getLongTime());
						bankInfo.put("add_ip", Tools.getClientIp());
						if(pd.post().containsKey("bindtype"))  bankInfo.put("card_type", pd.post("bindtype"));
						else bankInfo.put("card_type", "q");
						bankInfo.put("verify_status", "0");
						bankInfo.put("bank_phone",  inHashMap.get("bank_phone"));
						cardId = thisService.addBank(bankInfo);
					}else{
						cardId = Long.valueOf(ckCard.get("id"));
					}
					
					jsonData.put("cardId", cardId);
					
				}else{
					jsonData.put("status", "0");
					jsonData.put("message", step1Res.get("df_msg"));
				}
			}
		}else{
			//绑卡推进 返回的card_id要保存，解绑要用
	 		inHashMap.put("code", pd.post("txt_code_add"));
			inHashMap.put("ticket", pd.post("ticket"));
			HashMap<String, Object> step2Res = tpset.binding_bank_card_advance(request, response, inHashMap);
			if("success".equals(step2Res.get("df_res"))){
				jsonData.put("status", "1");
				if(pd.post().containsKey("bindtype")) jsonData.put("message", "银行卡绑定成功");
				else  jsonData.put("message", "快捷卡绑定成功");
				
				//更新卡信息
				WhereUtil mp=new WhereUtil();
				mp.getStringCondition("id", pd.get("cid"));
				mp.getStringCondition("uid", UserInfo.get("id"));
				mp.getStringCondition("bank_num", pd.post("txt_confirmaccount"));
				
				HashMap<String, Object> bankInfo = new HashMap<>();
				bankInfo.put("edit_time",Tools.getLongTime());
				bankInfo.put("verify_status", "1");
				bankInfo.put("tp_code", step2Res.get("ex_info"));
				
				long cardId = thisService.upBank(bankInfo,mp);
				
			}else{
				jsonData.put("status", "0");
				jsonData.put("message", step2Res.get("df_msg"));
			}
		}
		this.echoJson(jsonData, response);
		
	}
	public void unbindcard(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> inHashMap= new HashMap<>();
		HashMap<String, String> UserInfo = Common.getUserLoginInfo();
		PageData pd = new PageData(request);
		String cardId=pd.get("id");
		//已绑定银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("uid", UserInfo.get("id"));
		mp.getStringCondition("id", cardId);
		mp.getStringCondition("verify_status", "1");
		Map<String, String> cardInfo = BaseService.getOne("user_banks", mp.getParamConditionList(), null);
		if(cardInfo==null){
			this.ajaxmsg("卡信息有误", 0, response);
			return ;
		}else{
			
			inHashMap.put("card_id", cardInfo.get("tp_code"));
			inHashMap.put("uid", UserInfo.get("id"));
			ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
			HashMap<String, Object> resf = tpset.unbinding_bank_card(request, response, inHashMap);
			if("success".equals(resf.get("df_res"))){
				HashMap<String, Object> upCard = new HashMap<>();
				upCard.put("id", cardInfo.get("id"));
				upCard.put("card_type", "d");
				BaseService.upTable("user_banks", upCard, null);
				this.ajaxmsg("删除成功", 1, response);
			}else{
				this.ajaxmsg("删除失败："+resf.get("df_msg"), 0, response);
			}
			return ;
		}
		
	}	
	
	
	public ModelAndView detail(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		HashMap<String, String> statusInfo = new HashMap<>();
		statusInfo.put("0", "未完成");
		statusInfo.put("1", "成功");
		statusInfo.put("3", "失败");
		mv.addObject("statusInfo", statusInfo);

		long startTime = Tools.strToTime(Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd 23:59:59"));
		Map<String, String> timeSpan = new LinkedHashMap<String,String>();
		timeSpan.put("day7",Tools.timeAddDay(-7, startTime+"")+","+startTime);
		timeSpan.put("month1",Tools.timeAddDay(-30, startTime+"")+","+startTime);
		timeSpan.put("month3",Tools.timeAddDay(-90, startTime+"")+","+startTime);
		mv.addObject("timeSpan",timeSpan);
		
		PageData pd = new PageData(request);	
		HashMap<String, Object> list = thisService.getRechargeList(pd, mv);		
		mv.addObject("list", list);

		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView detail_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

		return this.detail(request,response,  mv);
	}
	
	public void quickRecharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		PageData pd = new PageData(request);
		HashMap<String, String>	rechargeInfo = new HashMap<>();	
		rechargeInfo.put("id", userInfo.get("id"));
		rechargeInfo.put("money", pd.get("money"));
		
		//检查银行卡
		WhereUtil mp=new WhereUtil();
		mp.getStringCondition("id", pd.get("bank_id"));
		mp.getStringCondition("uid", userInfo.get("id"));
		mp.getStringCondition("card_type", "q");
		Map<String, String> ckCard = thisService.ckBank(mp);
		
		rechargeInfo.put("quick_pay_card_num", ckCard.get("bank_num"));
		rechargeInfo.put("quick_pay_bankid", ckCard.get("bank_name"));
		rechargeInfo.put("binding_pay_card_id", ckCard.get("tp_code"));
		rechargeInfo.put("quick_pay_phone", ckCard.get("bank_phone"));

		Map<String, String> useri = thisService.getUserInfoDetail(userInfo.get("id"));
		rechargeInfo.put("quick_pay_kaihu_name", useri.get("real_name"));
		
		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		HashMap<String, Object> rechargeRes = tpset.recharge(request, response, mv,rechargeInfo);
		if("success".equals(rechargeRes.get("df_res"))){
			
			HashMap<String, String> rechargeInfos=new HashMap<>();
			rechargeInfos.put("id", rechargeRes.get("ex_recharge_id")+"");
			rechargeInfos.put("uid", userInfo.get("id"));
			rechargeInfos.put("ex_ticket", rechargeRes.get("ex_ticket")+"");
			rechargeInfos.put("money", rechargeInfo.get("money"));
			rechargeInfos.put("ex_recharge_fee", rechargeRes.get("ex_recharge_fee")+"");
			rechargeInfos.put("ex_out_trade_no", rechargeRes.get("ex_out_trade_no")+"");
			rechargeInfos.put("ex_recharge_status", rechargeRes.get("ex_recharge_status")+"");
			thisService.rechargeRes(rechargeInfos);		
			
			HashMap<String, Object> jsonMap=new HashMap<>();
			jsonMap.put("ticket", rechargeRes.get("ex_ticket"));
			jsonMap.put("msg", "验证码已发送，请注意查收");
			jsonMap.put("status", "1");
			ajaxmsg(jsonMap, response);
		}else{
			ajaxmsg(rechargeRes.get("df_msg")+"", 0, response);
		}
	}

	
	public void doQuickRecharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		PageData pd = new PageData(request);
		HashMap<String, String>	rechargeInfo = new HashMap<>();	
		rechargeInfo.put("id", userInfo.get("id"));
		rechargeInfo.put("money", pd.get("money"));

		Map<String, String> oldRecharge = BaseService.getOne("recharge",Tools.BuildWhereMap("tran_id", pd.post("ticket"), "="),null);
		
		//充值推进
		HashMap<String, String> inHashMap=new HashMap<>();
 		inHashMap.put("code", pd.post("code"));
		inHashMap.put("ticket", pd.post("ticket"));

		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		HashMap<String, Object> rechargeRes = tpset.advance_hosting_pay(request, response, inHashMap);
		if("success".equals(rechargeRes.get("df_res"))){
			/*HashMap<String, String> rechargeInfos=new HashMap<>();
			rechargeInfos.put("id", oldRecharge.get("id"));
			rechargeInfos.put("uid", userInfo.get("id"));
			rechargeInfos.put("ex_ticket_nid", rechargeRes.get("ex_ticket")+"");
			rechargeInfos.put("ex_out_trade_no", rechargeRes.get("ex_out_trade_no")+"");
			rechargeInfos.put("ex_recharge_status", "1");
			rechargeInfos.put("money", oldRecharge.get("money"));
			rechargeInfos.put("fee", oldRecharge.get("fee"));
			thisService.rechargeRes(rechargeInfos);	*/	
			
			ajaxmsg("提交成功", 1, response);
		}else{
			HashMap<String, String> rechargeInfos=new HashMap<>();
			rechargeInfos.put("id", oldRecharge.get("id"));
			rechargeInfos.put("ex_ticket_nid", rechargeRes.get("ex_ticket")+"");
			rechargeInfos.put("ex_out_trade_no", rechargeRes.get("ex_out_trade_no")+"");
			rechargeInfos.put("ex_recharge_status", "3");
			thisService.rechargeRes(rechargeInfos);		
			
			ajaxmsg(rechargeRes.get("df_msg")+"", 0, response);
		}
	}

}
