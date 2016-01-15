package com.dfp2p.core.home.ftp;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.Tool;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTPFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.member.Contract.MemberContractService;
import com.dfp2p.core.thirdparty.CommonFun;
import com.dfp2p.core.thirdparty.ThirdpartyTpqueryController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.other.message.SendToPhone;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;
import com.dfp2p.util.ftp.FTPException;
import com.dfp2p.util.ftp.FTPManager;
import com.dfp2p.util.ftp.FTPFileContext;


@Controller
public class FtpController extends BaseHomeController {
	private static Log log = LogFactory.getLog(FtpController.class);
	public String tplPath = "Ftp";
	@Resource(name="memberContractService")
	private MemberContractService thisService;

	public void testmsg(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		SendToPhone.sendSMS("测试短信", "15802785814");
	}
	public void errori(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		//保存addinfo信息
/*		HashMap<String, String> addInfo = new HashMap<>();
		addInfo.put("t_tran_id","20150819141420000319");
		String investRes = borrowAndInvest.investMoney("1836", "387", "500.00", 0, 0, addInfo);
		this.ajaxmsg(investRes, 1, response);
*/	}
	
	public void listacc(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Connection conn = MySQL.getConnectionReadOnly(true);
		DataSet sd;
		try {
			sd = T.load("user_count", conn).W(Tools.BuildWhereMap("uid", "0", ">")).O("uid asc").Q(null);
			List<Map<String, String>> lis = BeanMapUtils.dataSetToListMap(sd);
			ThirdpartyTpqueryController tpq = new ThirdpartyTpqueryController();
			HashMap<String, Object> xme=new LinkedHashMap<>();
			for (Map<String, String> map : lis) {
				//查询余额
				HashMap<String, String> inHashMap = new HashMap<>();
				inHashMap.put("account_type", "SAVING_POT");//SAVING_POT
				inHashMap.put("id", map.get("uid"));
				HashMap<String, Object> RES = tpq.query_balance(request, response, inHashMap);
				RES.put("uid", map.get("uid"));
				xme.put(map.get("uid"), RES.get("ex_account_money"));
				//this.ajaxmsg(RES, response);
			}
			this.ajaxmsg(xme, response);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		MySQL.closeConnection(conn);
	}
	
	
	@SuppressWarnings("unchecked")
	public void testnew(HttpServletRequest request, HttpServletResponse response, ModelAndView mv){
		PageData pd = new PageData(request);
		HashMap<String, String> inHashMap=new HashMap<>();
		inHashMap.put("account_type", pd.get("type"));
		inHashMap.put("id", pd.get("id"));
		ThirdpartyTpqueryController tpq = new ThirdpartyTpqueryController();
		HashMap<String, Object> sfee = tpq.query_balance(request, response, inHashMap);
		this.echoJson(sfee, response);/**/
	}
	public void testner(HttpServletRequest request, HttpServletResponse response, ModelAndView mv){
		/*PageData pd = new PageData(request);
		HashMap<String, String> inHashMap=new HashMap<>();
		inHashMap.put("money", "100");
		inHashMap.put("uid", "1732");
		ThirdpartyTpsetController tpq = new ThirdpartyTpsetController();
		HashMap<String, Object> sfee = tpq.create_hosting_transfer(inHashMap);
		this.echoJson(sfee, response);	*/
	}
	public void ckDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		ThirdpartyTpqueryController tpqueryController=new ThirdpartyTpqueryController();
		HashMap<String, String>	userInfo = new HashMap<>();
		userInfo.put("id", pd.get("uid"));
		userInfo.put("account_type", pd.get("account_type"));
		userInfo.put("start_time", pd.get("start_time"));
		userInfo.put("end_time", pd.get("end_time"));
		HashMap<String, Object> res = tpqueryController.query_account_details(request, response, userInfo);
		this.echoJson(res, response);
		//ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
	}
	public void hk(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		/*ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
	
		HashMap<String, String> addMp=new HashMap<>();
		//addMp.put("1626", "3");
		addMp.put("1732", "100");
		//addMp.put("2009", "2");
		for(Entry<String, String>et:addMp.entrySet()){
			String uidString=et.getKey();
			String moneyString=et.getValue();
			HashMap<String, String> tradeInfo = new HashMap<>();
			tradeInfo.put("type", "1002");
			tradeInfo.put("info", "测试数据调整");
			tradeInfo.put("uid", uidString);
			tradeInfo.put("borrow_id", "1");
			tradeInfo.put("money", moneyString+"");
			HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
			this.echoJson(tpRes, response);
		}
		HashMap<String, String> approveMap1=new HashMap<>();
		approveMap1.put("type", "2002");
		approveMap1.put("money", "100");
		approveMap1.put("in_uid", "6465");
		approveMap1.put("info", "1732-6465会员网银充值转");
		HashMap<String, Object> apress = tpset.create_single_hosting_pay_trade(approveMap1);
		this.echoJson(apress, response);*/
/*	
	//托管还款
	HashMap<String, String> userInfo = Common.getUserLoginInfo();
	WhereUtil wmpUtil=new WhereUtil();
	wmpUtil.getStringCondition("borrow_id", "342");
	wmpUtil.getStringCondition("sort_order", "1");
	Map<String, String> investListData = BaseService.getOne("investor_detail", wmpUtil.getParamConditionList(), "sum(capital) as capital, sum(interest) as interest");
	double allRepaymentMoney = DfMath.s2add(investListData.get("capital"), investListData.get("interest"));
	HashMap<String, String> tradeInfo = new HashMap<>();
	tradeInfo.put("type", "1002");
	tradeInfo.put("info", "342号标第1期还款");
	tradeInfo.put("uid", "1626");
	tradeInfo.put("borrow_id", "342");
	tradeInfo.put("money", allRepaymentMoney+"");
	ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
	HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
	//托管还款
*/	}
	
	
	public void rfDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		ThirdpartyTpqueryController tpqueryController=new ThirdpartyTpqueryController();
		HashMap<String, String>	userInfo = new HashMap<>();
		userInfo.put("id", pd.get("uid"));
		userInfo.put("start_time", pd.get("start_time"));
		userInfo.put("end_time", pd.get("end_time"));
		HashMap<String, Object> res = tpqueryController.query_hosting_refund(request, response, userInfo);
		this.echoJson(res, response);
		//ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws Exception {
		ThirdpartyTpsetController tpset=new ThirdpartyTpsetController();
		/*HashMap<String, String> tradeInfo = new HashMap<>();
		tradeInfo.put("type", "1002");
		tradeInfo.put("info", "332号标借款管理费代收");
		tradeInfo.put("uid", "121");//企业帐户
		tradeInfo.put("borrow_id", "332");
		tradeInfo.put("money", "100");
		HashMap<String, Object> tpRess = tpset.create_hosting_collect_trade(request, response, tradeInfo);

		this.echoJson(tpRess, response);
		if("success".equals(tpRess.get("df_res"))){
			HashMap<String, String> approveMap1=new HashMap<>();
			approveMap1.put("type", "2002");
			approveMap1.put("money", "100");
			approveMap1.put("in_uid",tpset.getThirdPartyInfo("MerId"));
			approveMap1.put("info", "332号借款管理费");
			HashMap<String, Object> apresfee = tpset.create_single_hosting_pay_trade(approveMap1);
			//return "success";
			this.echoJson(apresfee, response);
		}*/
		//if("success".equals(tpRess.get("df_res"))){
/*			HashMap<String, String> approveMap1=new HashMap<>();
			approveMap1.put("type", "2002");
			approveMap1.put("money", "100");
			approveMap1.put("in_uid","121");
			approveMap1.put("info", "332号借款管理费");
			approveMap1.put("fz_id", tpset.getThirdPartyInfo("MerId"));
			approveMap1.put("fz_money", "100");
			approveMap1.put("fz_info", "332号借款管理费");
			HashMap<String, Object> apresfee = tpset.create_single_hosting_pay_trade(approveMap1);
			//return "success";
			this.echoJson(apresfee, response);
*/		//}

