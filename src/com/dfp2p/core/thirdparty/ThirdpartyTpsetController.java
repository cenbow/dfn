package com.dfp2p.core.thirdparty;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.IfProfileValue;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseThirdpartyController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.other.DfHttpClient;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class ThirdpartyTpsetController extends BaseThirdpartyController {
	private static Log logger = LogFactory.getLog(ThirdpartyTpsetController.class);
	
	public HashMap<String, Object> create_activate_member(HttpServletRequest request,HttpServletResponse response, String uid) {
		String actionType = "create_activate_member";

		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",this.sinaUid(uid));
		submitdata.put("identity_type","UID");
		submitdata.put("member_type","1");
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		resMap.put("ex_info", submitdata.get("identity_id"));
		return resMap;
	}
	public HashMap<String, Object> set_real_name(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "set_real_name";		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",this.sinaUid(userInfo.get("uid")));
		submitdata.put("identity_type","UID");
		submitdata.put("cert_type","IC");
		submitdata.put("real_name",this.getSinaRas(userInfo.get("real_name")));
		submitdata.put("cert_no",this.getSinaRas(userInfo.get("idcard")));
		submitdata.put("need_confirm","Y");
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}
	
	public HashMap<String, Object> binding_verify(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "binding_verify";
		HashMap<String, String> verifyTypeHashMap=new HashMap<>();
		verifyTypeHashMap.put("phone", "MOBILE");
		verifyTypeHashMap.put("email", "EMAIL");
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",this.sinaUid(userInfo.get("uid")));
		submitdata.put("identity_type","UID");
		submitdata.put("verify_type",verifyTypeHashMap.get(userInfo.get("verify_type")));
		submitdata.put("verify_entity",this.getSinaRas(userInfo.get("verify_data")));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}
	
	public HashMap<String, Object> binding_bank_card(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "binding_bank_card";

		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("request_no",this.getOrderId());
		submitdata.put("identity_id",this.sinaUid(userInfo.get("uid")));
		submitdata.put("identity_type","UID");
		submitdata.put("bank_code",userInfo.get("bank_code"));
		submitdata.put("bank_account_no",this.getSinaRas(userInfo.get("bank_num")));
		submitdata.put("card_type","DEBIT");
		submitdata.put("card_attribute","C");
		submitdata.put("phone_no",this.getSinaRas(userInfo.get("bank_phone")));
		submitdata.put("province",userInfo.get("province"));
		submitdata.put("city",userInfo.get("city"));
		if(!Common.isBlankInMap(userInfo, "bank_branch")) submitdata.put("bank_branch",this.getSinaRas(userInfo.get("bank_branch")));
		submitdata.put("verify_mode","SIGN");
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		
		Map<String, Object> resJson = JSON.parseObject(httpRes.get("jsonStr"));
		resMap.put("ex_info", resJson.get("ticket"));
		
		return resMap;
	}	
	public HashMap<String, Object> binding_bank_card_advance(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "binding_bank_card_advance";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("ticket",userInfo.get("ticket"));
		submitdata.put("valid_code",userInfo.get("code"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		
		Map<String, Object> resJson = JSON.parseObject(httpRes.get("jsonStr"));
		resMap.put("ex_info", resJson.get("card_id"));

		return resMap;
	}
	
	public HashMap<String, Object> advance_hosting_pay(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "advance_hosting_pay";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_advance_no", this.getOrderId());
		submitdata.put("ticket",userInfo.get("ticket"));
		submitdata.put("validate_code",userInfo.get("code"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		

		Map<String, Object> resJson = JSON.parseObject(httpRes.get("jsonStr"));
		HashMap<String, String> rechargeStatusMap = getRechargeStatus();

		resMap.put("ex_ticket", submitdata.get("ticket"));
		resMap.put("ex_out_trade_no", submitdata.get("out_advance_no"));
		resMap.put("ex_response_code", resJson.get("response_code"));
		resMap.put("ex_recharge_status", rechargeStatusMap.get(resJson.get("deposit_status")));//ex_recharge_status

		return resMap;
	}
	
	public HashMap<String, Object> unbinding_bank_card(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "unbinding_bank_card";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("identity_id",userInfo.get("uid"));
		submitdata.put("identity_type","UID");
		submitdata.put("card_id",userInfo.get("card_id"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}	
	
	public HashMap<String, Object> create_hosting_refund(HashMap<String, String>userInfo) {
		String actionType = "create_hosting_refund";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no",this.getOrderId());
		submitdata.put("orig_outer_trade_no",userInfo.get("tran_id"));
		submitdata.put("refund_amount",Tools.getDoubleString(userInfo.get("money")));
		submitdata.put("summary", userInfo.get("info"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}	
	
	
	public HashMap<String, Object> create_hosting_transfer(HashMap<String, String>userInfo) {
		String actionType = "create_hosting_transfer";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no",this.getOrderId());
		submitdata.put("payer_identity_id",this.sinaUid(userInfo.get("uid")));
		submitdata.put("payer_identity_type", "UID");
		submitdata.put("payer_account_type", "BASIC");
		submitdata.put("payee_identity_id", this.sinaUid(userInfo.get("uid")));
		submitdata.put("payee_identity_type", "UID");
		submitdata.put("payee_account_type", "SAVING_POT");
		submitdata.put("amount",Tools.getDoubleString(userInfo.get("money")));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}	
	
	public HashMap<String, Object> create_p2p_hosting_borrowing_target(HttpServletRequest request,HttpServletResponse response, String borrowId) {
		String actionType = "create_p2p_hosting_borrowing_target";
		
		Map<String, String> borrowInfo = BaseService.getOne("borrow_info", Tools.BuildWhereMap("id", borrowId, "="), null);
		HttpServletRequest Request = getRequest();
		String port=(Request.getLocalPort()==80||Request.getLocalPort()==8080)?"":":"+Request.getLocalPort();
		String urlString= "http://"+Request.getServerName()+port+tplCommon.U("home/invest/borrow")+"?id="+borrowInfo.get("id");
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("goods_id",borrowInfo.get("id"));
		submitdata.put("goods_name",borrowInfo.get("borrow_name"));
		submitdata.put("annual_yield",borrowInfo.get("borrow_interest_rate"));
		submitdata.put("term",Tools.TimeStamp2Date(Tools.timeAddDay(10,Tools.getLongTime()+"")+"", "yyyyMMddHHmmss"));
		submitdata.put("repay_method",("5".equals(borrowInfo.get("repayment_type")))?"MONTHLY_PAYMENT":"DEBT_MATURITY");
		submitdata.put("guarantee_method","企业担保");
		submitdata.put("debtor_list",this.sinaUid(borrowInfo.get("borrow_uid"))+"^UID^"+Tools.getDoubleString(borrowInfo.get("borrow_money")));//+"$"
		submitdata.put("total_amount",Tools.getDoubleString(borrowInfo.get("borrow_money")));
		submitdata.put("begin_date",Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyyMMddHHmmss")+"");
		submitdata.put("url",urlString);
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		return resMap;
	}
	
/**
 * 
 * @param request
 * @param response
 * @param userInfo
 * @return
 * 1001	代收投资金
	1002	代收还款金
	2001	代付借款金
	2002	代付（本金/收益）金

 */
	public HashMap<String, Object> create_hosting_collect_trade(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "create_hosting_collect_trade";
		//Tools.printData(userInfo);
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no", this.getOrderId());
		submitdata.put("out_trade_code", userInfo.get("type"));
		submitdata.put("summary", userInfo.get("info"));
		submitdata.put("trade_close_time", "10m");
		submitdata.put("can_repay_on_failed", "Y");
		submitdata.put("goods_id", userInfo.get("borrow_id"));//标号
		//支付信息
		String atype="";
		if(userInfo.get("uid").indexOf("@")!=(-1)){
			submitdata.put("payer_id", (userInfo.get("uid")));
			submitdata.put("payer_identity_type","EMAIL");
			atype="BASIC";
		}else{
			submitdata.put("payer_id", this.sinaUid(userInfo.get("uid")));
			submitdata.put("payer_identity_type","UID");
			atype="SAVING_POT";
		}
		submitdata.put("pay_method","balance^"+Tools.getDoubleString(userInfo.get("money"))+"^"+atype);//|balance^100.00^SAVING_POT
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		resMap.put("ex_trade_no", submitdata.get("out_trade_no"));
		return resMap;
	}
	
	public HashMap<String, Object> create_single_hosting_pay_trade(HashMap<String, String>userInfo) {
		String actionType = "create_single_hosting_pay_trade";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no", this.getOrderId());
		submitdata.put("out_trade_code", userInfo.get("type"));
		if(userInfo.get("in_uid").indexOf("@")!=(-1)){ 
			submitdata.put("payee_identity_id", (userInfo.get("in_uid")));
			submitdata.put("payee_identity_type","EMAIL");
			if(userInfo.containsKey("fz_id")){
				if(userInfo.get("fz_id").indexOf("@")!=(-1)) submitdata.put("split_list", (userInfo.get("in_uid"))+"^EMAIL^SAVING_POT^"+(userInfo.get("fz_id"))+"^EMAIL^BASIC^"+Tools.getDoubleString(userInfo.get("fz_money"))+"^"+userInfo.get("fz_info"));	
				else  submitdata.put("split_list", (userInfo.get("in_uid"))+"^EMAIL^SAVING_POT^"+this.sinaUid(userInfo.get("fz_id"))+"^UID^SAVING_POT^"+Tools.getDoubleString(userInfo.get("fz_money"))+"^"+userInfo.get("fz_info"));	
			}
			submitdata.put("account_type","BASIC");
		}else{
			submitdata.put("payee_identity_id", this.sinaUid(userInfo.get("in_uid")));
			submitdata.put("payee_identity_type","UID");
			if(userInfo.containsKey("fz_id")){
				if(userInfo.get("fz_id").indexOf("@")!=(-1)) submitdata.put("split_list", this.sinaUid(userInfo.get("in_uid"))+"^UID^SAVING_POT^"+(userInfo.get("fz_id"))+"^EMAIL^BASIC^"+Tools.getDoubleString(userInfo.get("fz_money"))+"^"+userInfo.get("fz_info"));	
				else  submitdata.put("split_list", this.sinaUid(userInfo.get("in_uid"))+"^UID^SAVING_POT^"+this.sinaUid(userInfo.get("fz_id"))+"^UID^SAVING_POT^"+Tools.getDoubleString(userInfo.get("fz_money"))+"^"+userInfo.get("fz_info"));	
			}
			submitdata.put("account_type","SAVING_POT");
		}
		submitdata.put("amount",Tools.getDoubleString(userInfo.get("money")));
		
		submitdata.put("summary", userInfo.get("info"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		
		return resMap;
	}
	
	public HashMap<String, Object> create_single_hosting_pay_to_card_trade(HttpServletRequest request,HttpServletResponse response, HashMap<String, String>userInfo) {
		String actionType = "create_single_hosting_pay_to_card_trade";
		//Tools.printData(userInfo);
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no", this.getOrderId());
		submitdata.put("out_trade_code", userInfo.get("type"));
		submitdata.put("collect_method", "binding_card^"+this.sinaUid(userInfo.get("uid"))+",UID,"+userInfo.get("tp_code"));
		submitdata.put("amount", Tools.getDoubleString(userInfo.get("money")));
		submitdata.put("summary", userInfo.get("info"));
		submitdata.put("goods_id", userInfo.get("borrow_id"));//标号
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		
		if("success".equals(resMap.get("df_res"))){
			//记录提现信息
			Connection conn = MySQL.getConnectionReadOnly(false);
			HashMap<String, Object> addWithdrawInfo = new HashMap<>();
			
			addWithdrawInfo.put("uid", userInfo.get("uid"));
			addWithdrawInfo.put("withdraw_status", 1);
			addWithdrawInfo.put("withdraw_money", submitdata.get("amount"));
			addWithdrawInfo.put("withdraw_fee", "0");
			addWithdrawInfo.put("t_tran_id", submitdata.get("out_trade_no"));
			addWithdrawInfo.put("add_time", Tools.getLongTime());
			addWithdrawInfo.put("add_ip", Tools.getClientIp());
			addWithdrawInfo.put("deal_time", Tools.getLongTime());
			addWithdrawInfo.put("deal_info", "提交成功，处理中");
			addWithdrawInfo.put("bank_name", this.getBankName(userInfo.get("bank_code")));
			addWithdrawInfo.put("withdraw_bank", userInfo.get("bank_code"));
			addWithdrawInfo.put("borrow_id", userInfo.get("borrow_id"));
			
			long newid=0l;
			try {
				newid = BaseDao.insert(conn, "withdraw", addWithdrawInfo);
				HashMap<String, String> moneyType=new HashMap<>();
				moneyType.put("account_money", "-");
				moneyType.put("money_freeze", "+");
				String withdrawRes = borrowAndInvest.memberMoneyLog(addWithdrawInfo.get("uid")+"", "34", DfMath.s2add(addWithdrawInfo.get("withdraw_money")+"",addWithdrawInfo.get("withdraw_fee")+"")+"", "提现冻结，提现订单号："+addWithdrawInfo.get("t_tran_id")+"", "", "", moneyType, conn);
				if("success".equals(withdrawRes)) MySQL.commit(conn);
				else MySQL.rollback(conn);
			} catch (Exception e) {
				MySQL.rollback(conn);
				logger.error("withdraw保存到数据库操作出错"+e.toString());
			}finally{
				MySQL.closeConnection(conn);
			}
			
		}
		resMap.put("ex_trade_no", submitdata.get("out_trade_no"));
		
		return resMap;
	}	
	public HashMap<String, Object> create_batch_hosting_pay_trade(HashMap<String, String>userInfo) {
		String actionType = "create_batch_hosting_pay_trade";
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_pay_no", this.getOrderId());
		submitdata.put("out_trade_code", userInfo.get("type"));
		submitdata.put("trade_list",userInfo.get("trade_list"));
		submitdata.put("notify_method","batch_notify");
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		
		return resMap;
	}

	public String buildTradeList(List<Map<String, String>> investorList) {
		String buildString="";
		for (Map<String, String> imap : investorList) {
			buildString+=this.getOrderId()+"~";
			buildString+=this.sinaUid(imap.get("uid"))+"~";
			buildString+="UID~";
			buildString+="SAVING_POT~";
			buildString+=Tools.getDoubleString(imap.get("money"))+"~";
			buildString+="~";
			//buildString+=this.sinaUid(imap.get("uid"))+"^UID^SAVING_POT^"+this.sinaUid(imap.get("borrower_id"))+"^UID^SAVING_POT^"+Tools.getDoubleString(imap.get("money"))+"^"+imap.get("borrow_id")+"号标复审通过"+"~";
			buildString+=imap.get("borrow_id")+"号标复审通过~";
			buildString+="$";
		}
		return buildString;
	}
	
	public HashMap<String, Object>  recharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv,HashMap<String, String>rechargeInfo) {
		String actionType = "create_hosting_deposit";
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no",this.getOrderId());
		submitdata.put("summary","帐户充值");
		submitdata.put("identity_id", this.sinaUid(rechargeInfo.get("id")));
		submitdata.put("identity_type","UID");
		submitdata.put("account_type","SAVING_POT");
		submitdata.put("amount",Tools.getDoubleString(rechargeInfo.get("money")));
		submitdata.put("user_fee","0.00");
		submitdata.put("pay_method",this.getPayParm("binding_pay",submitdata.get("amount"),rechargeInfo));//quick_pay成功一次以后就只能用安全卡binding_pay
		submitdata.put("return_url",this.getReturnUrl("recharge"));
		submitdata.put("notify_url",this.getNoticeUrl("recharge"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		//记录充值信息
		Connection conn = MySQL.getConnectionReadOnly(false);

		Map<String, Object> rechargeInfoSave= new HashMap<>();
		rechargeInfoSave.put("money",submitdata.get("amount"));
		rechargeInfoSave.put("fee", submitdata.get("user_fee"));
		rechargeInfoSave.put("status","0");
		rechargeInfoSave.put("uid",rechargeInfo.get("id"));
		rechargeInfoSave.put("add_time",Tools.getLongTime());
		rechargeInfoSave.put("add_ip",Tools.getClientIp());
		rechargeInfoSave.put("fee","0");
		rechargeInfoSave.put("nid",submitdata.get("out_trade_no"));
		rechargeInfoSave.put("way","sinaq");
		
		long newid=0l;
		try {
			newid = BaseDao.insert(conn, "recharge", rechargeInfoSave);
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("recharge保存到数据库操作出错"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}

		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		Map<String, Object> resJson = JSON.parseObject(httpRes.get("jsonStr"));
		
		HashMap<String, String> rechargeStatusMap = getRechargeStatus();
		resMap.put("ex_recharge_status", rechargeStatusMap.get(resJson.get("deposit_status")));
		resMap.put("ex_recharge_id", newid);
		resMap.put("ex_recharge_fee", rechargeInfoSave.get("fee"));
		resMap.put("ex_out_trade_no", rechargeInfoSave.get("nid"));
		resMap.put("ex_ticket", resJson.get("ticket"));
		return resMap;
	}

	private String getPayParm(String pay_method,String amount,HashMap<String, String>cardInfo) {
		String payString="";
		HttpServletRequest request=this.getRequest();
		PageData pd = new PageData(request);
		switch (pay_method) {
			case "online_bank"://网银付款
				String online_bank_bankid=pd.get("online_bank_bankid");
				String online_bank_card_type=pd.get("online_bank_card_type");
				String online_bank_card_attribute=pd.get("online_bank_card_attribute");
				payString=pay_method+"^"+amount+"^"+online_bank_bankid+","+online_bank_card_type+","+online_bank_card_attribute;
				break;
			case "quick_pay"://快捷付款
				String quick_pay_bankid=cardInfo.get("quick_pay_bankid");//银行代码
				String quick_pay_card_num=this.getSinaRas(cardInfo.get("quick_pay_card_num"));//银行卡号 RSA加密
				String quick_pay_kaihu_name=this.getSinaRas(cardInfo.get("quick_pay_kaihu_name"));//户名 RSA加密
				String quick_pay_card_type="DEBIT";//pd.get("quick_pay_card_type");//卡类型
				String quick_pay_card_attribute="C";//pd.get("quick_pay_card_attribute");//卡属性
				String quick_pay_phone=this.getSinaRas(cardInfo.get("quick_pay_phone"));//手机号 RSA加密
				payString=pay_method+"^"+amount+"^"+quick_pay_bankid+","+quick_pay_card_num+","+quick_pay_kaihu_name+","+quick_pay_card_type+","+quick_pay_card_attribute+","+","+","+quick_pay_phone+","+",";
				break;
			default://绑卡支付
				String binding_pay_card_id=cardInfo.get("binding_pay_card_id");
				payString=pay_method+"^"+amount+"^"+binding_pay_card_id;
				break;
		}
		return payString;
	}
	
	public HashMap<String, Object>  withdraw(HttpServletRequest request,HttpServletResponse response, ModelAndView mv,HashMap<String, String>withdrawInfo) {
		String actionType = "create_hosting_withdraw";
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no",this.getOrderId());
		submitdata.put("summary","会员提现");
		submitdata.put("identity_id", this.sinaUid(withdrawInfo.get("id")));
		submitdata.put("identity_type","UID");
		submitdata.put("account_type","SAVING_POT");
		submitdata.put("amount",DfMath.s2sub(Tools.getDoubleString(withdrawInfo.get("money")),"2")+"");
		submitdata.put("user_fee","2.00");
		submitdata.put("card_id", withdrawInfo.get("card_id"));
		submitdata.put("notify_url",this.getNoticeUrl("withdraw"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));

		HashMap<String, String> httpRes = this.create(actionType,submitdata,null);		
		HashMap<String, Object> resMap = this.dealRes(actionType,httpRes);
		Map<String, Object> resJson = JSON.parseObject(httpRes.get("jsonStr"));
		
		HashMap<String, String> rechargeStatusMap = getRechargeStatus();
		if("success".equals(resMap.get("df_res"))){
			//记录提现信息
			Connection conn = MySQL.getConnectionReadOnly(false);
			HashMap<String, Object> addWithdrawInfo = new HashMap<>();
			
			addWithdrawInfo.put("uid", withdrawInfo.get("id"));
			addWithdrawInfo.put("withdraw_status", 1);
			addWithdrawInfo.put("withdraw_money", submitdata.get("amount"));
			addWithdrawInfo.put("withdraw_fee", submitdata.get("user_fee"));
			addWithdrawInfo.put("t_tran_id", submitdata.get("out_trade_no"));
			addWithdrawInfo.put("add_time", Tools.getLongTime());
			addWithdrawInfo.put("add_ip", Tools.getClientIp());
			addWithdrawInfo.put("deal_time", Tools.getLongTime());
			addWithdrawInfo.put("deal_info", "提交成功，处理中");
			addWithdrawInfo.put("bank_name", this.getBankName(withdrawInfo.get("bank_code")));
			addWithdrawInfo.put("withdraw_bank", withdrawInfo.get("bank_code"));
			
			long newid=0l;
			try {
				newid = BaseDao.insert(conn, "withdraw", addWithdrawInfo);
				HashMap<String, String> moneyType=new HashMap<>();
				moneyType.put("account_money", "-");
				moneyType.put("money_freeze", "+");
				String withdrawRes = borrowAndInvest.memberMoneyLog(addWithdrawInfo.get("uid")+"", "34", DfMath.s2add(addWithdrawInfo.get("withdraw_money")+"",addWithdrawInfo.get("withdraw_fee")+"")+"", "提现冻结，提现订单号："+addWithdrawInfo.get("t_tran_id")+"", "", "", moneyType, conn);
				if("success".equals(withdrawRes)) MySQL.commit(conn);
				else MySQL.rollback(conn);
			} catch (Exception e) {
				MySQL.rollback(conn);
				logger.error("withdraw保存到数据库操作出错"+e.toString());
			}finally{
				MySQL.closeConnection(conn);
			}
			
		}

		return resMap;
	}
	
	private HashMap<String, Object> dealRes(String actionType,HashMap<String, String>httpRes) {
		HashMap<String, Object> resMap=  new HashMap<>();
		if("success".equals(httpRes.get("df_res"))){
			Map<String, Object> jsonCacheData= new HashMap<>();
			jsonCacheData = JSON.parseObject(httpRes.get("jsonStr"));
			HashMap<String, Object> logRes = this.LogInfoSave(actionType,jsonCacheData,httpRes.get("send_id"));
			resMap.put("send_id", httpRes.get("send_id"));
			if((boolean)logRes.get("res")==false){
				resMap.put("df_res", "error");
				resMap.put("df_msg", logRes.get("info"));
				//resMap.put("df_responseVo", httpRes);
			}else{
				resMap.put("df_res", "success");
				resMap.put("df_msg", "成功");
				resMap.put("df_logVo", logRes.get("logVo"));
				resMap.put("df_responseVo", httpRes);
			}
		}else{
			resMap.put("df_res", "error");
			resMap.put("df_msg", httpRes.get("df_msg"));
			resMap.put("http_info", httpRes.get("http_info"));
		}
		return resMap;
	}
	
	private HashMap<String, String> create(String actionType,HashMap<String, String> submitData,HashMap<String, String> localData) {
		HashMap<String, String>	resMap = new HashMap<>();
		List<String> orderMap=Arrays.asList("create_hosting_transfer","create_single_hosting_pay_to_card_trade","create_p2p_hosting_borrowing_target","create_hosting_deposit", "create_hosting_withdraw","create_hosting_collect_trade","advance_hosting_pay","create_batch_hosting_pay_trade","create_hosting_refund","create_single_hosting_pay_trade");
		String Url = (orderMap.contains(actionType))?this.getSubmitUrl(actionType):this.getSubmitUrl();
		
		submitData.put("service", actionType);
		submitData.put("request_time", Tools.TimeStamp2Date(Tools.getLongTime()+"","yyyyMMddHHmmss"));
		submitData.put("partner_id", this.getThirdPartyInfo("MerCustId"));
		submitData.put("_input_charset",  this.getThirdPartyInfo("CharSet"));
		submitData.put("sign_type",  "MD5");
		submitData.put("sign",this.getSign(submitData));
		try {
			for(Entry<String, String> entry:submitData.entrySet()){
				submitData.put(entry.getKey(), Tools.hrefEncode(entry.getValue()));
			}
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
			logger.error("提前参数ENCODE失败");
		}
		logger.info("提交的SUBMIT数据ＹＬＫ：：：："+submitData);

		String responseHtml = DfHttpClient.doPost(Url,submitData);
		try {
			responseHtml = Tools.hrefDecode(responseHtml);
			resMap.put("jsonStr", responseHtml);
			resMap.put("df_res", "success");
			logger.info("新浪接口返回文本:"+responseHtml);
		} catch (Exception e) {
			resMap.put("df_res", "error");
			resMap.put("df_msg", "http请求获取内容有误");
			resMap.put("http_info", responseHtml);
			logger.error("返回数据URLDECODE解析出错"+e.toString());
		}

		if(localData==null) localData=new HashMap<>();
		if(!localData.containsKey("OrdId")){
			if(submitData.containsKey("out_trade_no")) localData.put("OrdId", submitData.get("out_trade_no"));
			else if(submitData.containsKey("out_pay_no")) localData.put("OrdId", submitData.get("out_pay_no")); 
			else localData.put("OrdId", this.getOrderId());
		}
		
		long sendID = this.logSend(submitData, localData, actionType);
		resMap.put("send_id", sendID+"");	
		return resMap;
	}

}
