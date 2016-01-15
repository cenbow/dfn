package com.dfp2p.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;



/**
 * 日期工具类
 * ;p
 */
public class DateUtils extends org.apache.commons.lang.time.DateUtils {

	public static final String DATE_FORMAT_STR = "yyyyMMddHHmmss";
	public static final String DATE_FORMAT_FULL = "yyyy-MM-dd HH:mm:ss";

	public static final String DATE_FORMAT_PAR = "yyyy-MM-dd";
	public static final String DATE_FORMAT_YMD = "yyyyMMdd";
	public static final String DATE_FORMAT_MUL = "yyyy/MM/dd";
	
	/**
	 * 空日期
	 */
	public static final String DEFAULT_DATE_INIT = "1970-01-01 00:00:00"; 
	
	private DateUtils() {
		throw new Error("工具类不能实例化！");
	}

	/**
	 * 获取当前年月日时分秒字符串
	 * 
	 * @return 当前年月日时分秒字符串
	 */
	public static String getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_STR);
		String sDate = sdf.format(new Date());
		return sDate;
	}

	/**
	 * @Title: getCurrentDateYMD
	 * @Description: yyyyMMdd
	 * @return
	 * @return yyyyMMdd
	 */
	public static String getCurrentDateYMD() {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_YMD);
		String sDate = sdf.format(new Date());
		return sDate;
	}

	/**
	 * @Title: getCurrentDateFULL
	 * @Description: yyyy-MM-dd HH:mm:ss
	 * @return
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String getCurrentDateFULL() {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_FULL);
		String sDate = sdf.format(new Date());
		return sDate;
	}

	/**
	 * @Title: getDateFULL
	 * @Description: yyyy-MM-dd HH:mm:ss
	 * @return
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String getDateFULL(Date day) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_FULL);
		String sDate = sdf.format(day);
		return sDate;
	}

	/**
	 * @Title: getDatePAR
	 * @Description: yyyy-MM-dd
	 * @return
	 * @return yyyy-MM-dd
	 */
	public static String getDatePAR(Date day) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_PAR);
		String sDate = sdf.format(day);
		return sDate;
	}

	/**
	 * @Title: getDateYMD
	 * @Description: yyyyMMdd
	 * @return yyyyMMdd
	 */
	public static String getDateYMD(Date day) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_YMD);
		String sDate = sdf.format(day);
		return sDate;
	}

	public static Date getDateYMD(String str) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_YMD);
		Date sDate = new Date();
		try {
			sDate = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sDate;
	}
	/**
	 * 将一个日期字符串转化成日期(yyyy-MM-dd HH:mm:ss)
	 * @param sDate
	 * @return
	 */
	public static Date switchStringToDate(String sDate) {
		SimpleDateFormat df = new SimpleDateFormat(DATE_FORMAT_FULL);
		Date date = null;
		try {
			date =  df.parse(sDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * @param yyyy/MM/dd
	 * @return date
	 */
	public static Date getDateMUL(String str) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_MUL);
		Date sDate = new Date();
		try {
			sDate = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sDate;
	}
	
	/**
	 * 获取指定时间的第二天零点
	 */
    public static long getNextTime(Date date){
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		long nextTime = -1;
		try {
			nextTime = dateformat.parse(dateformat.format(cal.getTime())).getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nextTime;
    }
    
    /**
     * 去掉后带.123时间的毫秒数方法
     * @param sDate
     * @return
     * @throws ParseException 
     */
    public static String getDateStringAbortMillisecond(String sDate) throws ParseException{
     SimpleDateFormat dateformatAll = new SimpleDateFormat(DATE_FORMAT_FULL);
     Timestamp ts = new Timestamp(switchStringToDate(sDate).getTime());
     if(sDate==null){//如果时间为空返回当前时间
      return dateformatAll.format(getCurrentTimestamp());
     }
     return dateformatAll.format(ts);//格式化传过来的时间就可以去掉毫秒数
    }
    //频繁地使用new Timestamp(new Date().getTime())方法获得当前的timestamp

    public static Timestamp getCurrentTimestamp(){
     return new Timestamp(new Date().getTime());//获取当前的时间
    }
    /**
     * 转化日期
     * @param date
     * @param pattern
     * @return
     */
    public static Date switchStringToDate(String sDate, String pattern)
    {
      Date date2 = null;
      DateFormat format;
      if ((pattern == null) || ("".equals(pattern)))
        format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      else {
        format = new SimpleDateFormat(pattern);
      }
      try
      {
        date2 = format.parse(sDate);
      } catch (ParseException e) {
        e.printStackTrace();
      }
      return date2;
    }
    /**
     * 转化日期
     * @param date
     * @param pattern
     * @return
     */
    public static Date switchDateToDate(Date date, String pattern)
    {
      Date date2 = null;
      DateFormat format;
      if ((pattern == null) || ("".equals(pattern)))
        format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      else {
        format = new SimpleDateFormat(pattern);
      }
      String sDate = format.format(date);
      try
      {
        date2 = format.parse(sDate);
      } catch (ParseException e) {
        e.printStackTrace();
      }
      return date2;
    }
    
    /**
	 * @Title: getDateYMD
	 * @Description: yyyyMMdd
	 * @return yyyyMMdd
	 */
	public static String switchDateToString(Date date, String pattern) {
		DateFormat format;
		if ((pattern == null) || ("".equals(pattern)))
		        format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		else {
		        format = new SimpleDateFormat(pattern);
		}
		String sDate = format.format(date);
		return sDate;
	}
	
	public static int compareToCurrentDate(String beginDate,String endDate,String pattern){
		DateFormat format;
		if ((pattern == null) || ("".equals(pattern)))
	        format = new SimpleDateFormat("yyyy-MM-dd");
		else {
	        format = new SimpleDateFormat(pattern);
		}
		java.util.Calendar c1=java.util.Calendar.getInstance();
		java.util.Calendar c2=java.util.Calendar.getInstance();
		try
		{
			c1.setTime(format.parse(beginDate));
			c2.setTime(format.parse(endDate));
		}catch(java.text.ParseException e){
			e.printStackTrace();
		}
		int result = c1.compareTo(c2);
		return result;
	}
	
	
	//时间区间判断
	/**
	 * 
	 */
	public static int compareTime(String begin,String end ,List<String[]> dates){
		int flag = -1;
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		for(String[] strArray : dates){
			String b1 = strArray[0];
			String e1 = strArray[1];
			try {
				if(sdf.parse(begin).after(sdf.parse(b1))&&sdf.parse(begin).before(sdf.parse(e1))){
					flag= 0;
				}else if(sdf.parse(end).after(sdf.parse(b1))&&sdf.parse(end).before(sdf.parse(e1))){
					flag = 0;
				}else if(sdf.parse(begin).before(sdf.parse(b1))&&sdf.parse(end).after(sdf.parse(e1))){
					flag = 1;
				}else if(sdf.parse(b1).before(sdf.parse(begin))&&sdf.parse(e1).after(sdf.parse(end))){
					flag = 1;
				}else if(sdf.parse(begin).before(sdf.parse(e1))&&sdf.parse(end).after(sdf.parse(e1))){
					flag = 1;
				}else if(sdf.parse(begin).compareTo(sdf.parse(b1))==0&&sdf.parse(end).compareTo(sdf.parse(e1))==0){
					flag = 1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
		
	}
	
	public static boolean compTime(String s1,String s2){
		if (s1.indexOf(":")<0||s1.indexOf(":")<0) {
			System.out.println("格式不正确");
		}else{
			String[]array1 = s1.split(":");
			int total1 = Integer.valueOf(array1[0])*3600+Integer.valueOf(array1[1])*60+Integer.valueOf(array1[2]);
			System.out.println(total1);
			String[]array2 = s2.split(":");
			int total2 = Integer.valueOf(array2[0])*3600+Integer.valueOf(array2[1])*60+Integer.valueOf(array2[2]);
			System.out.println(total2);
			return total1-total2>=0?true:false;
		}
			return false;
		}
	
	/**
     * 时间戳转换成日期格式字符串
     * @param seconds 精确到秒的字符串
     * @param formatStr
     * @return
     */
	public static String timeStamp2Date(String seconds,String format) {
		if(seconds == null || seconds.isEmpty() || seconds.equals("null")){
			return "";
		}
		if(format == null || format.isEmpty()) format = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date(Long.valueOf(seconds+"000")));
	}
	/**
	 * 日期格式字符串转换成时间戳
	 * @param date 字符串日期
	 * @param format 如：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String date2TimeStamp(String date_str,String format){
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return String.valueOf(sdf.parse(date_str).getTime()/1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 取得当前时间戳（精确到秒）
	 * @return
	 */
	public static String timeStamp(){
		long time = System.currentTimeMillis();
		String t = String.valueOf(time/1000);
		return t;
	}
	
	/**
	 * 获取2日期相隔天数
	 * @param args
	 */
	public static long getDistanceDay(String sDate,String tDate){
		long day=0;
		   //日期相减算出秒的算法
		   try {
		    Date date0 = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
		    Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(tDate);
		    long l = date0.getTime()-date1.getTime()>0 ? date0.getTime()-date1.getTime():
		    date1.getTime()-date0.getTime();
		     
		    //System.out.println(l/1000+"秒");
		     
		    //日期相减得到相差的日期
		    day = (date0.getTime()-date1.getTime())/(24*60*60*1000)>0 ? (date0.getTime()-date1.getTime())/(24*60*60*1000):
		    (date1.getTime()-date0.getTime())/(24*60*60*1000);
		  
		    //System.out.println("相差的日期: " +day);
		   } catch (ParseException e) {
		    e.printStackTrace();
		   }
		   return day;
	}
	
	//  输出结果：
	//	timeStamp=1417792627
	//	date=2014-12-05 23:17:07
	//	1417792627
	public static void main(String[] args) {
		String timeStamp = timeStamp();
		System.out.println("timeStamp="+timeStamp);
		
		String date = timeStamp2Date(timeStamp, "yyyy-MM-dd HH:mm:ss");
		System.out.println("date="+date);
		
		//String timeStamp2 = date2TimeStamp(getDateFULL(switchStringToDate("2015-07-16 13:19")), "yyyy-MM-dd HH:mm:ss");
		//System.out.println(timeStamp2);
		
		long d = getDistanceDay("2015-08-01","2015-09-02");
		System.out.println(d);
		
	}
}