		/*HashMap<String, String> tradeInfo = new HashMap<>();
		tradeInfo.put("type", "1002");
		tradeInfo.put("info", "还款");
		tradeInfo.put("uid", "119");
		tradeInfo.put("borrow_id", "331");
		tradeInfo.put("money", "100.00");
		//HashMap<String, Object> tpRes = tpset.create_hosting_collect_trade(request, response, tradeInfo);
		HashMap<String, String> approveMap=new HashMap<>();
		approveMap.put("type", "2002");
		approveMap.put("pay_uid", "119");
		approveMap.put("money", "100.00");
		approveMap.put("in_uid", "120");
		approveMap.put("info", "331号标还款");
		HashMap<String, Object> apres = tpset.create_single_hosting_pay_trade(approveMap);
		//log.info("1++++"+tpRes);
		log.info("2++++"+apres);*/
		/*PageData pd = new PageData(request);
		ThirdpartyTpqueryController tpqueryController=new ThirdpartyTpqueryController();
		HashMap<String, String>	userInfo = new HashMap<>();
		userInfo.put("id", pd.get("uid"));
		userInfo.put("account_type", pd.get("account_type"));
		userInfo.put("start_time", pd.get("start_time"));
		userInfo.put("end_time", pd.get("end_time"));
		HashMap<String, Object> res = tpqueryController.query_account_details(request, response, userInfo);
		this.echoJson(res, response);*/
		//ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		
			//127.0.0.1:8080/springMVC/ftp/index.do?quick_pay_bankid=CCB&quick_pay_card_num=6222802872501014761&quick_pay_kaihu_name=李子海&quick_pay_card_type=DEBIT&quick_pay_card_attribute=C&quick_pay_phone=15802785814
		//127.0.0.1:8080/springMVC/ftp/index.do?binding_pay_card_id=26886
		//tpset.recharge(request, response, mv);
	/*	//绑定银行卡
 		inHashMap.put("uid", "df22310");
		inHashMap.put("bank_code", "CCB");
		inHashMap.put("bank_num", "6222802872501014761");
		inHashMap.put("bank_phone", "15802785814");
		inHashMap.put("province", "湖北省");
		inHashMap.put("city", "武汉市");
		tpset.binding_bank_card(request, response, inHashMap);		
*/	
/*		//绑卡推进 返回的card_id要保存，解绑要用
 		inHashMap.put("code", "229084");
		inHashMap.put("ticket", "5902a4bc2b6141228338e5ac9270854e");
		tpset.binding_bank_card_advance(request, response, inHashMap);		
*/
	/*	inHashMap.put("card_id", "28334");
		inHashMap.put("uid", "df22310");
		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		tpset.unbinding_bank_card(request, response, inHashMap);
*/		
		/*		String string="{\"BidDetails\":[{\"BidCreditAmt\":\"942.15\",\"BidOrdDate\":\"20150722\",\"BidOrdId\":\"20150722233509000005\",\"BorrowerDetails\":[{\"BorrowerCreditAmt\":\"942.15\",\"BorrowerCustId\":\"6000060001766487\",\"PrinAmt\":\"492.56\"}]}]}";
		 JSONObject X11 = JSON.parseObject(string);
*/		 
/*		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		Connection conn = MySQL.getConnectionReadOnly(true);
		//投标人列表
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("c.status", "1");
		mapUtil.getStringCondition("c.type", "2");
		DataSet investListData = T.load("user_card c", conn).LJ("borrow_investor i ON i.id=c.target_id").LJ("user bm ON bm.id=i.borrow_uid").W(mapUtil.getParamConditionList()).Q("c.use_money,bm.third_account,i.borrow_id,i.id");
		List<Map<String, String>> investList = BeanMapUtils.dataSetToListMap(investListData);
		logger.info("ALLENN="+investList.size()+":"+investList);
		for (int i = 0; i < investList.size(); i++) {
			Map<String, String> array_element = investList.get(i);
			HashMap<String, String> transferHashMap=new HashMap<>();
			transferHashMap.put("InCustId", array_element.get("third_account"));
			transferHashMap.put("TransAmt", Tools.getDoubleString(array_element.get("use_money")+""));
			transferHashMap.put("OutAcctId", tpset.getMerAccountType("reward_out"));
			HashMap<String, Object> rewardRes = tpset.setaccount(request,response,transferHashMap);
			echoJson(rewardRes, response);
		}
		MySQL.closeConnection(conn);*/
		/*ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		HashMap<String, Object> res = tpset.unfreeze(request, response, "201507030016823663");
		echoJson(res, response);*/
		
		
		/*ThirdpartyTpqueryController tpq = new ThirdpartyTpqueryController();
		HashMap<String, Object> vrs = tpq.getmeraccount(request, response);
		Tools.printData(vrs);*/
		/*Connection conn = MySQL.getConnectionReadOnly(true);
		//投标人列表
		DataSet investListData = T.load("borrow_investor", conn).W(Tools.BuildWhereMap("id", "301", "=")).Q("count(DISTINCT(investor_uid)) as inverst_mans");
		List<Map<String, String>> investList = BeanMapUtils.dataSetToListMap(investListData);
		logger.debug("investListData:"+StringUtils.isBlank(investList.get(0).get("add_interest"))+"@@@"+StringUtils.isBlank(investList.get(0).get("has_pay"))+investList);
*/		/*ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		HashMap<String, Object> res = tpset.unfreeze(request, response, "201507030016823663");
		echoJson(res, response);*/
		/*HashMap<String, String> articleInfo = thisService.getArticleInfo("647", mv);
		String templateContent = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>合同内容</title><style type=\"text/css\">body{font-family:SimSun;}.img{position:absolute; left:100px; top:500px}</style></head><body>";
		templateContent+=articleInfo.get("content");
		templateContent+="</body></html>";
		
		Map<String, String> borrowInfo = new HashMap<>();
		borrowInfo.put("borrow_name", "测试借款标题");
		Map<String, Object> tplMap=new HashMap<>();
		tplMap.put("test", Tools.getLongTime());
		tplMap.put("borrowInfo", borrowInfo);
		String htmlStr = HtmlGenerator.generate("testtpl", templateContent, tplMap);*/
	/*	try {
			response.setContentType("text/html;charset=UTF-8");
			response.getOutputStream().write(htmlStr.getBytes("UTF-8"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			logger.error("输出json出错");
		}*/
		/*String outputFile = "H:\\sample.pdf";
        PdfGenerator.generate(htmlStr, outputFile); 
        
        response.setContentType("application/x-msdownload;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=test.pdf");
		InputStream in = new FileInputStream(outputFile);  
	    OutputStream out = response.getOutputStream();
		 int b;  
	     while((b=in.read())!= -1)  
	      {  
	            out.write(b);  
	     }  
	          
	    in.close();  
	    out.close();
		return ;*/
        /*Connection conn = MySQL.getConnectionReadOnly(false );
		DataSet Dx = T.load("user", conn).W(Tools.BuildWhereMap("user_name", "dftest1", "=")).Lock().Q(null);
		Map<String, String> user = BeanMapUtils.dataSetToListMap(Dx).get(0);
		log.info("会员信息是："+user);
		Thread.currentThread().sleep(100000); 
		HashMap<String, Object>updateMp=  new HashMap<>();
		updateMp.put("user_name", "dftest1");
		updateMp.put("id", user.get("id"));
		BaseDao.update(conn, "user", updateMp, null);
		MySQL.commit(conn);
		MySQL.closeConnection(conn);*/
		
