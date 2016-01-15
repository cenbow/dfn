package com.dfp2p.core.home.Index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseService;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.home.Category.CategoryService;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.JacksonUtil;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller(value="/")
public class IndexController extends BaseHomeController {
	public String tplPath = "Index";
	@Resource(name="IndexService")
	private IndexService thisService;
	@Resource(name="CategoryService")
	private CategoryService categoryService;
	
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		mv.addObject("currentTime", Tools.getLongTime());
	
		PageData pd = new PageData(request);
		HashMap<String, Object> borrowList = thisService.getBorrowList(pd, mv);
		mv.addObject("borrowList", borrowList);
		
		HashMap<String, Object> xborrow = thisService.getXBorrowList();
		mv.addObject("xborrow",xborrow.get("data"));
		//logger.info("s当是人城"+xborrow);
		
		HashMap<String, String> indexFlashAd = (HashMap<String, String>) Common.getCacheAd("51", false);
		if(!Common.isBlankInMap(indexFlashAd, "content")) mv.addObject("indexAdImgs",  (List<HashMap<String, String>>) JacksonUtil.listFromJson(indexFlashAd.get("content")));
		
		//网站公告
		Map<String, Object> notice = categoryService.getCategoryArticle("427", 6);
		mv.addObject("notice", notice);
		//公司动态
		Map<String, Object> trace = categoryService.getCategoryArticle("389", 3);
		mv.addObject("trace", trace);
		//新闻动态
		Map<String, Object> news = categoryService.getCategoryArticle("377", 6);
		mv.addObject("news", news);
		//图片新闻
		Map<String, Object> imgnews = categoryService.getCategoryArticleImg("539", 6);
		mv.addObject("imgnews", imgnews);
		
		WhereUtil mapUtil=new WhereUtil();
		mapUtil.getStringCondition("borrow_status", "2,4,6,7", "in");
		Map<String, String> summary = BaseService.getOne("borrow_info", mapUtil.getParamConditionList(), "sum(repayment_interest) as repayment_interest,sum(borrow_money) as borrow_money");
		Map<String, String> userSum = BaseService.getOne("user", Tools.BuildWhereMap("id", "0", ">"), "count(id) as num");
		Tools.printData(summary);
		summary.put("user_count", userSum.get("num"));
		mv.addObject("summary", summary);
		
		return this.getTplView(request,response, tplPath, mv);
	}
}
