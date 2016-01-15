package com.dfp2p.core.admin.Borrow_repayment_user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.admin.User.AdminUserDao;
import com.dfp2p.core.admin.User_credit.AdminUser_creditService;
import com.dfp2p.core.tag.FormHelper;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.other.message.MessageManager;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.FormDataUtil;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AdminBorrow_repayment_userController extends BaseAdminController {
	public String tplPath = "Borrow_repayment_user";
	private static Log logger = LogFactory.getLog(AdminBorrow_repayment_userController.class);
	
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
		PageData pd = new PageData(request);
		//须还款金额
		WhereUtil wmpUtil=new WhereUtil();
		wmpUtil.getStringCondition("borrow_id", pd.get("borrow_id"));
		wmpUtil.getStringCondition("sort_order", pd.get("sort_order"));
		Map<String, String> investListData = BaseService.getOne("investor_detail", wmpUtil.getParamConditionList(), "sum(capital) as capital, sum(interest) as interest");
		double allRepaymentMoney = DfMath.s2add(investListData.get("capital"), investListData.get("interest"));

		Map<String, String> binfo = BaseService.getOne("borrow_info", Tools.BuildWhereMap("id", pd.get("borrow_id"), "="),"borrow_uid");
		
		HashMap<String, String> moneyType = new HashMap<>();
		moneyType.put("account_money", "+");
		String reString1 = borrowAndInvest.memberMoneyLog(binfo.get("borrow_uid"), "12", allRepaymentMoney+"", "还款逾期，垫付转入", "", "", moneyType);
		if(!"success".equals(reString1)) return   this.showTip(mv, "fail", "30", "代还金额转入操作失败"); 
		String repaymentRes = borrowAndInvest.borrowRepayment(pd.get("borrow_id"), pd.get("sort_order"));
		
		if("success".equals(repaymentRes)){
			
			HashMap<String, String> tradeInfo = new HashMap<>();
			tradeInfo.put("type", "1002");
			tradeInfo.put("info", pd.get("borrow_id")+"号标平台代还代收");
			tradeInfo.put("uid",tpset.getThirdPartyInfo("MerId"));//企业帐户
			tradeInfo.put("borrow_id", pd.get("borrow_id")+"");
			tradeInfo.put("money", Double.valueOf(allRepaymentMoney+"")+"");
			HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
			if("success".equals(tpRes.get("df_res"))) return  this.showTip(mv, "success", "30", "代还成功");
			else return  this.showTip(mv, "fail", "30", "代还操作成功，但商户托管余额可能不足，托管还款失败，请联系技术人员");
			
		}
		else return   this.showTip(mv, "fail", "30", "代还失败");
	}
}