		/*ThirdpartyTpqueryController tpquery = new ThirdpartyTpqueryController();
		HashMap<String, Object> SeekableByteChannel = tpquery.getbank(request, response, "6000060001611439","4");
		Tools.printData(SeekableByteChannel);*/
		/*		HashMap<String, Object> xxHashMap = new HashMap<>();
		HashMap<String, String>	eeHashMap = new HashMap<>();
		List<String[]> eeList = new ArrayList<>();
		for (int i = 0; i < 1000; i++) {
			String[] sss = ShortCode.shortUrl(UUID.randomUUID().toString());
			for (int j = 0; j < sss.length; j++) {
				String string = sss[j];
				eeHashMap.put(string, "1");
			}
			eeList.add(sss);
		}
		xxHashMap.put("res", eeList);
		xxHashMap.put("Count", eeHashMap.size());
		this.echoJson(xxHashMap, response);
		return ;
*//*		ThirdpartyTpsetController tpset = new ThirdpartyTpsetController();
		ThirdpartyTpqueryController tpquery = new ThirdpartyTpqueryController();
		tpquery.getaccount(request, response, request.getParameter("userid"));
		tpquery.dz_invest(request, response, null);
		tpquery.dz_recharge(request, response, null);
		tpquery.dz_withdraw(request, response, null);
		tpquery.dz_mertr(request, response, null);
		HashMap<String, String> parmHashMap=new HashMap<>();
		parmHashMap.put("OrdId", request.getParameter("orderid"));
		tpquery.dz_trstatus(request, response, parmHashMap);
		tpquery.getmeraccount(request, response);
		tpset.subborrow(request, response, request.getParameter("subid"));
		
		HashMap<String, String> transferHashMap=new HashMap<>();
		transferHashMap.put("InCustId", "6000060001600076");
		transferHashMap.put("TransAmt", "10.2");
		transferHashMap.put("OutAcctId", tpset.getMerAccountType("reward_out"));
		tpset.setaccount(request,response,transferHashMap);
*/	
		
		
		/*String sssString = "success|100";
		String[] fx = sssString.split("\\|");
		logger.info("startWith@@@@@@@@@@@@@@@@"+sssString.startsWith("success"));
		logger.info("投标ID是SSSSSSSSSSSSSSSSSSSSSSSSSSSSS："+fx[1]);*/
		
/*		logger.info("SSSSSSS:"+(Double.valueOf(DfMath.s2add("33.44","30"))<=Double.valueOf(DfMath.round(63.44))));
		logger.info("SEEEEEEEE"+Double.valueOf(DfMath.s2add("33.4466","30.3445")));
		logger.info("SEEEEEEEE"+Double.valueOf(DfMath.s2round("63.44")));
		
*/		
/*		
		List<HashMap<String, String>>borrowDetail = new ArrayList<>();
		HashMap<String, String> thisBorrower = new HashMap<>();
		thisBorrower.put("DivCustId", "6000060001473631");
		thisBorrower.put("DivAcctId", Tools.getDoubleString(1000+"")+"");
		thisBorrower.put("DivAmt", "1.00");
		borrowDetail.add(thisBorrower);
		
		HashMap<String, String> submitdata = new LinkedHashMap<>();
		submitdata.put("SubOrdId","20150602004235000004");
		submitdata.put("SubOrdDate","20150602");
		submitdata.put("InCustId","6000060001473631");
		submitdata.put("OutCustId","6000060001473640");
		submitdata.put("OrdDate",Tools.TimeStamp2Date(Tools.getLongTime()+"", "yyyyMMdd"));
		submitdata.put("Fee",Tools.getDoubleString(0+""));
		submitdata.put("DivDetails",(Double.valueOf(submitdata.get("Fee")+"")>0)?JSON.toJSONString(borrowDetail):"");
		submitdata.put("TransAmt",Tools.getDoubleString("1000"));

		ThirdpartyTpsetController tpsetController = new ThirdpartyTpsetController();
		HashMap<String, Object> res = tpsetController.setloans(request, response, submitdata);
		Tools.printData(res);
*/		
/*		List<BasicNameValuePair> getDatBasicNameValuePairs = new ArrayList<>();
		getDatBasicNameValuePairs.add(new BasicNameValuePair("test", "testValue"));
		String htmlBody = DfHttpClient.doPost("http://df3.com?id=2&ee=3",getDatBasicNameValuePairs);
		logger.info(htmlBody);
*/		//Tools.getDoubleStrings("9999");
		//String res = borrowAndInvest.creditAssign("14", "64", "1000", new HashMap<String,String>());
		//logger.info("##########################"+res);
		/*		double SSICommand = DfMath.div(123.55333, 123.55333,9);
		String SSICommand2 = Tools.TimeStamp2Date(Tools.timeAddMonth(0,"1422813722")+"","yyyyMMdd");
		logger.info("$$$$$$$$$$$$$$$$$$$$$$当前月份天数："+SSICommand+"天"+SSICommand2+"天");
*/		//ImagesResize.zoomOutImage("H:/Java/bi2gloading.gif", "H:/Java/bi2gloading-1.gif", 50, 100,true);
		/*File tempFile =new File(("H:/Java/4.png").trim()); 
		String fileName = tempFile.getName();
		String fileType = Tools.getExtension(fileName);
		String pureFileName = fileName.replace("."+fileType,"");
		String thumbPath = tempFile.getAbsolutePath();
		logger.info("#########"+thumbPath.replace(fileName, "")+"======"+pureFileName+"_thumb."+fileType);
*/		/*		Connection conn = MySQL.getConnectionReadOnly(false);
		T.load("area", conn).W(Tools.BuildWhereMap("id", "3429", "=")).D();
		MySQL.commit(conn);
		MySQL.closeConnection(conn);
*/		
		/*		HashMap<String, Object> thisMenu= Common.getCacheMenuACL(false);
		HashMap<String, Object> xx = (HashMap<String, Object>)((HashMap<String, Object>)(HashMap<String, Object>)((HashMap<String, Object>)thisMenu.get("admin")).get("article")).get("add")).get("doadd");
		Tools.printData(xx);
*/		
/*		Connection conn = MySQL.getConnectionReadOnly(true);
		DataSet listMenuDataSet  = T.load("menu", conn).Q(null);
		List<Map<String, String>> MenuList = BeanMapUtils.dataSetToListMap(listMenuDataSet);
		ArrayList<String> loginf= new ArrayList<>();
		for (int i = 0; i < MenuList.size(); i++) {
			Map<String, String> thisMenu = MenuList.get(i);
			String menuId = Common.getCurrentMenuId(thisMenu.get("app"), thisMenu.get("model"),thisMenu.get("action"),new PageData(request));
			if(!thisMenu.get("id").equals(menuId)){
				loginf.add("@@@@@@@@@@MENUID_MENU=="+thisMenu.get("id")+"="+menuId+" method:="+thisMenu.get("action")+"@@@@@@@@@@MENUID_");			
			}
		}
		MySQL.closeConnection(conn);
		Tools.printData(loginf);
*/		//String menuId = Common.getCurrentMenuId("admin", "borrow_type","index",new PageData(request));


/*		HashMap<String,String> values = new HashMap<String,String>();  
		org.apache.catalina.util.RequestUtil.parseParameters(values,"sss=233&sss=111&ssse=111&sdf22=111",  "UTF-8");
		Tools.printData(values);
*/		//String[] strings = new String[2];
		//System.out.print(strings.getClass().getSimpleName()+"FFFFFFFFFF");
		//GetAllController.getControllers(request);
		//log.info("DFSDF@@@@@@@@@@@@"+listx);
/*		//TestLoader.testloadxxx();
				MyClassLoader mcl = new MyClassLoader(Tools.getAbsolutelyPath()+"/WEB-INF/classes/");
		try {  
            Class c = mcl.loadClass("com.dfp2p.fun.TestLoader");  
            Class c2 = mcl.loadClass("com.dfp2p.fun.TestLoader");  
            Object te = c2.newInstance();  
           // Object te = this;
            //te.testloadxxx();
            
            ClassLoader loader = TestLoader.class.getClassLoader(); 
            while (loader != null) { 
                System.out.println("##########@@@@@@@@@@@@@@############:"+loader.toString()+"\r\n"); 
                loader = loader.getParent(); 
            } 

            
            ClassLoader loader2 = te.getClass().getClassLoader(); 
            while (loader2 != null) { 
                System.out.println("##########@@@@@@@@@@@@@@############222:"+loader2.toString()+"\r\n"); 
                loader2 = loader2.getParent(); 
            } 
           
         System.out.println("obj.class="+c.getClass().getName());
   		 System.out.println("obj.class="+TestLoader.class.getClassLoader()+"!!!!!!!!"+TestLoader.class.getClassLoader());
        } catch (ClassNotFoundException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        } *//*catch (InstantiationException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        } catch (IllegalAccessException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  */
  		
