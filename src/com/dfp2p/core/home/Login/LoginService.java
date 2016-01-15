package com.dfp2p.core.home.Login;

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
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.other.DfHttpClient;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;
import com.sun.mail.imap.protocol.UID;


@Service("LoginService")
public class LoginService{

	private static Log logger = LogFactory.getLog(LoginService.class);
	@Resource(name="baseService")
	private BaseService baseService;
	
	
	public String checkLogin(PageData pd,HttpServletResponse response) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		HashMap<String, Object> userInfoHashMap = new HashMap<>();

		
		userInfoHashMap.put("user_name", pd.post("user_name"));
		userInfoHashMap.put("user_pass", pd.post("pass_word"));
		
		//数据校验
		List<String[]> validatorMap = new ArrayList();
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名必须在6-20个字符之间", ValidatorUtil.strLenCheck(userInfoHashMap.get("user_name")+"", 6, 20)));
		validatorMap.add(Tools.buildValidatorObject("user_name","用户名中不能包含特殊字符", ValidatorUtil.stringCheck(userInfoHashMap.get("user_name")+"")));
		validatorMap.add(Tools.buildValidatorObject("user_pass","密码不能为空", !StringUtils.isBlank(userInfoHashMap.get("user_pass")+"")));

		List<String> fieldCheck = PageData.getError(validatorMap);	

		userInfoHashMap.put("user_pass", borrowAndInvest.userPassCreate(userInfoHashMap.get("user_pass")+""));

		//查询条件
		Object[] whereobj = new Object[]{new String[]{"user_name","`"+userInfoHashMap.get("user_name")+"`","=","or"},new String[]{"user_phone","`"+userInfoHashMap.get("user_name")+"`","=","or"},"and"};
		WhereUtil whereUtil = new WhereUtil();
		//whereUtil.getStringCondition("user_name", userInfoHashMap.get("user_name")+"");
		whereUtil.getStringCondition("user_pass", userInfoHashMap.get("user_pass")+"");
		whereUtil.getParamConditionList().add(whereobj);
		
		String reString = "";
		Map<String, String> userInfoLogin = new HashMap<>();
		if(fieldCheck.size()==0){
			try {
				DataSet userDataSet = T.load("user", conn).W(whereUtil.getParamConditionList()).Q("user_name,id,is_ban,third_account");
				userInfoLogin = BeanMapUtils.dataSetToListMap(userDataSet).get(0);
				int remberMin = 0;
				if("1".equals(pd.post("isrember"))) remberMin=24*60;
				boolean isLogin = baseService.memberLogin(userInfoLogin.get("id"),conn,remberMin,response);
				MySQL.commit(conn);
				reString="success";
			} catch (Exception e) {
				HashMap<String, String> submitData=new HashMap<>();
				submitData.put("user_name", userInfoHashMap.get("user_name")+"");
				submitData.put("user_pass", pd.post("pass_word"));
				String responseHtml = DfHttpClient.doPost("http://old.dbxcf.com/doerror-getpassnew",submitData);
				
				if(!"fail".equals(responseHtml)){
					int remberMin = 0;
					if("1".equals(pd.post("isrember"))) remberMin=24*60;
					try {
						boolean isLogin = baseService.memberLogin(responseHtml,conn,remberMin,response);
						HashMap<String, Object> updata=new HashMap<>();
						updata.put("id", responseHtml);
						updata.put("tran_in", "1");
						updata.put("user_pass", userInfoHashMap.get("user_pass"));
						BaseDao.update(conn, "user", updata, null);
						MySQL.commit(conn);
						reString="success";
					} catch (Exception e1) {
						logger.error("老平台登陆出错:"+e1.toString());
						MySQL.rollback(conn);
					}
				}else{
					reString="用户名或者密码错误";
					MySQL.rollback(conn);
				}
			}finally{
				MySQL.closeConnection(conn);
			}
		}else{
			reString=fieldCheck.get(0);
		}
	
		
		return reString;
		
	}
	
 


 

	

	
}
