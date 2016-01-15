package com.dfp2p.other;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.enterprise.inject.New;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.commons.codec.binary.Base64;  

import com.dfp2p.fun.Common.borrowAndInvest;
public class DfHttpClient {
	private static Log logger = LogFactory.getLog(DfHttpClient.class);

	private DfHttpClient() {

	}

	public static String doGet(String url) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		/* 建立HTTP Post连线 */
		HttpGet httpGet = new HttpGet(url);
		logger.debug("doGet URI:"+httpGet.getURI());
		try {
			HttpResponse httpResponse = httpClient.execute(httpGet);
			if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				return EntityUtils.toString(httpResponse.getEntity());
			} else {
				logger.error("doGet Error Response: "+ httpResponse.getStatusLine().toString());
			}
		} catch (Exception e) {
			logger.error("doGet 获取数据错误:"+e.toString());
		}finally{
			try {
				httpClient.close();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				logger.error("doGet关闭连接失败："+e.toString());
			}
		}
		return null;
	}

	
	public static String doPost(String Url) {
		return doPost(Url, new ArrayList<BasicNameValuePair>(),"UTF-8");
	}
	
	public static String doPost(String url,HashMap<String, String> postData) {
		List<BasicNameValuePair>postValue = new LinkedList<>();
		for(Map.Entry<String, String> entry:postData.entrySet()){
			postValue.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return doPost(url, postValue,"UTF-8");
	}
	
	public static String doPost(String url,HashMap<String, String> postData,String charSet) {
		List<BasicNameValuePair>postValue = new LinkedList<>();
		for(Map.Entry<String, String> entry:postData.entrySet()){
			postValue.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return doPost(url, postValue,charSet);
	}

	public static String doPost(String url, List<BasicNameValuePair> data,String charSet) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		/* 建立HTTP Post连线 */
		HttpPost httpPost = new HttpPost(url);
		logger.debug("doPost URI:"+httpPost.getURI());
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(data, charSet));
			HttpResponse httpResponse = httpClient.execute(httpPost);
			// 发出HTTP request
			// httpPost.setEntity(new UrlEncodedFormEntity(data, HTTP.UTF_8));
			// 取得HTTP response
			// 若状态码为200 ok
			if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				// 取出回应字串
				return EntityUtils.toString(httpResponse.getEntity());
			} else {
				logger.error("doPost Error Response: " + httpResponse.getStatusLine().toString());
			}
		} catch (Exception e) {
			logger.error("doPost 获取数据错误："+e.toString());
		}finally{
			try {
				httpClient.close();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				logger.error("doPost关闭连接失败："+e.toString());
			}
		}
		return null;
	}
	
	public static String encrypt(String co) {
		String keyString="ad222715";
		String coded="";
		int keylength = keyString.length();
		for (int i = 0; i < co.length(); i+=keylength) {
			int endIndex = (keylength>co.length())?co.length():keylength;
			System.out.print(co.substring(i, endIndex)+"#\r\n");
			coded += setEncrypt(co.substring(i, endIndex),keyString);
			System.out.print(coded.length()+"@\r\n");
		}
		String reString="";
		try {
			String reBT =org.apache.commons.net.util.Base64.encodeBase64String(coded.substring(0, coded.length()-4).getBytes("UTF-8"));
			reString = reBT.replace("=", "");
			System.out.print("密码："+reString);
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return reString;
	}
	
	public static String yh(String strOld, String strKey) {
		try {
			byte[] data = strOld.getBytes("UTF-8");
			byte[] keyData = strKey.getBytes("UTF-8");
			int keyIndex = 0 ;
			for(int x = 0 ; x < strOld.length() ; x++) {
				data[x] = (byte)(data[x] ^ keyData[keyIndex]);
				if (++keyIndex == keyData.length){
					keyIndex = 0;
				}
			}
			String xe = new String(data);
			System.out.print(xe+"\r\n");
			return new String(data,"UTF-8");
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			return "sseff";
		}
		} 
	
	public static String setEncrypt(String str,String sn){
        int[] snNum=new int[str.length()];
        String result="";
        String temp="";

        for(int i=0,j=0;i<str.length();i++,j++){
            if(j==sn.length())
                j=0;
            snNum[i]=str.charAt(i)^sn.charAt(j);
        }

        for(int k=0;k<str.length();k++){

            if(snNum[k]<10){
                temp="00"+snNum[k];
            }else{
                if(snNum[k]<100){
                    temp="0"+snNum[k];
                }
            }
            result+=temp;
        }
        return result;
    }

}