		/*	String keyFilename=Tools.getAbsolutelyPath()+"/key.data";
		String[] fileNameArr = {Tools.getAbsolutelyPath()+"/TestLoader.class"};

		Class<?> cls = DecryptStart.getClassObject("com.dfp2p.fun.TestLoader", keyFilename, "");
		Object obj = cls.newInstance();
		 Method[] mthds = cls.getMethods();
		 for(Method mthd : mthds){
		 String methodName = mthd.getName();
		 System.out.println("mthd.name="+methodName);
		 }
		 System.out.println("obj.class="+obj.getClass().getName());
		 System.out.println("obj.class="+cls.getClassLoader().toString());
		 System.out.println("obj.class="+cls.getClassLoader().getParent().toString());

		 Method taskMethod = null;
		try {
			taskMethod = cls.getMethod("testloadxxx");
		} catch (NoSuchMethodException | SecurityException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		 taskMethod.invoke(obj);
*/	
	//TestLoader.testloadxxx();
/*		String keyFilename=Tools.getAbsolutelyPath()+"/key.data";
		String[] fileNameArr = {Tools.getAbsolutelyPath()+"/TestLoader.class"};
		try {
			EncryptClasses.doEncrypt(keyFilename, fileNameArr);
			EncryptClasses.doDecrypt(Tools.getAbsolutelyPath()+"/TestLoader", keyFilename,Tools.getAbsolutelyPath()+"/TestLoader2.class");
		} catch (Exception e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		}
*//*		try {
			GenerateKey.createKey(keyFilename);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
*/		
		/*		Connection conn = MySQL.getConnectionReadOnly(false);
		
		DataSet detailListData;
		try {
			detailListData = T.load("assignment_detail", conn).W(Tools.BuildWhereMap("id", "3333", "=")).Q(null);
			List<Map<String, String>> detailList = BeanMapUtils.dataSetToListMap(detailListData);
			log.info("############出错了:"+detailList.size());
		} catch (NumberFormatException | ClassNotFoundException | SQLException
				| IOException e) {
			log.info("############出错了");
			e.printStackTrace();
		}
*//*		HttpSession session = request.getSession();
		HashMap<String,FTPManager> localFTP= (HashMap<String, FTPManager>) session.getAttribute("localFTP");
		if(localFTP==null){	
			FTPManager fm1 = new FTPManager("211.149.208.61", 21, "zht_ftp", "zht_ftp");
			FTPManager fm2 = new FTPManager("121.40.19.226", 21, "cwh_jwf", "cwh_jwf");
			HashMap<String,FTPManager> localFTP1=new HashMap<String, FTPManager>();
			localFTP1.put("FM1", fm1);
			localFTP1.put("FM2", fm2);
			session.setAttribute("localFTP", localFTP1); 
			localFTP=localFTP1;
		}
		FileSystemView fsv=FileSystemView.getFileSystemView();
		  //将桌面的那个文件目录赋值给file
		  File[] file=fsv.getRoots();
		  //输出桌面那个目录的路径
		  int len=file.length;
		  String showhtml="";
		  for(int i=0;i<len;i++)  showhtml+=(file[i].getPath())+"\r\n";
		  System.out.println("showHtml="+showhtml);
*/
/*		String htmlString="<table>";
		String retypeString="2";
		String rateString="14.6";
		String durationString = "6";
		HashMap<String, Object> listHashMap = InterestCount.InterestCounter("600000", durationString, rateString,retypeString,Tools.getLongTime()+"");
		List<Map<String,String>> list  = (List<Map<String, String>>) listHashMap.get("list");
		for (int i = 0; i < list.size(); i++) {
			Map<String,String> thisMap = list.get(i);
			htmlString+="<tr><td>"+thisMap.get("principal")+"</td><td>"+thisMap.get("interest")+"</td><td>"+thisMap.get("benxi")+"</td><td>"+Tools.TimeStamp2Date(thisMap.get("endDate"),"yyyy-MM-dd hh:mm:ss")+"</td><td>";
		}
		htmlString+="<tr><td>allInterest</td><td>"+listHashMap.get("all")+"</td><td>=</td><td>=</td><td>";
		HashMap<String, Object> listHashMap1 = InterestCount.InterestCounter("100000", durationString, rateString,retypeString,Tools.getLongTime()+"");
		List<Map<String,String>> list1  = (List<Map<String, String>>) listHashMap1.get("list");
		for (int i = 0; i < list1.size(); i++) {
			Map<String,String> thisMap = list1.get(i);
			htmlString+="<tr><td>"+thisMap.get("principal")+"</td><td>"+thisMap.get("interest")+"</td><td>"+thisMap.get("benxi")+"</td><td>"+Tools.TimeStamp2Date(thisMap.get("endDate"),"yyyy-MM-dd hh:mm:ss")+"</td><td>";
		}
		htmlString+="<tr><td>allInterest</td><td>"+listHashMap1.get("all")+"</td><td>=</td><td>=</td><td>";
		HashMap<String, Object> listHashMap2 = InterestCount.InterestCounter("100000", durationString, rateString,retypeString,Tools.getLongTime()+"");
		List<Map<String,String>> list2  = (List<Map<String, String>>) listHashMap2.get("list");
		for (int i = 0; i < list2.size(); i++) {
			Map<String,String> thisMap = list2.get(i);
			htmlString+="<tr><td>"+thisMap.get("principal")+"</td><td>"+thisMap.get("interest")+"</td><td>"+thisMap.get("benxi")+"</td><td>"+Tools.TimeStamp2Date(thisMap.get("endDate"),"yyyy-MM-dd hh:mm:ss")+"</td><td>";
		}
		htmlString+="<tr><td>allInterest</td><td>"+listHashMap2.get("all")+"</td><td>=</td><td>=</td><td>";
		HashMap<String, Object> listHashMap3 = InterestCount.InterestCounter("100000", durationString, rateString,retypeString,Tools.getLongTime()+"");
		List<Map<String,String>> list3  = (List<Map<String, String>>) listHashMap3.get("list");
		for (int i = 0; i < list3.size(); i++) {
			Map<String,String> thisMap = list3.get(i);
			htmlString+="<tr><td>"+thisMap.get("principal")+"</td><td>"+thisMap.get("interest")+"</td><td>"+thisMap.get("benxi")+"</td><td>"+Tools.TimeStamp2Date(thisMap.get("endDate"),"yyyy-MM-dd hh:mm:ss")+"</td><td>";
		}
		htmlString+="<tr><td>allInterest</td><td>"+listHashMap3.get("all")+"</td><td>=</td><td>=</td><td>";
		HashMap<String, Object> listHashMap4 = InterestCount.InterestCounter("100000", durationString, rateString,retypeString,Tools.getLongTime()+"");
		List<Map<String,String>> list4  = (List<Map<String, String>>) listHashMap4.get("list");
		for (int i = 0; i < list4.size(); i++) {
			Map<String,String> thisMap = list4.get(i);
			htmlString+="<tr><td>"+thisMap.get("principal")+"</td><td>"+thisMap.get("interest")+"</td><td>"+thisMap.get("benxi")+"</td><td>"+Tools.TimeStamp2Date(thisMap.get("endDate"),"yyyy-MM-dd hh:mm:ss")+"</td><td>";
		}
		htmlString+="<tr><td>allInterest</td><td>"+listHashMap4.get("all")+"</td><td>=</td><td>=</td><td>";
		mv.addObject("repayment", htmlString);
*/			//borrowAndInvest.borrowRepayment("289", "3");
/*				//borrowAndInvest.borrowRefuse("286");
			String reString = borrowAndInvest.borrowApprove("289");
			log.info("@@@@@@@@@@@@@@@@@RES:"+reString);
*/	
/*		  HashMap<String, String> moneyTypeMap=new HashMap<>();
		  moneyTypeMap.put("account_money","+");
		  String res = "";
		  //res = borrowAndInvest.memberMoneyLog("36","1", "10000000", "测试手动调整金额", "", "", moneyTypeMap);
		  log.info("RESTUR+："+res);
				//测试投标
			String reString = borrowAndInvest.investMoney("36"," 289", "300000",0, 0, new HashMap<String,String>());
			log.info("@@@RES:"+reString);
*/		
	//	测试投标		
		  
/*		  mv.addObject("showHtml", showhtml);
		  Repayment.Bill(retypeString, "12", rateString, "按月等额本金", "2013-01-31 23:59:59");
		  Repayment.Bill(retypeString, "12", rateString, "按月等额本息", "2013-01-31 23:59:59");
		  Repayment.Bill(retypeString, "12", rateString, "到期一次性还款", "2013-01-31 23:59:59");
		  log.info( Tools.TimeStamp2Date(String.valueOf(Tools.getLongTime()),"yyyy-MM-dd HH:mm:ss"));
*/		  /*

		Map<String, Object> testValue=new HashMap<String, Object>();
		String[] comp = {"C1","C2","C3","3333###","C5"};
		testValue.put("testkey1", comp);
		testValue.put("testkey2", "值2222222");
		testValue.put("testkey3", "值3");
		testValue.put("testkey4", "值4");
		
		boolean isSuccess =  ConfigCache.doEditCache("test", testValue);
		if(isSuccess) log.info("success update");
		else  log.info("Fail update XXXXXXXXXXXXXXXX");
		 Map<String, Object> cacheDataMap = ConfigCache. getCacheList("test");
		 log.info("下面是cacheData:");
		 Tools.printData( cacheDataMap.get("testkey1"));
		 Tools.printData(cacheDataMap);
		 // klhkjhkh;
		  */
		//return this.getTplView(request,response, tplPath, mv);
	}

}
