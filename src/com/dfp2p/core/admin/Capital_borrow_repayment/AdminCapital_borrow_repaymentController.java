package com.dfp2p.core.admin.Capital_borrow_repayment;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminCapital_borrow_repaymentController extends BaseAdminController {
	public String tplPath = "Capital_borrow_repayment";
	
	@Resource(name="adminCapital_borrow_repaymentService")
	private AdminCapital_borrow_repaymentService thisService;
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);

		Map<String, String> txSignSelect = new LinkedHashMap<String,String>();
		txSignSelect.put("gt","大于");
		txSignSelect.put("eq","等于");
		txSignSelect.put("lt","小于");
		mv.addObject("tbjSignSelect",txSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_borrow_repaymentList(pd, mv);

		mv.addObject("list", list);
		
		Map<String, Object> borrowType = ConfigCache.getCacheList("BorrowType");
		if (borrowType != null)	{
			HashMap<String, Object> typeList = (HashMap<String, Object>) borrowType.get("type");
			HashMap<String, Object> borrowTypeData = new LinkedHashMap<>();
			HashMap<String, Object> borrowTypeDataX = Common.buildNewKVMap(typeList, "key", "borrow_name");
			borrowTypeData.put(" ", "选择产品类型");
			for (Entry<String, Object> entry:borrowTypeDataX.entrySet()) {
				String ekeyString=entry.getKey();
				String eValueString=entry.getValue()+"";
				borrowTypeData.put(ekeyString, eValueString);
			}

			mv.addObject("borrowType",borrowTypeData);
		}

		Map<String, String> istatus = new LinkedHashMap<String,String>();
		istatus.put("","==回款状态==");	
		istatus.put("0","还未确认通过");
		istatus.put("1","已回收");
		istatus.put("7","待回收");
		mv.addObject("istatus",istatus);
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request, response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_borrow_repaymentExcelList(pd, mv);
		String[] arr = {"id as ID",
				"borrow_id as 标号",
				"user_name as 投资人",
				"real_name as 真实姓名",
				"capital as 应收本金",
				"interest as 应收利息",
				"use_reward_money as 使用奖励",
				"will_receive_capital as 待收本金",
				"will_receive_interest as 待收利息",
				"interest_fee as 利息管理费",
				"sort_order as 当前期数",
				"total as 总期数",
				"borrow_name as 借款名",
				"borrow_type as 产品名称",
				"deadline as 应收时间",
				"repayment_time as 实收时间",
				};

		Map<String, Object> borrowType = ConfigCache.getCacheList("BorrowType");

		HashMap<String, Object> typeList = (HashMap<String, Object>) borrowType.get("type");
		HashMap<String, Object> borrowTypeDataX = Common.buildNewKVMap(typeList, "key", "borrow_name");
		List<Map<String, Object>> SSData = (List<Map<String,Object>>)list.get("data");
		for (Map<String, Object> thisdata : SSData) {
			thisdata.put("will_receive_capital", DfMath.s2sub(thisdata.get("capital")+"", thisdata.get("receive_capital")+""));
			thisdata.put("will_receive_interest", DfMath.s2sub(thisdata.get("interest")+"", thisdata.get("receive_interest")+""));
			thisdata.put("borrow_type", borrowTypeDataX.get(thisdata.get("borrow_type"))+"");
		}
		ExcelUtil.writeExcel(SSData, "会员待收明细", arr,response);
		
	}
}
