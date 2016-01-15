package com.dfp2p.core.tag;


import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.dfp2p.core.sysConfig;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.util.CutString;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.Logger;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;


public class tplCommon {
	
	
	public static String U(String urlPath){
		String wetroot=sysConfig.getSysParm("webroot");
		String url=""+wetroot;
		String parmString="";
		//urlPath=urlPath.toLowerCase();
		//是否有参数
		if(urlPath.contains("?")){
			String[] urlSplit = urlPath.split("?");
			parmString="?"+urlSplit[1];
			urlPath=urlSplit[0];
		}

		String[] urlParm = urlPath.split("/");
		int urlParmNum=urlParm.length;
		for(int i=0;i<urlParmNum;i++){
			if(i==1||i==0) urlParm[i]=urlParm[i].toLowerCase();
			if(i==0&&urlParm[0].equals("home")) url+="";
			else if(urlParm[0].equals("admin")) url+=(i==1)?"/admin"+Common.firstLetterToUpper(urlParm[i]):((i>1)?"/"+urlParm[i]:"");
			else if(urlParm[0].equals("member")) url+=(i==1)?"/member"+Common.firstLetterToUpper(urlParm[i]):((i>1)?"/"+urlParm[i]:"");
			else if(urlParm[0].equals("thirdparty")) url+=(i==1)?"/thirdparty"+Common.firstLetterToUpper(urlParm[i]):((i>1)?"/"+urlParm[i]:"");
			else if(urlParm[0].equals("wx")) url+=(i==1)?"/wx"+Common.firstLetterToUpper(urlParm[i]):((i>1)?"/"+urlParm[i]:"");
			else  url+="/"+urlParm[i];
		}
		url+=".do"+parmString;
		return url;
	}
	
	public static String SU(String urlPath,String addStr){
		String UrlStr = urlPath+addStr;
		String url = tplCommon.U(UrlStr);
		return url;
	}
	
	public static String compareNumE(String num,String compareNum,String ifTrue,String ifFalse,String ifEq) {
		String compareResurt = "";
		if(num!=null&&compareNum!=null){
			if(DfMath.s2round(num)>DfMath.s2round(compareNum)) compareResurt=ifTrue;
			else if(DfMath.s2round(num)<DfMath.s2round(compareNum)) compareResurt=ifFalse;
			else  compareResurt=ifEq;
		}
		return compareResurt;
	}
	
	public static String compareNum(String num,String compareNum,String ifTrue,String ifFalse) {
		String compareResurt = "";
		if(num!=null&&compareNum!=null){
			if(DfMath.s2round(num)>=DfMath.s2round(compareNum)) compareResurt=ifTrue;
			else  compareResurt=ifFalse;
		}
		return compareResurt;
	}
	
	
	public static String getImgUrl(String imgUrlOld) {
		String wetroot=sysConfig.getSysParm("webroot");
		return wetroot+imgUrlOld;
	}

	public static String getThumbImgUrl(String imgUrlOld) {
		String wetroot=sysConfig.getSysParm("webroot");
		String type = Tools.getExtension(imgUrlOld);
		String imgUrlString= imgUrlOld.replace("."+type, "_thumb."+type);
		return wetroot+imgUrlString;
	}

	public static String showAdString(String adId) {
		Map<String, String> adInfo = Common.getCacheAd(adId, false);
		if(adInfo==null||!adInfo.containsKey("content")) return "";
		else return adInfo.get("content");
	}

	public static String defaultValue(Object value,String defaultValue) {
		String valueString = String.valueOf(value);
		if(valueString==null||"".equals(valueString)||"null".equals(valueString)) return defaultValue;
		else return valueString;
	}
	
