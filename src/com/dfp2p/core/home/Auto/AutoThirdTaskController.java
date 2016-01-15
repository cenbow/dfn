package com.dfp2p.core.home.Auto;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.border.EmptyBorder;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StopWatch.TaskInfo;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
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
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class AutoThirdTaskController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(AutoThirdTaskController.class);
	
	protected PageData getThisPageData(HttpServletRequest request,HttpServletResponse response) {
		PageData pd = new PageData(request);
		return pd;
	}
	
	public void task(HttpServletRequest request,HttpServletResponse response) {		
		PageData pd = this.getThisPageData(request, response);
		String taskId =  pd.get("task_id");
		
		DataSet taskListSet ;
		List<Map<String, String>> taskList = new ArrayList<>();
		Connection connt = MySQL.getConnectionReadOnly(true);
		try {
			taskListSet = T.load("thirdparty_task", connt).W(Tools.BuildWhereMap("status", "0", "=")).O("id ASC").L(0,10).Q(null);
			taskList = BeanMapUtils.dataSetToListMap(taskListSet);
		} catch (Exception e) {
			logger.error("查询任务出错");
			MySQL.closeConnection(connt);
			return ;
		}
		MySQL.closeConnection(connt);
	//$needDealTaskList=M('thirdparty_task')->where($map)->order("id ASC")->limit(10)->getField("id,id as taskid");	
		
		long taskSIZE = taskList.size();
		for (int i = 0; i < taskSIZE; i++) {
			
			Map<String,String> thisTask= taskList.get(i);
			String currendID = thisTask.get("id");
			Map<String, Object> taskInfo= new HashMap<>();
			taskInfo = JSON.parseObject(thisTask.get("send_info"));				
			
			switch (thisTask.get("type")) {
				case "1"://复审
				{
					Map<String, String> borrowInfo = new HashMap<>();
					Connection connt1 = MySQL.getConnectionReadOnly(true);
						try {
							DataSet borrowInfoDataSet = T.load("borrow_info b", connt1).W(Tools.BuildWhereMap("b.id", taskInfo.get("borrow_id")+"", "=")).Q("b.id,b.borrow_type,b.xtype,b.borrow_money,b.borrow_fee,b.borrow_uid");
							borrowInfo = BeanMapUtils.dataSetToListMap(borrowInfoDataSet).get(0);
						}catch (Exception e) {
							//e.printStackTrace();
							logger.error("查询标地信息出错"+e.toString());
							MySQL.closeConnection(connt1);
						}
						MySQL.closeConnection(connt1);
						
						ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();

						/*HashMap<String, String> approveMap=new HashMap<>();
						approveMap.put("type", "2001");
						approveMap.put("money", DfMath.s2sub(taskInfo.get("investor_capital")+"",taskInfo.get("use_reward_money")+"")+"");
						approveMap.put("in_uid", borrowInfo.get("borrow_uid")+"");
						approveMap.put("info", taskInfo.get("borrow_id")+"号标复审通过");
						HashMap<String, Object> intres = tpset.create_single_hosting_pay_trade(approveMap);*/
						
						
						//如果投标使用了奖金，则由商户帐户转给会员
						String addStr = "";
						HashMap<String, Object> apres = new HashMap<>();
						if(!"1".equals(borrowInfo.get("xtype"))&&DfMath.toIntValue(taskInfo.get("use_reward_money")+"")>0){
							HashMap<String, String> tradeInfo = new HashMap<>();
							tradeInfo.put("type", "1001");
							tradeInfo.put("info", taskInfo.get("borrow_id")+"号标奖励金额投标代收");
							tradeInfo.put("uid", tpset.getThirdPartyInfo("MerId"));//企业帐户
							tradeInfo.put("borrow_id", taskInfo.get("borrow_id")+"");
							tradeInfo.put("money", taskInfo.get("use_reward_money")+"");
							HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
							/*HashMap<String, String> approveMaps=new HashMap<>();
							approveMaps.put("type", "2002");
							approveMaps.put("money", taskInfo.get("use_reward_money")+"");
							approveMaps.put("in_uid", borrowInfo.get("borrow_uid")+"");
							approveMaps.put("info", taskInfo.get("borrow_id")+"号标奖励金额投标");
							apres = tpset.create_single_hosting_pay_trade(approveMaps);

							if("success".equals(apres.get("df_res"))) addStr="奖金代付成功";
							else addStr="奖励代付失败"+apres.get("df_msg");*/
							if("success".equals(tpRes.get("df_res"))) addStr+="奖金代收成功";
							else addStr+="奖励代收失败"+tpRes.get("df_msg");
							
						}
						HashMap<String, Object> resU = new HashMap<>();
						if("1".equals(taskInfo.get("is_last"))){
							if(DfMath.s2round(borrowInfo.get("borrow_fee"))>0){
									HashMap<String, String> approveMap1=new HashMap<>();
									approveMap1.put("type", "2001");
									approveMap1.put("money", borrowInfo.get("borrow_fee"));
									approveMap1.put("in_uid",tpset.getThirdPartyInfo("MerId"));
									approveMap1.put("info", taskInfo.get("borrow_id")+"号借款管理费");
									HashMap<String, Object> apresfee = tpset.create_single_hosting_pay_trade(approveMap1);
									//return "success";
									if("success".equals(apresfee.get("df_res"))) addStr+="借款管理费成功";
									else addStr+="借款管理费失败"+apresfee.get("df_msg");
							}
							//复审同时提现,代付到卡
							WhereUtil mx=new WhereUtil();
							mx.getStringCondition("uid", borrowInfo.get("borrow_uid"));
							mx.getStringCondition("card_type", "q");
							Map<String, String> userCard = BaseService.getOne("user_banks", mx.getParamConditionList(), null);
							
							HashMap<String, String> userInfo = new HashMap<>();
							userInfo.put("type", "2001");
							userInfo.put("uid", borrowInfo.get("borrow_uid"));
							userInfo.put("tp_code", userCard.get("tp_code"));
							userInfo.put("money", DfMath.s2sub(borrowInfo.get("borrow_money"),borrowInfo.get("borrow_fee"))+"");
							userInfo.put("info", borrowInfo.get("id")+"号借款提现");
							userInfo.put("borrow_id", borrowInfo.get("id"));
							userInfo.put("bank_code", userCard.get("bank_name"));
							ThirdpartyTpsetController tpsetController = new ThirdpartyTpsetController();
							resU = tpsetController.create_single_hosting_pay_to_card_trade(request, response, userInfo);
							if(!"success".equals(resU.get("df_res")))		addStr+="代付到卡提现错误:"+resU.get("df_msg");
							else 		addStr+="代付到卡提现成功:"+resU.get("df_msg");
					}
						
						
					Connection conn = MySQL.getConnectionReadOnly(false);
					try{
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status",(StringUtils.isBlank(addStr)||"success".equals(resU.get("df_res"))?"1":"2"));
						save.put("info",(resU.containsKey("http_info"))?(resU.get("df_msg")+""+resU.get("http_info")+addStr):resU.get("df_msg")+addStr);
						save.put("send_id",(Common.isBlankInMap(resU, "send_id")?"0":resU.get("send_id")));
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						BaseDao.update(conn, "thirdparty_task", save, null);
						MySQL.commit(conn);
					} catch (Exception e) {
						//e.printStackTrace();
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status","3");
						save.put("info",addStr+"过程出错："+e.toString());
						save.put("send_id","0");
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						try {
							BaseDao.update(conn, "thirdparty_task", save, null);
							MySQL.commit(conn);
						} catch (Exception e1) {
							logger.error("出错后保存发送数据出错"+e.toString());
							MySQL.rollback(conn);
						}
					}finally{
						MySQL.closeConnection(conn);
					}
				}
				break;
				case "2"://流标
				{
					ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
					Map<String, String> thisMap = BaseService.getOne("borrow_investor", Tools.BuildWhereMap("t_tran_id", taskInfo.get("t_tran_id")+"", "="), "borrow_id,investor_capital,use_reward_money");
					HashMap<String, String> refuseMap=new HashMap<>();
					refuseMap.put("tran_id", taskInfo.get("t_tran_id")+"");
					refuseMap.put("money", DfMath.s2sub(thisMap.get("investor_capital")+"",thisMap.get("use_reward_money"))+"");
					refuseMap.put("info", thisMap.get("borrow_id")+"号标复审未通过");
					HashMap<String, Object> apres = tpsetController.create_hosting_refund(refuseMap);

					Connection conn1 = MySQL.getConnectionReadOnly(false);
					try{
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status",("success".equals(apres.get("df_res"))?"1":"2"));
						save.put("info",((apres.containsKey("http_info"))?(apres.get("df_msg")+""+apres.get("http_info")):apres.get("df_msg")));
						save.put("send_id",(Common.isBlankInMap(apres, "send_id")?"0":apres.get("send_id")));
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						BaseDao.update(conn1, "thirdparty_task", save, null);
						MySQL.commit(conn1);
					} catch (Exception e) {
						//e.printStackTrace();
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status","3");
						save.put("info","过程出错："+e.toString());
						save.put("send_id","0");
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						try {
							BaseDao.update(conn1, "thirdparty_task", save, null);
							MySQL.commit(conn1);
						} catch (Exception e1) {
							logger.error("出错后保存发送数据出错"+e.toString());
							MySQL.rollback(conn1);
						}
					}finally{
						MySQL.closeConnection(conn1);
					}
				}
				break;
				case "3"://还款
				{
						Map<String, String> investInfo = new HashMap<>();
						Connection connt11 = MySQL.getConnectionReadOnly(true);
						try {
							DataSet investInfoDataSet = T.load("borrow_investor i", connt11).W(Tools.BuildWhereMap("i.id", taskInfo.get("invest_id")+"", "=")).Q("i.{order_id,borrow_uid,borrow_id,order_date,investor_uid,use_reward_money,t_tran_id}");
							investInfo = BeanMapUtils.dataSetToListMap(investInfoDataSet).get(0);
						}catch (Exception e) {
							MySQL.closeConnection(connt11);
						}

						ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
						HashMap<String, String> approveMap=new HashMap<>();
						approveMap.put("type", "2002");
						approveMap.put("in_uid", investInfo.get("investor_uid")+"");
						approveMap.put("info", investInfo.get("borrow_id")+"号标还款");
						if(Double.valueOf(taskInfo.get("b_m")+"")>0){
							approveMap.put("money", Tools.getDoubleString(DfMath.s2sub(DfMath.s2add(taskInfo.get("capital")+"",taskInfo.get("interest")+"")+"",taskInfo.get("b_m")+"")+"")+"");
						}else{					
							approveMap.put("money", DfMath.s2add(taskInfo.get("capital")+"",taskInfo.get("interest")+"")+"");
						}
						if(DfMath.s2round(taskInfo.get("interest_fee")+"")>0){
							approveMap.put("fz_id", tpset.getThirdPartyInfo("MerId"));
							approveMap.put("fz_money", taskInfo.get("interest_fee")+"");
							approveMap.put("fz_info", investInfo.get("borrow_id")+"号标利息管理费");
						}
						HashMap<String, Object> apres = tpset.create_single_hosting_pay_trade(approveMap);
						
						
						//如果有会员等级加息
						HashMap<String, Object> res2 = new HashMap<>();
						String addStr1="";
						if(Double.valueOf(taskInfo.get("a_m")+"")>0){

							HashMap<String, String> tradeInfo = new HashMap<>();
							tradeInfo.put("type", "1002");
							tradeInfo.put("info", taskInfo.get("borrow_id")+"号标会员等级加息代收");
							tradeInfo.put("uid",tpset.getThirdPartyInfo("MerId"));//企业帐户
							tradeInfo.put("borrow_id", investInfo.get("borrow_id")+"");
							tradeInfo.put("money", Double.valueOf(taskInfo.get("a_m")+"")+"");
							HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
							HashMap<String, String> approveMap1=new HashMap<>();
							approveMap1.put("type", "2002");
							approveMap1.put("money", Double.valueOf(taskInfo.get("a_m")+"")+"");
							approveMap1.put("in_uid", investInfo.get("investor_uid")+"");
							approveMap1.put("info", investInfo.get("borrow_id")+"号标会员等级加息发放");
							apres = tpset.create_single_hosting_pay_trade(approveMap1);

							if("success".equals(apres.get("df_res"))) addStr1="等级加息代付成功";
							else addStr1="等级加息代付失败"+apres.get("df_msg");
							if("success".equals(tpRes.get("df_res"))) addStr1+="等级加息代收成功";
							else addStr1+="等级加息代收失败"+tpRes.get("df_msg");
						}						
						
						Connection conn1 = MySQL.getConnectionReadOnly(false);
						try{
							HashMap<String, Object> save = new HashMap<>();
							save.put("id",currendID);
							save.put("status",("success".equals(apres.get("df_res"))?"1":"2"));
							save.put("info",((apres.containsKey("http_info"))?(apres.get("df_msg")+""+apres.get("http_info")):apres.get("df_msg"))+addStr1);
							save.put("send_id",(Common.isBlankInMap(apres, "send_id")?"0":apres.get("send_id")));
							save.put("send_time",Tools.getLongTime());
							save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
							BaseDao.update(conn1, "thirdparty_task", save, null);
							MySQL.commit(conn1);
						} catch (Exception e) {
							//e.printStackTrace();
							HashMap<String, Object> save = new HashMap<>();
							save.put("id",currendID);
							save.put("status","3");
							save.put("info","过程出错："+e.toString());
							save.put("send_id","0");
							save.put("send_time",Tools.getLongTime());
							save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
							try {
								BaseDao.update(conn1, "thirdparty_task", save, null);
								MySQL.commit(conn1);
							} catch (Exception e1) {
								logger.error("出错后保存发送数据出错"+e.toString());
								MySQL.rollback(conn1);
							}
						}finally{
							MySQL.closeConnection(conn1);
						}
				}
				break;
				case "11"://加息券
					Map<String, String> investorInfo1=new HashMap<>();
					Connection connt111 = MySQL.getConnectionReadOnly(true);
						try {
							DataSet investorInfoDataSet = T.load("user", connt111).W(Tools.BuildWhereMap("id", taskInfo.get("investor")+"", "=")).Q("third_account");
							investorInfo1 = BeanMapUtils.dataSetToListMap(investorInfoDataSet).get(0);
						}catch (Exception e) {
							logger.error("查询标地信息出错"+e.toString());
							MySQL.closeConnection(connt111);
						}
						MySQL.closeConnection(connt111);

						ThirdpartyTpsetController tpset1 = new ThirdpartyTpsetController();
					//加息券直接奖励现金
					HashMap<String, Object> res11 = new HashMap<>();
					HashMap<String, Object> apres1 = new HashMap<>();
					if(Double.valueOf(taskInfo.get("r_m")+"")>0){

						HashMap<String, String> tradeInfo = new HashMap<>();
						tradeInfo.put("type", "1002");
						tradeInfo.put("info", "号标加息券发放");
						tradeInfo.put("uid",tpset1.getThirdPartyInfo("MerId"));//企业帐户
						//tradeInfo.put("borrow_id", taskInfo.get("borrow_id")+"");
						tradeInfo.put("money", Double.valueOf(taskInfo.get("r_m")+"")+"");
						HashMap<String, Object> tpRes = tpset1.create_hosting_collect_trade(request, response, tradeInfo);
						HashMap<String, String> approveMap1=new HashMap<>();
						approveMap1.put("type", "2002");
						approveMap1.put("money", Double.valueOf(taskInfo.get("r_m")+"")+"");
						approveMap1.put("in_uid", taskInfo.get("investor")+"");
						approveMap1.put("info", taskInfo.get("borrow_id")+"号标加息券发放");
						apres1 = tpset1.create_single_hosting_pay_trade(approveMap1);

						String addStr1="";
						if("success".equals(apres1.get("df_res"))) addStr1="加息券代付成功";
						else addStr1="加息券发放代付失败"+apres1.get("df_msg");
						if("success".equals(tpRes.get("df_res"))) addStr1+="加息券代收成功";
						else addStr1+="加息券代收失败"+tpRes.get("df_msg");
					}

					Connection conn11 = MySQL.getConnectionReadOnly(false);
					try{
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status",("success".equals(apres1.get("df_res"))?"1":"2"));
						save.put("info",((apres1.containsKey("http_info"))?(apres1.get("df_msg")+""+apres1.get("http_info")):apres1.get("df_msg")));
						save.put("send_id",(Common.isBlankInMap(apres1, "send_id")?"0":apres1.get("send_id")));
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						BaseDao.update(conn11, "thirdparty_task", save, null);
						MySQL.commit(conn11);
					} catch (Exception e) {
						//e.printStackTrace();
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status","3");
						save.put("info","过程出错："+e.toString());
						save.put("send_id","0");
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						try {
							BaseDao.update(conn11, "thirdparty_task", save, null);
							MySQL.commit(conn11);
						} catch (Exception e1) {
							logger.error("出错后保存发送数据出错"+e.toString());
							MySQL.rollback(conn11);
						}
					}finally{
						MySQL.closeConnection(conn11);
					}
				break;
				case "12"://债权转让
					Map<String, String> investorInfo12=new HashMap<>();
					Connection connt12 = MySQL.getConnectionReadOnly(true);
						try {
							DataSet investorInfoDataSet = T.load("user", connt12).W(Tools.BuildWhereMap("id", taskInfo.get("receiver")+"", "=")).Q("third_account");
							investorInfo12 = BeanMapUtils.dataSetToListMap(investorInfoDataSet).get(0);
						}catch (Exception e) {
							logger.error("查询承接人信息出错"+e.toString());
							MySQL.closeConnection(connt12);
						}
						MySQL.closeConnection(connt12);

						ThirdpartyTpsetController tpsetController12 = new ThirdpartyTpsetController();
						List<HashMap<String, String>>borrowDetail12 = new ArrayList<>();
						HashMap<String, String> thisBorrower12 = new HashMap<>();
						thisBorrower12.put("DivCustId", tpsetController12.getThirdPartyInfo("MerId"));
						thisBorrower12.put("DivAcctId", tpsetController12.getMerAccountType("fee_in"));
						thisBorrower12.put("DivAmt", Tools.getDoubleString(taskInfo.get("interest_fee")+""));
						borrowDetail12.add(thisBorrower12);
						
						HashMap<String, String> repaymentInfo12 =  new HashMap<>();
						repaymentInfo12.put("SubOrdId",taskInfo.get("o_i")+"");
						repaymentInfo12.put("SubOrdDate",taskInfo.get("o_d")+"");
						repaymentInfo12.put("InCustId",investorInfo12.get("third_account"));
						repaymentInfo12.put("OutCustId",taskInfo.get("borrower")+"");
						repaymentInfo12.put("TransAmt",Tools.getDoubleString(DfMath.s2add(taskInfo.get("capital")+"",taskInfo.get("interest")+"")+""));
						repaymentInfo12.put("Fee",Tools.getDoubleString(taskInfo.get("interest_fee")+""));

						repaymentInfo12.put("DivDetails",(Double.valueOf(repaymentInfo12.get("Fee")+"")>0)?JSON.toJSONString(borrowDetail12):"");
						HashMap<String, Object> res12 = null;//tpsetController12.repayment(request, response, repaymentInfo12);

					Connection conn12 = MySQL.getConnectionReadOnly(false);
					try{
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status",("success".equals(res12.get("df_res"))?"1":"2"));
						save.put("info",((res12.containsKey("http_info"))?(res12.get("df_msg")+""+res12.get("http_info")):res12.get("df_msg")));
						save.put("send_id",(Common.isBlankInMap(res12, "send_id")?"0":res12.get("send_id")));
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						BaseDao.update(conn12, "thirdparty_task", save, null);
						MySQL.commit(conn12);
					} catch (Exception e) {
						//e.printStackTrace();
						HashMap<String, Object> save = new HashMap<>();
						save.put("id",currendID);
						save.put("status","3");
						save.put("info","过程出错："+e.toString());
						save.put("send_id","0");
						save.put("send_time",Tools.getLongTime());
						save.put("run_times",Tools.buildMapObject("exp","`run_times`+1"));
						try {
							BaseDao.update(conn12, "thirdparty_task", save, null);
							MySQL.commit(conn12);
						} catch (Exception e1) {
							logger.error("出错后保存发送数据出错"+e.toString());
							MySQL.rollback(conn12);
						}
					}finally{
						MySQL.closeConnection(conn12);
					}
				break;
				default:
				break;
			}
			String showString = Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyy-MM-dd HH:mm:ss");
			response.setContentType("text/html;charset=UTF-8");
			try {
				response.getOutputStream().write(showString.getBytes("UTF-8"));
				response.getOutputStream().close();
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			
		}
		
	}	
	
	
}
