package com.dfp2p.core.admin.Attachment;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.User.AdminUserService;
import com.dfp2p.util.PageData;

@Controller
public class AdminAttachmentController extends BaseAdminController {
	public String tplPath = "Attachment";
	
	@Resource(name="adminAttachmentService")
	private AdminAttachmentService thisService;
	
	/**
	 * <option value="" selected="selected">所有</option>
<option value="1">后台编辑器上传</option>
<option value="2">后台涂鸦上传</option>
<option value="3">后台涂鸦作品</option>
<option value="4">后台上传符件</option>
<option value="5">后台流转标swf上传</option>
<option value="6">会员上传身份证</option>
<option value="7">会员资料上传</option>
<option value="8">后台上传水印图片</option>
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> event_typeSelect = new LinkedHashMap<String,String>();
		event_typeSelect.put("","所有");
		event_typeSelect.put("1","后台编辑器上传");
		event_typeSelect.put("2","后台涂鸦上传");
		event_typeSelect.put("3","后台涂鸦作品");
		event_typeSelect.put("4","后台上传符件");
		event_typeSelect.put("5","后台流转标swf上传");
		event_typeSelect.put("6","会员上传身份证");
		event_typeSelect.put("7","会员资料上传");
		event_typeSelect.put("8","后台上传水印图片");
		mv.addObject("event_typeSelect",event_typeSelect);
		
		Map<String, String> extensionSelect = new LinkedHashMap<String,String>();
		extensionSelect.put("","所有");
		extensionSelect.put("jpeg","jpeg");
		extensionSelect.put("jpg","jpg");
		extensionSelect.put("png","png");
		mv.addObject("extensionSelect",extensionSelect);
		
		Map<String, String> userTypeSelect = new LinkedHashMap<String,String>();
		userTypeSelect.put("","所有");
		userTypeSelect.put("admin","后台");
		userTypeSelect.put("user","前台");
		mv.addObject("userTypeSelect",userTypeSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getAttachmentList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}
	public ModelAndView user_edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return this.getTplView(request,response, tplPath, mv);
	}
	
	
}
