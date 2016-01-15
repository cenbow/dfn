package com.dfp2p.core.thirdparty;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.Tool;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.mrbean.BeanUtil;
import org.springframework.orm.hibernate3.LocalDataSourceConnectionProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseThirdpartyController;
import com.dfp2p.core.home.Borrow.BorrowController;
import com.dfp2p.core.home.Transfer.TransferService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.lowagie.text.xml.xmp.PdfA1Schema;
import com.mchange.v1.db.sql.DriverManagerDataSource.DmdsObjectFactory;
import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

@Controller
public class ThirdpartyTpsendController extends BaseThirdpartyController {
	private static Log logger = LogFactory.getLog(ThirdpartyTpsendController.class);
	@Resource(name="TransferService")
	private TransferService tranService;
	
	public ModelAndView recharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String actionType = "create_hosting_deposit";
		PageData pd = new PageData(request);
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("out_trade_no",this.getOrderId());
		submitdata.put("summary","帐户充值");
		submitdata.put("identity_id", this.sinaUid(userInfo.get("id")));
		submitdata.put("identity_type","UID");
		submitdata.put("account_type","SAVING_POT");
		submitdata.put("amount",Tools.getDoubleString(pd.get("t_money")));
		submitdata.put("user_fee","0.00");
		submitdata.put("pay_method",this.getPayParm("online_bank",submitdata.get("amount")));
		submitdata.put("return_url",this.getReturnUrl("recharge"));
		submitdata.put("notify_url",this.getNoticeUrl("recharge"));
		submitdata.put("version",  this.getThirdPartyInfo("Version"));
		//记录充值信息
		Map<String, String> vo = new HashMap<>();
		Connection conn = MySQL.getConnectionReadOnly(false);

		Map<String, Object> rechargeInfoSave= new HashMap<>();
		rechargeInfoSave.put("money",submitdata.get("amount"));
		rechargeInfoSave.put("fee", submitdata.get("user_fee"));
		rechargeInfoSave.put("status","0");
		rechargeInfoSave.put("uid",userInfo.get("id"));
		rechargeInfoSave.put("add_time",Tools.getLongTime());
		rechargeInfoSave.put("add_ip",Tools.getClientIp());
		rechargeInfoSave.put("fee","0");
		rechargeInfoSave.put("nid",submitdata.get("out_trade_no"));
		rechargeInfoSave.put("way","sinaw");
		
		try {
			Long newid = BaseDao.insert(conn, "recharge", rechargeInfoSave);
			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("recharge保存到数据库操作出错"+e.toString());
		}finally{
			MySQL.closeConnection(conn);
		}
		
		this.create(actionType,submitdata,null,mv);
		return mv;
	}
	
	private String getPayParm(String pay_method,String amount) {
		String payString="";
		HttpServletRequest request=this.getRequest();
		PageData pd = new PageData(request);
		switch (pay_method) {
			case "online_bank"://网银付款
				String online_bank_bankid=pd.get("online_bank_bankid");
				String online_bank_card_type="DEBIT";
				String online_bank_card_attribute="C";
				payString=pay_method+"^"+amount+"^"+online_bank_bankid+","+online_bank_card_type+","+online_bank_card_attribute;
				break;
			case "quick_pay"://快捷付款
				String quick_pay_bankid=pd.get("quick_pay_bankid");//银行代码
				String quick_pay_card_num=this.getSinaRas(pd.get("quick_pay_card_num"));//银行卡号 RSA加密
				String quick_pay_kaihu_name=this.getSinaRas(pd.get("quick_pay_kaihu_name"));//户名 RSA加密
				String quick_pay_card_type=pd.get("quick_pay_card_type");//卡类型
				String quick_pay_card_attribute=pd.get("quick_pay_card_attribute");//卡属性
				String quick_pay_phone=this.getSinaRas(pd.get("quick_pay_phone"));//手机号 RSA加密
				payString=pay_method+"^"+amount+"^"+quick_pay_bankid+","+quick_pay_card_num+","+quick_pay_kaihu_name+","+quick_pay_card_type+","+quick_pay_card_attribute+","+","+","+quick_pay_phone+","+",";
				break;
			default://绑卡支付
				String binding_pay_card_id=pd.get("binding_pay_card_id");
				payString=pay_method+"^"+amount+"^"+binding_pay_card_id;
				break;
		}
		return payString;
	}

	private ModelAndView create(String actionType,HashMap<String, String> submitData,HashMap<String, String> localData,ModelAndView mv) {
		String Url = this.getSubmitUrl("mas");
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

		mv.addObject("submitUrl",Url);
		mv.addObject("submitData",submitData);	
		mv.setViewName("/Home/Common/tpsend");
		if(localData==null) localData=new HashMap<>();
		if(!localData.containsKey("OrdId")){
			if(submitData.containsKey("out_trade_no")) localData.put("OrdId", submitData.get("out_trade_no"));
			else localData.put("OrdId", this.getOrderId());
		}
		this.logSend(submitData, localData, actionType);
		return mv;
	}
	
}
