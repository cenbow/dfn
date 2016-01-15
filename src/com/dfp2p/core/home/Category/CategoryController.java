package com.dfp2p.core.home.Category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.base.BaseDao;
import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.home.Article.ArticleService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Interface;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.InterestCount;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.ConfigCache;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class CategoryController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(CategoryController.class);
	public String tplPath = "Category";
	
	@Resource(name="CategoryService")
	private CategoryService thisService;
	@Resource(name="ArticleService")
	private ArticleService artService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		try {
			HashMap<String, String> categoryData = thisService.getCategoryInfo(pd.get("id"));
			List<Map<String, String>> categoryList = thisService.getCategoryTree(categoryData.get("parent_id"));
			
			mv.addObject("data", categoryData);
			mv.addObject("categoryList", categoryList);
			if("1".equals(categoryData.get("cate_type"))||"4".equals(categoryData.get("cate_type"))){
				Map<String, Object> artList = thisService.getCategoryArticle(pd.get("id"), 10);
				
				Map<String, String>  lastArticleMap = null;
				if(pd.containsKey("artid")&&!StringUtils.isBlank(pd.get("artid"))) lastArticleMap=artService.getArticleInfo(pd.get("artid"), mv);
				else lastArticleMap=thisService.getNewArticle(pd.get("id"));
				mv.addObject("artList", artList);
				mv.addObject("lastArticle",lastArticleMap);
				
				mv = this.getTplView(request,response, tplPath, mv);
				String tplPath =("1".equals(categoryData.get("cate_type")))?"/Home/Category/list":"/Home/Category/listimg";
				mv.setViewName(tplPath);
				return mv;
			}else{
				return this.getTplView(request,response, tplPath, mv);				
			}
		} catch (Exception e) {
			logger.info("栏目内容查询出错"+e.toString());
			this.showTip(mv, "error", "3000", "数据有误");
		}
		return mv;
	}
	public ModelAndView ajaxlist(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		PageData pd = new PageData(request);
		Map<String, Object> artList = thisService.getCategoryArticle(pd.get("id"), 10);
		mv.addObject("artList", artList);
		return this.getTplView(request,response, tplPath, mv);				
	}
	
}
