package com.dfp2p.core.admin.Capital_invest;

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
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminCapital_investController extends BaseAdminController {
	public String tplPath = "Capital_invest";
	
	@Resource(name="adminCapital_investService")
	private AdminCapital_investService thisService;
	
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
		
		HashMap<String, Object> list = thisService.getCapital_investList(pd, mv);

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
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request, response, mv);
	}
	
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getCapital_investExcelList(pd, mv);
		
		String[] arr = {"id","user_name as 姓名","affect_credits","account_credits","add_time","info AS 信息"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
