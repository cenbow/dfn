package com.dfp2p.core.thirdparty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dfp2p.baseController.BaseThirdpartyController;
import com.dfp2p.core.home.ftp.FtpController;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Logger;
import com.dfp2p.util.Tools;

public class CommonFun {
	private static Log log = LogFactory.getLog(CommonFun.class);
	/**
	 * 有独立的conn
	 * @param borrowId
	 * @return
	 */
	public static String tpApprove(String borrowId) {
		//数据库查询部分
		Connection conn = MySQL.getConnectionReadOnly(true);
		DataSet ds;
		List<Map<String, String>> Ilist =null;
		Map<String, String> bin = new HashMap<>();
		try {
			ds = T.load("borrow_investor", conn).W(Tools.BuildWhereMap("borrow_id", borrowId, "=")).Q("investor_uid as uid,investor_capital as money,borrow_uid as borrower_id,borrow_id");
			Ilist = BeanMapUtils.dataSetToListMap(ds);
			DataSet dbs = T.load("borrow_info", conn).W(Tools.BuildWhereMap("id", borrowId, "=")).Q("borrow_fee");
			bin = BeanMapUtils.dataSetToListMap(dbs).get(0);
		} catch (Exception e) {
			return "查询投标列表出错";
		}finally{
			MySQL.closeConnection(conn);
		}
		//数据库查询部分
		String resMsg="";
		double count = Math.ceil(DfMath.s2div(Ilist.size()+"","300",10));
		int ex = Ilist.size()%300;
		
		ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
		log.info("当前count:"+count+"余数："+ex);
		for (int i = 0; i < count; i++) {
			List<Map<String, String>> thisList;
			if(ex>0&&(i+1)==count) thisList = Ilist.subList(i*300, i*300+ex);
			else thisList = Ilist.subList(i*300, (i+1)*300);
			
			log.info("当前列表"+thisList);
			
			HashMap<String, String> approveMap=new HashMap<>();
			approveMap.put("type", "2001");
			approveMap.put("trade_list", tpsetController.buildTradeList(thisList));
			HashMap<String, Object> apres = tpsetController.create_batch_hosting_pay_trade(approveMap);
			if(!"success".equals(apres.get("df_res"))){
				resMsg="第"+(i+1)+"批次复审出错,出错原因:"+apres.get("df_msg");
				break;
			}
		}
		
		
		
		if(StringUtils.isBlank(resMsg)){
			HashMap<String, String> approveMap1=new HashMap<>();
			approveMap1.put("type", "2002");
			approveMap1.put("money", bin.get("borrow_fee"));
			approveMap1.put("in_uid", "sinaweibopay_zg@weibopay.com");//BaseThirdpartyController.getThirdPartyInfos("MerId"));
			approveMap1.put("info", borrowId+"号标利息管理费");
			HashMap<String, Object> apres = tpsetController.create_single_hosting_pay_trade(approveMap1);
			return "success";
		}
		else return resMsg;
		
	}
	
	public static String tpRefuse(String borrowId,String type) {
		//数据库查询部分
		Connection conn = MySQL.getConnectionReadOnly(true);
		DataSet ds;
		List<Map<String, String>> Ilist =null;
		try {
			ds = T.load("borrow_investor", conn).W(Tools.BuildWhereMap("borrow_id", borrowId, "=")).Q("t_tran_id,investor_capital");
			Ilist = BeanMapUtils.dataSetToListMap(ds);	
		} catch (Exception e) {
			return "查询投标列表出错";
		}finally{
			MySQL.closeConnection(conn);
		}
		//数据库查询部分
		String resMsg="";
		ThirdpartyTpsetController tpsetController=new ThirdpartyTpsetController();
		for (int i = 0; i < Ilist.size(); i++) {
			Map<String, String> thisMap = Ilist.get(i);
			HashMap<String, String> refuseMap=new HashMap<>();
			refuseMap.put("tran_id", thisMap.get("t_tran_id"));
			refuseMap.put("money", thisMap.get("investor_capital"));
			refuseMap.put("info", borrowId+"号标复审未通过");
			HashMap<String, Object> apres = tpsetController.create_hosting_refund(refuseMap);
			if(!"success".equals(apres.get("df_res"))){
				resMsg="第"+(i+1)+"批次复审出错,出错原因:"+apres.get("df_msg");
				break;
			}
		}
		
		
		if(StringUtils.isBlank(resMsg)) return "success";
		else return resMsg;
		
	}
}
