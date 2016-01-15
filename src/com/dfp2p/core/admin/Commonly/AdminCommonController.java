package com.dfp2p.core.admin.Commonly;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.PageData;

@Controller
public class AdminCommonController extends BaseAdminController {
	public String tplPath = "Common";
	private static Log logger = LogFactory.getLog(AdminCommonController.class);
	
	
	public ModelAndView postborrow(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		PageData pd=new PageData(request);
		Connection conn=MySQL.getConnectionReadOnly(false);
		try {
			BaseService.memberLogin(pd.get("id"),conn,0,response);
		} catch (Exception e) {
			
		}finally{
			MySQL.closeConnection(conn);
		}
		Map<String, Object> typeData = (Map<String, Object>) ConfigCache.getCacheList("BorrowType");
		Map<String, Object> typeList = (LinkedHashMap<String, Object>)typeData.get("type");
		//logger.info("typeList::::"+typeList);
		String htmlString="验证通过，请选择发标类型：";
		for(Entry<String,Object>entry:typeList.entrySet()){
			HashMap<String, String> thisType = (HashMap<String, String>)entry.getValue();
			String aString="<a href='"+tplCommon.U("home/borrow/index")+"?type="+thisType.get("borrow_alias")+"' target='_blank'>"+thisType.get("borrow_name")+"</a>";
			htmlString+=aString+" | ";
		}
		return this.showTip(mv, "success", "10000", htmlString);
	}

}
