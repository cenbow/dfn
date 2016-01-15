package com.dfp2p.core;

import java.util.HashMap;

public class sysConfig {
	public static  HashMap<String, String> sysParm = new HashMap<String, String>();
	
	public static String getSysParm(String key){
		return sysParm.get(key);
	}
	
	public static void setSysParm(String key,String value) {
		sysParm.put(key, value);
	}
	

}
