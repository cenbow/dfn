package com.dfp2p.core.tag;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.dfp2p.core.sysConfig;
import com.dfp2p.util.PageData;
import com.dfp2p.util.TokenHandler;


public class FormHelper {
	
	public static final String CONSTANT_CLASS = "";
	public static final String CONSTANT_STYLE = "";
	 
	public static String token()
	{
		StringBuffer sb = new StringBuffer();
		String tokenName = TokenHandler.DEFAULT_TOKEN_NAME;
		HttpServletRequest request = PageData.getServletRequest();
		Object thisTokenValue = request.getAttribute(tokenName);
		return sb.append("<input type=\"hidden\" name =\""+tokenName+"\" value=\""+(thisTokenValue==null?"":thisTokenValue)+"\" />").toString();
		
	}
	
	public static String input( String name,   String defaultValue	, String className, String style, String others)
	{
		className = convertClass(className,"INPUT");
		style = convertStyle(style);
		
		StringBuffer sb = new StringBuffer().append("<input " + others + " type=\"text\" "+className+style+" name=\""+name+"\" id=\""+name+"\" ");
		if (defaultValue != null && !"".equals(defaultValue))
		{
			sb.append("value=\""+defaultValue+"\"");
		}
		return sb.append("/>").toString();
		
	}
	
	public static String text( String name,   String defaultValue	, String className, String style, String others)
	{
		className = convertClass(className,"TEXT");
		style = convertStyle(style);
		
		StringBuffer sb = new StringBuffer().append("<textarea " + others +className+style+" name=\""+name+"\" id=\""+name+"\"></");
		if (defaultValue != null && !"".equals(defaultValue))
		{
			sb.append(defaultValue);
		}
		return sb.append("textarea>").toString();
		
	}
	 
	/**
	 * 
	 * @param name 表单名
	 * @param items 下拉框选项
	 * @param defaultValue 默认值
	 * @param className 样式名称
	 * @param style 附加样式
	 * @param others 其他属性
	 * @return
	 */
	public static String select( String name, Map<String, String> items,  String defaultValue	, String className, String style, String others)
	{
		className = convertClass(className,"SELECT");
		style = convertStyle(style);
		
		StringBuffer sb = new StringBuffer().append("<select " + others + " "+className+style+" name=\""+name+"\" id=\""+name+"\" > ");
		if(items != null)
		{
			for (Map.Entry<String, String> str : items.entrySet())
				sb.append("<option value=\""+str.getKey()+"\""+((str.getKey().equals(defaultValue))||(null==defaultValue && "".equals(str.getKey()) )?"selected=\"selected\"":"")+">"
						+str.getValue()+"</option>");
		}
		return sb.append("</select>").toString();
		
	}
	
	 
	
	public static String radio( String name, Map<String, String> items, String defaultValue, String className, String style, String others)
	{
		className = convertClass(className,"RADIO");
		style = convertStyle(style);
		
		StringBuffer sb = new StringBuffer();
		if(items != null)
		{
			int i=1;
			for (Map.Entry<String, String> str : items.entrySet()){
				String thisid=name+"_"+i;
				sb.append("<input   " + others + " type=\"radio\" "+className+style+" name=\""+name+"\" id=\""+thisid+"\""+
						(str.getKey().equals(defaultValue) ?"checked=\"checked\" ":" ")
						+"value="+str.getKey()+" /> <label  for=\""+thisid+"\" class=\"_RADIO_LABEL_CLASS_\">"+str.getValue()+"</label>");
				i++;
			}
		}
		return sb.toString();
		 
	}
	
	 
	
	public static String checkbox( String name, Map<String, String> items, String defaultValueStr
			, String className, String style, String others)
	{
		className = convertClass(className,"CHECKBOX");
		style = convertStyle(style);
		
		List<String> defaultValue = null;
		if (defaultValueStr != null)	defaultValue = Arrays.asList(defaultValueStr.split(", "));
		StringBuffer sb = new StringBuffer();
		if(items != null)
		{
			int i = 1;
			for (Map.Entry<String, String> str : items.entrySet())
			{
				String thisid=name+"_"+i;
				sb.append("<label  for=\""+thisid+"\">"+str.getValue()+"</label><input " + others + " type=\"checkbox\" "+className+style+" name=\""+name+"\" id=\""+thisid+"\" value=\""+str.getKey()+"\"");
				if (defaultValue != null && defaultValue.size()>0)
				{
						if(defaultValueStr.contains(str.getKey())) sb.append(" checked=\"checked\"");					
				}
				sb.append(" /> ");
				i++;
			}
		}
		return sb.toString();
		
	}
	private static String convertStyle(String style) {
		if (style == null || "".equals(style))
			style = "style=\""+CONSTANT_STYLE+"\"";
		else
			style = "style=\""+style+"\"";
		return style;
	}
	private static String convertClass(String className, String type) {
		
		if (className==null || "".equals(className))
			className = " class=\"_"+type+"_\" ";
		else
			className = " class=\"_"+type+"_ "+className+"\" ";
		return className;
	}
	
	public static String fetch(String param, Map map)
	{
		String str = "";
		if (map.containsKey(param))
		{
			Object obj = map.get(param);
			if (obj != null)
				str = obj.toString();
		}
		return str;
	}
	
	public static String MenuCss(String str)
	{
		return "<input type=\"hidden\" id=\"cssMenu\" value="+str+" />";
	}
	
	
	public static String editor(String name,String defaultValue,String configInput)
	{
		HttpServletRequest request = PageData.getServletRequest();
		String editorLoadTimes = (String) request.getAttribute("hasLoaderEditor");
		String inptu="";
		if(StringUtils.isBlank(editorLoadTimes)){
			request.setAttribute("hasLoaderEditor", "1");
			String wetroot=sysConfig.getSysParm("webroot");
			String editUrl = wetroot+"/Statics/editer/uedit";
			inptu="<script type=\"text/javascript\">window.UEDITOR_HOME_URL = \""+editUrl+"/\";window.UEDITOR_FILE_URL = \""+tplCommon.U("admin/uedit/index")+"?action_type=\";var _editorAll=[];</script><script type=\"text/javascript\" charset=\"utf-8\" src=\""+editUrl+"/editor_config.js\"></script><script type=\"text/javascript\" charset=\"utf-8\" src=\""+editUrl+"/editor_all_min.js\"></script>";
		}
		String Config =StringUtils.isBlank(configInput)?"":"<script type=\"text/javascript\">"+configInput+"</script>";
		inptu+="<textarea name=\""+name+"\" id=\""+name+"\">"+defaultValue+"</textarea>"+Config+"<script type=\"text/javascript\">var _editor = UE.getEditor(\""+name+"\");_editorAll.push(_editor);</script>";
		return inptu;
	}
	
}
