package com.dfp2p.core.member.Contract;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;


@Service("memberContractService")
public class MemberContractService{

	private static Log logger = LogFactory.getLog(MemberContractService.class);
	
	@Resource(name="memberContractDao")
	private MemberContractDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	

	public HashMap<String, String> getArticleInfo(String id,ModelAndView mv) throws Exception {	
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, String> articleInfo= new HashMap<>();
		try {
			articleInfo = (HashMap<String, String>) thisDao.getArticleInfo(conn, id);
		} catch (Exception e) {
			return null;
		}
		MySQL.closeConnection(conn);
		return articleInfo;
	}	

	public HashMap<String, String> getInvestInfo(String id,ModelAndView mv) throws Exception {	
		Connection conn = MySQL.getConnectionReadOnly(true);
		HashMap<String, String> InvestInfo= new HashMap<>();
		try {
			InvestInfo = (HashMap<String, String>) thisDao.getInvestInfo(conn, id);
		} catch (Exception e) {
			return null;
		}
		MySQL.closeConnection(conn);
		return InvestInfo;
	}	
 
	public HashMap<String, Object> getBorrowInfo(String id,ModelAndView mv) throws Exception {
		HashMap<String, Object> getRes = new HashMap<>();
		
		Connection conn = MySQL.getConnectionReadOnly(true);
		//借款信息
		Map<String, String> borrowInfo = thisDao.getBorrowInfo(conn, id);
		if(borrowInfo!=null){
			int Progress = (int)((DfMath.multi(DfMath.s2div(borrowInfo.get("has_borrow"), borrowInfo.get("borrow_money"),2),100)));
			borrowInfo.put("need", DfMath.s2sub(borrowInfo.get("borrow_money"), borrowInfo.get("has_borrow"))+"");
			borrowInfo.put("leftdays", Tools.getLeftTime(borrowInfo.get("collect_time"), 2));
			borrowInfo.put("leftSecond", DfMath.s2sub(borrowInfo.get("collect_time")+"", Tools.getLongTime()+"")+"");
			borrowInfo.put("progress",Progress+"");
			borrowInfo.put("duration_unit", ("4".equals(borrowInfo.get("repayment_type"))?"天":"个月"));
			borrowInfo.put("url", Common.getBorrowUrlString(borrowInfo.get("id")));	
			getRes.put("borrowInfo", borrowInfo);
		}
		//借款人信息
		Map<String, String> borrowUserInfo = thisDao.getBorrowUserInfo(conn,borrowInfo.get("borrow_uid"));
		getRes.put("borrowUserInfo", borrowUserInfo);
		
		//投标信息
		HashMap<String, Object> parm=new HashMap<>();
		parm.put("whereMap", Tools.BuildWhereMap("bi.borrow_id", id, "="));
		Map<String, Object> listInvestor = thisDao.getInvestorList(conn, parm);
		if(listInvestor!=null)		getRes.put("investorList", listInvestor);

		MySQL.closeConnection(conn);

		return getRes;
	}
	public Map<String, String> getCreditAssignmentInfo(String id,ModelAndView mv) throws Exception {

		Connection conn = MySQL.getConnectionReadOnly(true);
		//借款信息
		Map<String, String> creditAssignmentInfo = thisDao.getCreditAssignmentInfo(conn, id);

		MySQL.closeConnection(conn);

		return creditAssignmentInfo;
	}
	@SuppressWarnings("static-access")
	public Map<String, String> getUser_info(PageData pd,ModelAndView mv){
		Connection conn=MySQL.getConnectionReadOnly(true);
		Map<String, String> list=null;
		HashMap<String, Object> rp=new HashMap<String, Object>();
		WhereUtil whereUtil=new WhereUtil();
		whereUtil.setAlias("m", "user");
		whereUtil.setAlias("mi", "user_info");
		whereUtil.setAlias("mci", "user_common_info");
		whereUtil.getStringCondition("m.id", pd.get("id"));
		whereUtil.parseSearchMap(pd, whereUtil, conn);
		rp.put("paramCondition", whereUtil.getParamConditionList());
        try {
			list=thisDao.getUser_info(conn, rp);
		} catch (Exception e) {
			logger.error("getUser_info失败", e);
		}finally{	
			MySQL.closeConnection(conn);
		}
        return list;
	}
 
}












 


 

	

	

