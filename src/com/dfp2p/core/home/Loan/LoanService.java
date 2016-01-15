package com.dfp2p.core.home.Loan;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.base.BaseService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.ValidatorUtil;
import com.dfp2p.util.WhereUtil;


@Service("loanService")
public class LoanService{

	private static Log logger = LogFactory.getLog(LoanService.class);
	
	@Resource(name="loanDao")
	private LoanDao thisDao;
	
	@Resource(name="baseService")
	private BaseService baseService;
	
	

	public String addLoan(PageData pd, ModelAndView mv) {
		
		Connection conn = MySQL.getConnectionReadOnly(false);
		//处理插入表需要的传入值
		Map<String, Object> paramMap = pd.getFormHandler("loan_info");
		//插入当前ID
		HashMap<String, String> userInfo = Common.getUserLoginInfo();
//		paramMap.put("uid",userInfo.get("id"));
		//插入审核信息
		paramMap.put("status","0");
		//插入当前时间
		paramMap.put("add_time",Tools.getLongTime());
		List<String[]> validatorMap = new ArrayList<String[]>();
		validatorMap.add(Tools.buildValidatorObject("name","姓名必须在2-6个字符之间", ValidatorUtil.strLenCheck(paramMap.get("name")+"", 2, 6)));
		validatorMap.add(Tools.buildValidatorObject("name","姓名中不能包含特殊字符", ValidatorUtil.stringCheck(paramMap.get("name")+"")));
		validatorMap.add(Tools.buildValidatorObject("phone","手机号码格式不正确", ValidatorUtil.isPhone(paramMap.get("phone")+"")));
		validatorMap.add(Tools.buildValidatorObject("amount_borrowed","借款金额数据格式不正确", ValidatorUtil.isMoney(paramMap.get("amount_borrowed")+"")));
		validatorMap.add(Tools.buildValidatorObject("expired_borrowed","借款期限数据格式不正确", ValidatorUtil.isMoney(paramMap.get("expired_borrowed")+"")));
		validatorMap.add(Tools.buildValidatorObject("monthly_averagy_revenue","月均收入格式不正确", ValidatorUtil.isMoney(paramMap.get("monthly_averagy_revenue")+"")));
		validatorMap.add(Tools.buildValidatorObject("purpose_borrowed","借款用途不能为空", ValidatorUtil.isNotNull(paramMap.get("purpose_borrowed")+"")));
		validatorMap.add(Tools.buildValidatorObject("product","产品类型不能为空", ValidatorUtil.isNotNull(paramMap.get("product")+"")));
		validatorMap.add(Tools.buildValidatorObject("area","地域不能为空", ValidatorUtil.isNotNull(paramMap.get("area")+"")));
		List<String> fieldCheck = PageData.getError(validatorMap);	
		
		try{
			if (fieldCheck.size()==0)
			{
				BaseDao.insert(conn, "loan_info", paramMap);
				MySQL.commit(conn);
				return "success";
			}
			else
				return fieldCheck.get(0);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("addLoan失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}
		return "数据提交失败";
	}



	 

	
}