	public static String subStr(String srcStr,Integer sublen) {
		String newValue = "";
		try {
			 String encode = "UTF-8";
			    // 截取10字节,不出错
			    //int sublen = 10;
			    // UTF-8字节
			    //String srcStr = "出错出hh错出错hello1出错";
			    // 先转化成char
			    char[] srcStrChars = srcStr.toCharArray();
			    int cnt = 0;
			    Charset cs = Charset.forName(encode);
			    CharBuffer cb = CharBuffer.allocate(1);
			    ByteBuffer resultBuff = ByteBuffer.allocate(sublen);
			    for (int i = 0; i < srcStrChars.length; i++) {
			      char c = srcStrChars[i];
			      cb.put(c);
			      cb.flip();
			      ByteBuffer bb = cs.encode(cb);
			      cnt += bb.array().length;
			      if(cnt > sublen){
			        break;
			      }
			      resultBuff.put(bb);
			      cb.clear();
			    }
			    newValue = new String(resultBuff.array(), encode);
		} catch (Exception e) {
			newValue="";
		}
		
		return newValue;
	}
	public static String intVal(String value) {
		String newValue = "0";
		if(value!=null&&value.contains(".")) newValue = value.substring(0,value.indexOf('.'));
		else newValue = value;
		return newValue;
	}
	public static String date(String value,String format) {
		if(StringUtils.isBlank(value)||"0".equals(value)) return "";
		String dateString = Tools.TimeStamp2Date(value, format);
		return dateString;
	}
	
	public static String hideCard(String card,String starStartS,String starEndS) {
		int cardLen = card.length();
		Integer starStart = Integer.valueOf(starStartS);
		Integer starEnd = Integer.valueOf(starEndS);
		starEnd = (starEnd>cardLen)?cardLen:starEnd;
		return card.substring(0,starStart)+StringUtils.repeat("*",starEnd-starStart)+card.substring(starEnd);
	}
	
	public static String getFloatValue(String num) {
		return Tools.getDoubleString(num);
	}
	
	public static Boolean H(String str)
	{
		String[] arr = str.split("\\/");
		String app = arr[0];
		String model = arr[1];
		String action = arr[2];
		 
		boolean permissionRes = false;

		HttpSession session = PageData.getServletRequest().getSession();
		Object adminInfo= session.getAttribute("AdminInfo");
		if(adminInfo!=null)
		{
			String adminRoleId = ((HashMap<String, String>)adminInfo).get("u_group_id");
			permissionRes = Common.getPermission(adminRoleId, app, model, action, new PageData(PageData.getServletRequest()));
		} 
		return permissionRes;
	}

	public static String ckbox(String ck,String val,String onck){
		String isCK="";
		String[] ckmenu = ck.split(",");
		List<String> tempList = Arrays.asList(ckmenu);
		if(tempList.contains(val)) isCK=onck;
		return isCK;
	}
	 /**
     * 数字金额大写转换，思想先写个完整的然后将如零拾替换成零
     * 要用到正则表达式
     */
    public static String RMB(String num){
        String fraction[] = {"角", "分"};
        String digit[] = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
        String unit[][] = {{"元", "万", "亿"},
                     {"", "拾", "佰", "仟"}};
        double n = DfMath.s2round(num);
        String head = n < 0? "负": "";
        n = Math.abs(n);
         
        String s = "";
        for (int i = 0; i < fraction.length; i++) {
            s += (digit[(int)(Math.floor(n * 10 * Math.pow(10, i)) % 10)] + fraction[i]).replaceAll("(零.)+", "");
        }
        if(s.length()<1){
            s = "整";    
        }
        int integerPart = (int)Math.floor(n);        
        for (int i = 0; i < unit[0].length && integerPart > 0; i++) {
            String p ="";
            for (int j = 0; j < unit[1].length && n > 0; j++) {
                p = digit[integerPart%10]+unit[1][j] + p;
                integerPart = integerPart/10;
            }
            s = p.replaceAll("(零.)*零$", "").replaceAll("^$", "零") + unit[0][i] + s;
        }
        return head + s.replaceAll("(零.)*零元", "元").replaceFirst("(零.)+", "").replaceAll("(零.)+", "零").replaceAll("^整$", "零元整");
    }	
}

