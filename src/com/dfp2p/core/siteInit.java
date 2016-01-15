package com.dfp2p.core;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;

import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.Tools;
import com.dfp2p.util.crypt.EncryptClasses;
import com.dfp2p.util.crypt.GenerateKey;

public class siteInit extends HttpServlet {
	private static Log logger = LogFactory.getLog(siteInit.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	private ServletConfig config;

	
	public void init(ServletConfig config) throws ServletException {
		String realPathString=config.getServletContext().getRealPath("/");
		String c3p0xmlPath = realPathString + "/WEB-INF/c3p0-config.xml";
		String log4jPath = realPathString + "/WEB-INF/log4j.properties";
//		this.config = config;
//		this.init();
		System.setProperty("com.mchange.v2.c3p0.cfg.xml", c3p0xmlPath);//设置c3p0xml的路径
		PropertyConfigurator.configure(log4jPath);//加载log4j配置文件路径
		
		//设置缓存类型
		System.setProperty("isMemCached", "false");//使用memCached
		System.out.print("^^^^^^^^^^^^^^^^^"+realPathString);
		//writeTxtFile(realPathString,"/Tomcat7/pathlog.txt");
		
		
		//设置全局相对地址
		sysConfig.setSysParm("webroot", config.getServletContext().getContextPath());
		//设置全局相对地址
		sysConfig.setSysParm("webrootPath", realPathString);
		
		//缓存数据库信息
		new DataBaseMeta().fillFieldIntoCache();
		//生成视图
		Common.buildView();
		
     }
	
	public static void writeTxtFile(String content,String  fileName){  
		SimpleDateFormat timeStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		File f = new File(fileName);  
		FileWriter fw;
	    	   		try {
	       if (f.exists()) {  
	            //System.out.print("文件存在");  
						fw = new FileWriter(f, true);
				
	       } else {  
	            //System.out.print("文件不存在");  
	            f.createNewFile();// 不存在则创建  
	            fw = new FileWriter(f);
	       }
	       fw.write("\r\n时间："+timeStr.format(new Date())+"###");
	       fw.write(content);
	       fw.close();
	    	   		} catch (IOException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}		  
		 }  	
	
}
