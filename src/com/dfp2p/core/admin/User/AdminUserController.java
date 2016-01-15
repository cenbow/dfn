package com.dfp2p.core.admin.User;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.Page;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class AdminUserController extends BaseAdminController {
	public String tplPath = "User";
	
	@Resource(name="adminUserService")
	private AdminUserService thisService;
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
	

		Map<String, String> isBanSelect = new LinkedHashMap<String,String>();
		isBanSelect.put("","全部");
		isBanSelect.put("0","否");
		isBanSelect.put("1","是");
		mv.addObject("isBanSelect",isBanSelect);
		
		Map<String, String> vipSelect = new LinkedHashMap<String,String>();
		vipSelect.put("","全部");
		vipSelect.put("1","是");
		vipSelect.put("0","否");
		mv.addObject("vipSelect",vipSelect);
		
		Map<String, String> memberTypeSelect = new LinkedHashMap<String,String>();
		memberTypeSelect.put("","全部");
		memberTypeSelect.put("1","投资人");
		memberTypeSelect.put("2","借款人");
		memberTypeSelect.put("5","机构");
		mv.addObject("memberTypeSelect",memberTypeSelect);
		
		Map<String, String> balanceTypeSelect = new LinkedHashMap<String,String>();
		balanceTypeSelect.put("mm.account_money","可用余额");
		balanceTypeSelect.put("mm.money_freeze","冻结资金");
		mv.addObject("balanceTypeSelect",balanceTypeSelect);
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		Map<String, Object> listlevel = ConfigCache.getCacheList("cache_level");
		if(listlevel!=null){
			HashMap<String, Object> listlevelMap = Common.buildNewKVMap((Map<String, Object>) listlevel.get("level"), "key", "name");
			mv.addObject("listlevelMap",listlevelMap);
		}
		
		
		
//		mv.addObject("dfForm_style","width:200px;");
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getUserList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView user_page(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		return index(request, response, mv);
	}
	
	public ModelAndView user_add(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		Map<String, String> radioButtonSelect = new LinkedHashMap<String,String>();
		radioButtonSelect.put("0","否");
		radioButtonSelect.put("1","是");
		mv.addObject("radiobuttonSelect",radioButtonSelect);
		
		Map<String, String> memberTypeSelect = new LinkedHashMap<String,String>();
		memberTypeSelect.put("1","投资人");
		memberTypeSelect.put("2","借款人");
		memberTypeSelect.put("5","机构");
		mv.addObject("memberTypeSelect",memberTypeSelect);
		
		Map<String, String> serviceCustomerSelect = new LinkedHashMap<String,String>();
		serviceCustomerSelect.put("0","暂无客服");
		mv.addObject("serviceCustomerSelect",serviceCustomerSelect);

		return this.getTplView(request,response, tplPath, mv);
	}
	
	public ModelAndView addUser(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		boolean flag = thisService.addUser(pd, mv);
		
		mv.setViewName("redirect:/adminuser/index.do");
		return mv;
	}
	
	public ModelAndView user_edit(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		
		Map<String, String> radioButtonSelect = new LinkedHashMap<String,String>();
		radioButtonSelect.put("0","否");
		radioButtonSelect.put("1","是");
		mv.addObject("radiobuttonSelect",radioButtonSelect);
		
		Map<String, String> memberTypeSelect = new LinkedHashMap<String,String>();
		memberTypeSelect.put("1","投资人");
		memberTypeSelect.put("2","借款人");
		memberTypeSelect.put("5","机构");
		mv.addObject("memberTypeSelect",memberTypeSelect);
		
		
		//客服
		List<Map<String, String>> kfList = BaseService.getList("admin_user", Tools.BuildWhereMap("is_kf", "1", "="), "id,user_name", 100, "id desc");
		Map<String, String> serviceCustomerSelect = new LinkedHashMap<String,String>();
		serviceCustomerSelect.put("0","暂无客服");
		for (Map<String, String> map : kfList) {
			serviceCustomerSelect.put(map.get("id"), map.get("user_name"));
		}
		mv.addObject("serviceCustomerSelect",serviceCustomerSelect);
		
		mv.addObject("dfForm_style","width:300px;");

		
		Map<String, Object> listlevel = ConfigCache.getCacheList("cache_level");
		if(listlevel!=null){
			HashMap<String, Object> listlevelMap = Common.buildNewKVMap((Map<String, Object>) listlevel.get("level"), "key", "name");
			mv.addObject("listlevelMap",listlevelMap);
		}

		PageData pd = new PageData(request);
		
		Map<String, String> data = thisService.User_edit(pd, mv);
//		for (Map.Entry<String, String> entry : data.entrySet())
//		{
//			System.out.println("key="+entry.getKey()+", value="+entry.getValue().toString());
//		}
		mv.addObject("data", data);
		
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_editc(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		 
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void do_edit_user(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv) {
		PageData pd = new PageData(request);
		
		String flag = thisService.editUser(pd);
		
		if (!"success".equals(flag))
		{
			ajaxmsg(flag,"fail", response);
		}else{
			ajaxmsg("修改成功","success", response);
		}	
	}
	
	public ModelAndView credit_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		
		PageData pd = new PageData(request);
		Map<String, String> isUpdateSelect = new LinkedHashMap<String,String>();
		isUpdateSelect.put("no","否");
		isUpdateSelect.put("yes","是");
		mv.addObject("isUpdateSelect",isUpdateSelect);		
		mv.addObject("id",pd.get("id"));
		return this.getTplView(request,response, tplPath, mv);
	}
	public void do_credit_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		PageData pd = new PageData(request);
		String reString = thisService.do_limit_edit(pd, mv);
		if("success".equals(reString)) ajaxmsg("调整成功","success", response);
		else ajaxmsg(reString,"fail", response);
	}
	
	
	public ModelAndView money_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		PageData pd = new PageData(request);
		mv.addObject("id",pd.get("id"));
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void do_money_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		PageData pd = new PageData(request);
		String reString = thisService.do_money_edit(pd, mv);
		if("success".equals(reString)) ajaxmsg("调整成功","success", response);
		else ajaxmsg(reString,"fail", response);
	}
	
	public ModelAndView card_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		PageData pd = new PageData(request);
		mv.addObject("id",pd.get("id"));
		mv.addObject("defaultTime", Tools.TimeStamp2Date(Tools.timeAddMonth(1, Tools.getLongTime()+"")+"","yyyy-MM-dd"));
		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("1","体验金");
		typeSelect.put("2","现金券");
		typeSelect.put("3","加息券");
		typeSelect.put("4","红包");
		mv.addObject("typeSelect",typeSelect);		
		
		Map<String, Object> list = (Map<String, Object>) ConfigCache.getCacheList("Cache_cardrule");
		if (list != null){
			HashMap<String, Object> cardType = Common.buildNewKVMap((Map<String, Object>) list.get("rule"), "key", "name");
			mv.addObject("cardType",cardType);
		}
		
		
		return this.getTplView(request,response, tplPath, mv);
	}
	
	public void do_card_edit(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		PageData pd = new PageData(request);
		String reString = thisService.card_edit(pd, mv);
		if("success".equals(reString)) ajaxmsg("添加成功","success", response);
		else ajaxmsg(reString,"fail", response);
	}
	
	public ModelAndView user_name(HttpServletRequest request,HttpServletResponse response,  ModelAndView mv)
	{
		return this.showTip(mv, "error", "3", "功能暂未开放");
		/*PageData pd = new PageData(request);
		
		Map<String, Object> list = thisService.getUser_nameList(pd, mv);
		
		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);*/
	}
	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		pd.put("toExcel", "1");
		HashMap<String, Object> list = thisService.getUserList(pd, mv);
		String[] arr = {"id as ID",
				"user_name as 用户名",
				"real_name as 真实姓名",
				"user_phone as 手机号",
				"customer_name as 所属客服",
				"account_money as 可用余额",
				"money_freeze as 冻结金额",
				"money_collect as 待收金额",
				"user_leve as 会员等级",
				"reg_time as 注册时间",
				};

		Map<String, Object> listlevel = ConfigCache.getCacheList("cache_level");
		HashMap<String, Object> listlevelMap = new HashMap<>();
		if(listlevel!=null){
			listlevelMap = Common.buildNewKVMap((Map<String, Object>) listlevel.get("level"), "key", "name");
		}
		List<Map<String, Object>> SSData = (List<Map<String,Object>>)list.get("data");
		for (Map<String, Object> thisdata : SSData) {
			thisdata.put("user_leve", listlevelMap.get(thisdata.get("user_leve"))+"");
		}
		ExcelUtil.writeExcel(SSData, "会员列表", arr,response);
		
	}
	 
}
