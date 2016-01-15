package com.dfp2p.core.home.Invest;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javassist.compiler.ast.Variable;

import javax.annotation.Resource;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.Tool;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.InterestCount;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.sun.jna.platform.win32.Netapi32Util.UserInfo;

@Controller
public class InvestController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(InvestController.class);
	public String tplPath = "Invest";
	
	@Resource(name="InvestService")
	private InvestService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, Object> borrowList = thisService.getBorrowList(pd, mv);
		Map<String, String> summary = thisService.getSummary();

		mv.addObject("summary", summary);
		mv.addObject("borrowList", borrowList);
		mv.addObject("currentTime", Tools.getLongTime());
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView invest_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		return this.index(request,response, mv);
	}
	
	public ModelAndView borrow(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		if(StringUtils.isBlank(pd.get("id"))){
			return this.showTip(mv, "error", "3", "数据有误");
		}else{
			mv.addObject("currentTime", Tools.getLongTime());
			try {			
				HashMap<String, Object> res = thisService.getBorrowInfo(pd, mv);
				HashMap<String, String> borrowInfo=new HashMap<>();
				if(res.containsKey("borrowInfo")){
					borrowInfo= (HashMap<String, String>)res.get("borrowInfo");
					mv.addObject("borrowInfo",borrowInfo);
					//序列化保存的内容
					HashMap<String, Object> deJsonMap = new HashMap<>();
					deJsonMap.put("img_type_1","");
					deJsonMap.put("img_type_2","");
					for (Entry<String, Object>entryMap : deJsonMap.entrySet()) {
						String keyString = entryMap.getKey();
						if(!Common.isBlankInMap(borrowInfo, keyString)) deJsonMap.put(keyString, (List<HashMap<String, String>>) JacksonUtil.listFromJson(borrowInfo.get(keyString)));
					}
//					Tools.printData(borrowInfo);
					mv.addObject("deJson", deJsonMap);
				}
				if(res.containsKey("investorList")){
					HashMap<String, Object> investorList= (HashMap<String, Object>)res.get("investorList");
					mv.addObject("investorList",investorList);
				}
				HashMap<String, String> UserInfo = Common.getUserLoginInfo();
				if(UserInfo!=null){
					HashMap<String, String> userMoneyInfo = borrowAndInvest.getUserMoneyIfo(UserInfo.get("id"));
					mv.addObject("userMoney", userMoneyInfo);
				}
				String tradingStartTime=("7".equals(borrowInfo.get("borrow_status"))||"6".equals(borrowInfo.get("borrow_status")))?borrowInfo.get("recheck_time"):Tools.getLongTime()+"";
				//还款计划
				HashMap<String, Object> repaymentPlan = InterestCount.InterestCounter(borrowInfo.get("borrow_money"), borrowInfo.get("borrow_duration"), borrowInfo.get("borrow_interest_rate"), borrowInfo.get("repayment_type"), tradingStartTime);
				List<Map<String, String>> repaymentList = ((List<Map<String, String>>)repaymentPlan.get("list"));
				String hasPayString="0";
				int totalSort=0;
				for (int i = 0; i < repaymentList.size(); i++) {
					Map<String	, String> thisRepayment = repaymentList.get(i);
					if(i<Integer.parseInt(borrowInfo.get("has_pay"))) {
						thisRepayment.put("has_repayment", thisRepayment.get("benxi"));
						thisRepayment.put("repayment_status", "已还款");
						thisRepayment.put("deadline", Tools.TimeStamp2Date(thisRepayment.get("endDate"), "yyyy-MM-dd"));
						hasPayString = DfMath.s2add(hasPayString, thisRepayment.get("benxi"))+"";
						totalSort++;
					}else{
						thisRepayment.put("has_repayment", "0");
						thisRepayment.put("repayment_status", "待还款");
						thisRepayment.put("deadline", Tools.TimeStamp2Date(thisRepayment.get("endDate"), "yyyy-MM-dd"));
					}
				}
				repaymentPlan.put("has_pay_money", hasPayString);
				repaymentPlan.put("has_pay_times",totalSort );
				repaymentPlan.put("left_pay_money",DfMath.s2sub(DfMath.s2add(repaymentPlan.get("all")+"",borrowInfo.get("borrow_money"))+"", hasPayString) );
				repaymentPlan.put("lxall", repaymentPlan.get("all"));
				mv.addObject("repaymentPlan", repaymentPlan);
				
				//if(!res.containsKey("borrowInfo"))  return this.showTip(mv, "error", "3", "数据有误");
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				logger.error("获取标的信息出错："+e.toString());
			}
			return this.getTplView(request,response, tplPath, mv);
		}
	}
	
	public ModelAndView investor_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, Object> investorList = new HashMap<>();
		try {
			investorList = thisService.getInvestorList(pd, mv);
			if(investorList!=null) mv.addObject("investorList",investorList.get("investorList"));
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			logger.error("获取投标数据出错"+e.toString());
		}
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView showinvest(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, Object> investorList = new HashMap<>();
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		if(userInfo==null){
			return this.getTplView(request,response, tplPath, mv);
		}
		//标别名
		Map<String, Object> BorrowTypeInfo = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		HashMap<String, Object> borrow_typeMap = Common.buildNewKVMap((Map<String, Object>) BorrowTypeInfo.get("type"), "key", "borrow_name");
		mv.addObject("borrow_typeMap",borrow_typeMap);
		
		Map<String, String> repayment_typeMap = Interface.getRepaymentTypeMap();
		mv.addObject("repayment_typeMap",repayment_typeMap);
		
		//传上来的金额
		mv.addObject("number", pd.post("number"));
				
		HashMap<String, Object> res;
		HashMap<String, String> borrowInfo = new HashMap<>();
		try {
			res = thisService.getBorrowInfo(pd, mv);
			if(res.containsKey("borrowInfo")){
				borrowInfo= (HashMap<String, String>)res.get("borrowInfo");
				mv.addObject("vo",borrowInfo);
				HashMap<String, String> borrowUserInfo= (HashMap<String, String>)res.get("borrowUserInfo");
				mv.addObject("vouser",borrowUserInfo);
				//计算利息
				//计算利息明细
				HashMap<String, Object> interestDetail  = InterestCount.InterestCounter("100", borrowInfo.get("borrow_duration"), borrowInfo.get("borrow_interest_rate"), borrowInfo.get("repayment_type"), borrowInfo.get("add_time"));
				mv.addObject("getInterest", interestDetail.get("all"));
				HashMap<String, String> userMoneyInfo = borrowAndInvest.getUserMoneyIfo(userInfo.get("id"));
				//Tools.printData(userInfo);
				mv.addObject("account_money", userMoneyInfo.get("account_money"));
				
			}
		} catch (Exception e) {
			logger.error("显示投标弹窗有错"+e.toString());
		}

		
		//券卡
		try {
			List<Map<String, String>> cardList = new ArrayList<>();
			if(!StringUtils.isBlank(borrowInfo.get("xtype")))  cardList = thisService.getCardList(pd, mv,borrowInfo.get("xtype"));
			logger.info("CARDLIST####################"+cardList);
			mv.addObject("cardList",cardList);
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			logger.error("获取卡券出错");
		}
		
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	
	public void investMoney(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		HashMap<String, Object> res = new HashMap<>();
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		try {
			res = thisService.getBorrowInfo(pd, mv);
		} catch (Exception e) {
			logger.error("投标获取数据出错"+e.toString());
			ajaxmsg("操作有误", 0, response);
			return;
		}
		HashMap<String, String> postInfo = new HashMap<>();
		postInfo.put("pin_pass",pd.post("pin_pass"));
		postInfo.put("is_confirm",pd.post("is_confirm"));
		postInfo.put("investMoney",pd.post("invest_money"));
		postInfo.put("borrow_pass",pd.post("borrow_pass"));
		postInfo.put("reward_money","0");
		postInfo.put("borrow_id",pd.post("borrow_id"));
		postInfo.put("card_id", pd.post("card_id"));
		postInfo.put("reward_money_post",pd.post("reward_money_use"));
		String ckReString="";
		String useRewardMoney="0";
		String allInvestMoney="0";
		if(res.containsKey("borrowInfo")){
			HashMap<String, String> borrowInfo= (HashMap<String, String>)res.get("borrowInfo");
			ckReString = investMoneyCheck(request,response,borrowInfo,postInfo);
			if("error".equals(ckReString)){
				//ajaxmsg("操作有误", 0, response);
				return ;
			}else{
				String[] investMoneyInfo = ckReString.split("\\|");
				useRewardMoney = investMoneyInfo[0];
				allInvestMoney = investMoneyInfo[1];
			}
		}
		
		
		if(DfMath.toIntValue(useRewardMoney)>0){
			//增加奖励金额，以备使用奖励金额投标时扣除[来源可能是现金券，体验金]
			HashMap<String, String> moneyType3=new HashMap<>();
			moneyType3.put("reward_money", "+");
			String moneyLogRes3= borrowAndInvest.memberMoneyLog(userInfo.get("id"), "50", useRewardMoney+"", "【"+postInfo.get("borrow_id")+"】号标借款标投，卡券金额转换", "", "", moneyType3);
			if(!"success".equals(moneyLogRes3)){
				ajaxmsg("卡券转换失败", 0, response);
				return ;
			};
		}
		
		Map<String, String> cardInfo = new HashMap<>();
		HashMap<String, Object> tpRes = new HashMap<>();
		if(!StringUtils.isBlank(postInfo.get("card_id"))&&!"0".equals(postInfo.get("card_id"))){
			cardInfo = BaseService.getOne("user_card", Tools.BuildWhereMap("id", postInfo.get("card_id"), "="), null);
		}
		if(cardInfo!=null&&cardInfo.size()>0&&"1".equals(cardInfo.get("type"))){
			tpRes.put("df_res", "success");
			tpRes.put("ex_trade_no", cardInfo.get("id"));
		}else{
			ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
			HashMap<String, String> tradeInfo = new HashMap<>();
			tradeInfo.put("type", "1001");
			tradeInfo.put("info", "投"+postInfo.get("borrow_id")+"号标");
			tradeInfo.put("uid", userInfo.get("id"));
			tradeInfo.put("borrow_id", postInfo.get("borrow_id"));
			tradeInfo.put("money", postInfo.get("investMoney"));
			tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
		}
		
		if("success".equals(tpRes.get("df_res"))){
			//保存addinfo信息
			HashMap<String, String> addInfo = new HashMap<>();
			addInfo.put("t_tran_id",tpRes.get("ex_trade_no")+"");
			String investRes = borrowAndInvest.investMoney(userInfo.get("id"), postInfo.get("borrow_id"), allInvestMoney, 0, Double.valueOf(DfMath.toIntValue(useRewardMoney)), addInfo);
			if(investRes.startsWith("success")){
				
				String[] investResA = investRes.split("\\|");
				String investorId = investResA[1];
				HashMap<String, Object> saveCard = new HashMap<>();
				saveCard.put("id", cardInfo.get("id"));
				if("4".equals(cardInfo.get("type"))){
					if(DfMath.s2add(cardInfo.get("use_money"),useRewardMoney)>=DfMath.toIntValue(cardInfo.get("affect_money"))) saveCard.put("status", "1");
					else  saveCard.put("status", "1");
				}
				else saveCard.put("status", "1");
				saveCard.put("target_id", investorId);
				saveCard.put("use_time", Tools.getLongTime());
				saveCard.put("target_num", postInfo.get("investMoney"));//使用的本金投标金额
				//加息券
				if("3".equals(cardInfo.get("type")))  saveCard.put("use_money", Tools.buildMapObject("exp","`affect_money`"));
				else saveCard.put("use_money",Tools.buildMapObject("exp","`use_money`+"+useRewardMoney));
				BaseService.upTable("user_card", saveCard, null);
				//被推荐人送红包
				Map<String, String> Recommend = BaseService.getOne("user", Tools.BuildWhereMap("id", userInfo.get("id"), "="), "recommend_id");
				if(!StringUtils.isBlank(Recommend.get("recommend_id")+"")){
					Connection conn = MySQL.getConnectionReadOnly(false);
					try {
						DataSet dts = T.load("borrow_investor", conn).W(Tools.BuildWhereMap("investor_uid", userInfo.get("id"), "=")).Q("count(id) as num");
						Map<String, String> cts = BeanMapUtils.dataSetToListMap(dts).get(0);
						if(DfMath.toIntValue(cts.get("num"))<2) Common.addUserCard(Recommend.get("recommend_id")+"", "4", "推荐会员送红包", "50", 0, 1, 1, conn);
						MySQL.commit(conn);
					} catch (Exception e) {
						MySQL.rollback(conn);
						logger.error("奖励推荐人出错"+e.toString());
					}finally{
						MySQL.closeConnection(conn);
					}
				}

				
				ajaxmsg("投标成功", 1, response);
				return ;
			}
			else{
				ajaxmsg(investRes, 0, response);
				return ;
			}
		}else{
			ajaxmsg(tpRes.get("df_msg")+"", 0, response);
			return;
		}
	}
	
	public String investMoneyCheck(HttpServletRequest request,HttpServletResponse response,HashMap<String, String> borrowInfo, HashMap<String, String>postInfo) {
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
		if(userInfo==null){
			ajaxmsg("请先登陆", 0, response);
			return "error";
		}
		HashMap<String, String> userMoneyInfo = borrowAndInvest.getUserMoneyIfo(userInfo.get("id"));
		double investMoney = DfMath.s2round(postInfo.get("investMoney"));
		String pin = postInfo.get("pin_pass");
		String borrow_id = postInfo.get("borrow_id");
		String cardID = postInfo.get("card_id");
		String amoney = postInfo.get("account_money");
		String reward_money_post = postInfo.get("reward_money_post");
		logger.info("REWAFE#####################"+userMoneyInfo.get("reward_money"));
		String reward_money_use= "0";//Common.isBlankInMap(userMoneyInfo, "reward_money")?"0":(DfMath.toIntValue(userMoneyInfo.get("reward_money"))>=DfMath.toIntValue(reward_money_post))?userMoneyInfo.get("reward_money"):reward_money_post;
		String need = borrowInfo.get("need");
		double canInvest = DfMath.s2sub(borrowInfo.get("borrow_money"),borrowInfo.get("has_borrow"));
		
		Map<String, String> cardInfo =  new HashMap<>();
		if(DfMath.toIntValue(cardID)>0){
			//使用限制
			try {
				cardInfo = thisService.getCardInfo(cardID);
				Common.getCardInfo(cardInfo);
			} catch (Exception e) {
				ajaxmsg("获取卡信息出错",0,response);
				return "error";
			}
			if(!cardInfo.get("uid").equals(userInfo.get("id"))){
				ajaxmsg("卡信息有误",0,response);
				return "error";
			}
			if(!"ALL".equals(cardInfo.get("borrow_type"))&&!"success".equals(tplCommon.ckbox(cardInfo.get("borrow_type"), borrowInfo.get("borrow_type"), "success"))){
				ajaxmsg("此卡券不能在当前产品使用",0,response);
				return "error";
			}
			if(DfMath.toIntValue(cardInfo.get("expired_time"))<Tools.getLongTime()){
				ajaxmsg("卡券已过期",0,response);
				return "error";
			}
			if(DfMath.toIntValue(cardInfo.get("useCondition"))>DfMath.toIntValue(investMoney+"")){
				ajaxmsg("使用此卡券必须满足自有资金投标金额大于"+cardInfo.get("useCondition"),0,response);
				return "error";
			}
			
			if("3".equals(cardInfo.get("type"))) reward_money_use="0";//加息券
			else reward_money_use=cardInfo.get("affect_money");//DfMath.toIntValue(cardInfo.get("affect_money"))>investMoney?investMoney:DfMath.s2round(cardInfo.get("affect_money"));

			if("4".equals(cardInfo.get("type"))){//红包
				double canuseR=DfMath.toIntValue(DfMath.multi(DfMath.s2multi(investMoney+"", cardInfo.get("useCondition")),0.01)+"");
				reward_money_use = (canuseR>DfMath.s2sub(cardInfo.get("affect_money"),cardInfo.get("use_money")))?(DfMath.s2sub(cardInfo.get("affect_money"),cardInfo.get("use_money"))+""):canuseR+"";
				if(DfMath.toIntValue(reward_money_use)<=0) reward_money_use="0";
			}

			if(DfMath.s2add(investMoney+"", reward_money_use)>canInvest){
				
				if("4".equals(cardInfo.get("type"))){

					investMoney = DfMath.s2div(canInvest+"", DfMath.s2add("1", DfMath.s2multi(cardInfo.get("useCondition"), "0.01")+"")+"", 0);
					reward_money_use = DfMath.s2round(DfMath.s2sub(canInvest+"",investMoney+"")+"")+"";
					//最终可使用奖励金额大于实际拥有奖励，则以实际拥有的为准
					if(DfMath.toIntValue(reward_money_use)>DfMath.s2sub(cardInfo.get("affect_money"),cardInfo.get("use_money"))){
						reward_money_use=DfMath.s2sub(cardInfo.get("affect_money"),cardInfo.get("use_money"))+"";
						investMoney = DfMath.s2sub(canInvest+"", reward_money_use+"");
					}
				}else{
					investMoney = DfMath.s2round(DfMath.s2sub(canInvest+"",reward_money_use)+"");
					if(DfMath.toIntValue(investMoney+"")<=0){
						reward_money_use = canInvest+"";
						investMoney=0;
					}					
				}
				
			}
		}
		//最终投标金额
		investMoney = DfMath.s2add(investMoney+"", reward_money_use);
		postInfo.put("reward_money", reward_money_use);
/*		if(!StringUtils.isBlank(investMoney+"")){
			ajaxmsg("最终投标金额"+investMoney,3,response);
			return "error";
		}
*/		if("1".equals(borrowInfo.get("xtype"))&&(StringUtils.isBlank(cardID)||!"1".equals(cardInfo.get("type")))){
			ajaxmsg("体验标只能用体验金投标",3,response);
			return "error";
		}
		if(investMoney>canInvest){
			ajaxmsg("剩余投标金额为"+canInvest+"元",3,response);
			return "error";
		}
		if(userInfo.get("id").equals(borrowInfo.get("borrow_uid"))){
			ajaxmsg("不能投自己的标",3,response);
			return "error";
		}
		if(!"2".equals(borrowInfo.get("borrow_status"))){
			ajaxmsg("借款标状态不对",3,response);
			return "error";
		}
		Map<String, String> userPass = BaseService.getOne("user", Tools.BuildWhereMap("id", userInfo.get("id"), "="), "pin_pass");
		if(StringUtils.isBlank(userPass.get("pin_pass"))){
			ajaxmsg("请先在帐户中心-安全中心 设置支付密码",3,response);
			return "error";
		}
		if(StringUtils.isBlank(pin)||!borrowAndInvest.userPassCreate(pin).equals(userPass.get("pin_pass"))){
			ajaxmsg("支付密码不正确",3,response);
			return "error";
		}

		if(!StringUtils.isBlank(borrowInfo.get("borrow_pass")) &&!borrowInfo.get("borrow_pass").equals(borrowAndInvest.md5(postInfo.get("borrow_pass")))){
			ajaxmsg("定向标密码错误，请重试",3,response);
			return "error";
		}
		if(Long.valueOf(borrowInfo.get("collect_time"))<Tools.getLongTime()){
			ajaxmsg("投标时间已结束",3,response);
			return "error";
		}

		if(Long.valueOf(borrowInfo.get("borrow_min"))>investMoney && Long.valueOf(borrowInfo.get("borrow_min"))>0){
			ajaxmsg("最小投标金额为"+borrowInfo.get("borrow_min"),3,response);
			return "error";
		}

		WhereUtil wmp = new WhereUtil();
		wmp.getStringCondition("investor_uid", userInfo.get("id"));
		wmp.getStringCondition("borrow_id", borrow_id);
		Map<String, String> hasInvest = BaseService.getOne("borrow_investor", wmp.getParamConditionList(), "sum(investor_capital) as totalMoney");
		double allHasInvest=0;
		if(hasInvest!=null){
			allHasInvest=DfMath.s2add(DfMath.toIntValue(hasInvest.get("totalMoney"))+"", investMoney+"");
		}else{
			allHasInvest=investMoney;
		}
		
		if(Long.valueOf(borrowInfo.get("borrow_max"))<allHasInvest && Long.valueOf(borrowInfo.get("borrow_max"))>0){
			ajaxmsg("本标单人最大投标金额为"+borrowInfo.get("borrow_max"),3,response);
			return "error";
		}
		
		double caninvest =DfMath.s2sub(need, borrowInfo.get("borrow_min"));
		if( investMoney>DfMath.s2round(need) && !DfMath.ss2round(need).equals(investMoney+"")  && DfMath.s2round(need)>=DfMath.s2round(borrowInfo.get("borrow_min"))){
			String msg = "尊敬的"+userInfo.get("user_name")+"，此标还差"+need+"元满标,如果您投标"+investMoney+"元，将导致最后一次投标最多只能投"+DfMath.s2sub(need,investMoney+"")+"元，小于最小投标金额"+borrowInfo.get("borrow_min")+"元，所以您本次可以选择<font color='#FF0000'>满标</font>或者投标金额必须<font color='#FF0000'>小于等于"+caninvest+"元</font>";
			if(caninvest<DfMath.s2round(borrowInfo.get("borrow_min"))){
				if(DfMath.toIntValue(need)<investMoney) msg="尊敬的"+userInfo.get("user_name")+"，此标还差"+need+"元满标,并且此标的最小投标金额是"+borrowInfo.get("borrow_min")+"，所以您只能满标";
				else msg = "尊敬的"+userInfo.get("user_name")+"，此标还差"+need+"元满标,如果您投标"+investMoney+"元，将导致最后一次投标最多只能投"+DfMath.s2sub(need,investMoney+"")+"元，小于最小投标金额"+borrowInfo.get("borrow_min")+"元，所以您本次可以选择<font color='#FF0000'>满标</font>即投标金额必须<font color='#FF0000'>等于"+need+"元</font>";
			}

			ajaxmsg(msg,3,response);
			return "error";
		}
		

		if(DfMath.toIntValue(investMoney+"")>DfMath.toIntValue(DfMath.s2add(reward_money_use, userMoneyInfo.get("account_money"))+"")){
			String msg = "尊敬的"+userInfo.get("user_name")+"，您准备投标"+investMoney+"元，但您的账户可用余额<br/>为"+userMoneyInfo.get("account_money")+"元，您要先去充值吗？";
			ajaxmsg(msg,2,response);
			return "error";
		}
		
		if("1".equals(postInfo.get("is_confirm"))){
			String msg = "尊敬的"+userInfo.get("user_name")+"，您的账户可用余额<br/>为"+userMoneyInfo.get("account_money")+"元，您确认投标"+investMoney+"元吗？";
			ajaxmsg(msg,4,response);
			return "error";
		}
		return reward_money_use+"|"+investMoney;
	}
	
	
}
