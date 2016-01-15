package com.dfp2p.core.home.Article;

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
public class ArticleController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(ArticleController.class);
	public String tplPath = "Article";
	
	@Resource(name="ArticleService")
	private ArticleService thisService;
	
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {		
		PageData pd = new PageData(request);
		HashMap<String, String> articleData=new HashMap<>();
		logger.info(pd.get("id")+"###########");
		try {
			articleData = thisService.getArticleInfo(pd.get("id"), mv);
			HashMap<String, String> categoryData = thisService.getCategoryInfo(articleData.get("cat_id"));
			List<Map<String, String>> categoryList = thisService.getCategoryTree(categoryData.get("parent_id")+"");
			mv.addObject("categoryList", categoryList);
			mv.addObject("categoryData", categoryData);
		} catch (Exception e) {
			this.showTip(mv, "error", "3", "数据有误");
		}
		mv.addObject("data", articleData);
		return this.getTplView(request,response, tplPath, mv);
	}	
	
	public ModelAndView ajaxart(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {	
		PageData pd = new PageData(request);
		HashMap<String, String> articleData=new HashMap<>();
		try {
			articleData = thisService.getArticleInfo(pd.get("id"), mv);
		} catch (Exception e) {
			articleData.put("title", "数据有误");
			articleData.put("content", "数据有误");
		}
		mv.addObject("Article", articleData);
		return this.getTplView(request,response, tplPath, mv);				
	}
	
}
