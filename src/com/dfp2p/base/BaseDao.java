package com.dfp2p.base;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.DataBaseMeta;
import com.dfp2p.util.DfMath;
import com.dfp2p.util.PHPSerializer;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.mySql.data.DataException;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.Field;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;


@Repository("baseDao")
public class BaseDao {
	
	
	private static Log logger = LogFactory.getLog(BaseDao.class);
	
	/**
	 * 插入一行到数据库，Map集合包含所有的字段名称和值
	 * @param conn
	 * @param tableName
	 * @param map
	 * @return
	 * @throws SQLException 
	 */
	public static Long insert(Connection conn,String tableName, Map<String, Object> map) throws SQLException {
		logger.info("insert: "+map);
		Long key =  T.load(tableName, conn).I(map);
		return key;
	}
	
	/**
	 * 插入一行到数据库，Map集合包含没有默认的字段名称和值,
	 * @param conn
	 * @param tableName 表名
	 * @param map 包含字段名和值得Map对象
	 * @return
	 * @throws SQLException 
	 */
	public Long insertOneDefault(Connection conn,String tableName, Map<String, Object> map) throws SQLException {
		logger.info("insert(default value): "+map);
		Long key  = T.load(tableName, conn).I(map);
		return key;
	}
	

	/**
	 * 查询数据表的所有值
	 * @param conn
	 * @param table 表名
	 * @return 一个包含了结果集的DataSet对象
	 * @throws SQLException 
	 * @throws NumberFormatException 
	 */
	public DataSet queryList(Connection conn,String table) throws NumberFormatException, SQLException {
		logger.info("queryList*: "+table);
		return T.load(table, conn).Q();
	}

	
	/**
	 * 按条件查询一行或多行数据
	 * @param conn
	 * @param table 表名
	 * @param paramCondition 查询条件
	 * @return 一个包含了结果集的DataSet对象
	 * @throws SQLException 
	 * @throws NumberFormatException 
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 */
	public DataSet queryList(Connection conn,String table, List<Object[]> paramCondition) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		logger.info("queryList: "+table +"  condition: " + paramCondition);
		return T.load(table, conn).W(paramCondition).Q();
	}
	
	/**
	 * 按条件查询一行数据
	 * @param conn
	 * @param table 表名
	 * @param paramCondition 查询条件
	 * @return 一个包含了结果集的DataSet对象
	 * @throws SQLException 
	 * @throws NumberFormatException 
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 */
	public DataSet queryOne(Connection conn,String table, List<Object[]> paramCondition) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		return queryList(conn, table, paramCondition);
	}

	/**
	 * 查询单值
	 * @param conn
	 * @param table 表名
	 * @param paramField 表达式
	 * @param paramCondition 条件 ，为null时指无条件
	 * @return
	 * @throws SQLException 
	 * @throws NumberFormatException 
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 */
	public DataSet queryScalar(Connection conn, String table, String paramField, List<Object[]> paramCondition) throws NumberFormatException, SQLException, ClassNotFoundException, IOException {
		logger.info("queryScalar: "+table +"  field: " + paramField + "  condition: " + paramCondition);
		return T.load(table, conn).W(paramCondition).Q(paramField);
	}
	
	
	
	
	
	
	
	/**
	 *  修改数据,返回的被修改的行数
	 * @param conn
	 * @param table 表名
	 * @param paramField 修改内容
	 * @param paramCondition 
	 * @return 
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 * @throws DataException 
	 */
	public static Long update(Connection conn,String table, Map<String, Object> paramFields, List<Object[]> paramCondition) throws SQLException, ClassNotFoundException, IOException, DataException {
		String priName = getTablePriName(table);
		boolean whereIsNull = (paramCondition==null);
		if(whereIsNull) paramCondition= new ArrayList<Object[]>();
		Map<String, Object> updateFieldMap=new HashMap<String, Object>();
		for(Entry<String, Object> entry : paramFields.entrySet())
		{
			Object fieldValueObject = entry.getValue();
			String fieldName = entry.getKey();
			if(fieldValueObject instanceof Map){
				updateFieldMap.put(fieldName, fieldValueObject);
			}else{
				String value =  entry.getValue()+"";
				if(fieldName.equals(priName) && whereIsNull){
					paramCondition.add(new String[]{fieldName,"`"+value+"`","=","and"});
				}else{
					updateFieldMap.put(fieldName, value);
				}
			}
		}
		if(paramCondition.size()==0){
				throw new DataException("没有查询条件");
		}
		logger.info("update: " + table +"  condition: " + paramCondition+" condition_len:"+paramCondition.size() +"   field: ");
		return T.load(table, conn).W(paramCondition).U(updateFieldMap);
	}
	
	
	
	
	
	
	/**
	 * 删除数据
	 * @param conn
	 * @param table 表名
	 * @param paramCondition 删除条件
	 * @return 删除的行数
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 */
	public Long delete(Connection conn,String table, Map<String, Object> paramFields) throws SQLException,DataException, ClassNotFoundException, IOException {
		List<Object[]> paramCondition= new ArrayList<Object[]>();
		//String priName = this.getTablePriName(table);
		for(Map.Entry<String, Object> entry : paramFields.entrySet())
		{
			String value =  (String) entry.getValue();
			String fieldName = entry.getKey();
			paramCondition.add(new String[]{fieldName,"`"+value+"`","=","and"});
		}
		logger.info("delete: " + table +"  condition: " + paramCondition );
		return T.load(table, conn).W(paramCondition).D();
	}
	

	public static String getTablePriName(String tableName){
		Map<String, Field> metaData = new DataBaseMeta(tableName).get();
		for (Map.Entry<String, Field> entry :metaData.entrySet())
		{
			Field field = entry.getValue();
			String keyStr = field.keyStr;
			if ("pri".equalsIgnoreCase(keyStr))
			{
				String fieldName = field.name;
				return fieldName;
			}
		}
		return null;
	}

	public static String parseTime(String timeMillis) {
			if(timeMillis !=null && !"0".equals(timeMillis))		timeMillis = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(Long.parseLong(timeMillis)*1000) );
			else timeMillis="--";
			return timeMillis;
	}

	public static String parseDate(String timeMillis) {
			if(timeMillis !=null && !"0".equals(timeMillis))		timeMillis = new SimpleDateFormat("yyyy-MM-dd").format(new Date(Long.parseLong(timeMillis)*1000) );
			else timeMillis="--";
			return timeMillis;
	}

	public void parsePHPSerializer(List<Map<String, String>> list, String field) {
		for(Map<String, String> map0:list)
		{
			String str = map0.get(field);
			if(str !=null && !"".equals(str))
			{
				
				try {
					Object obj = (Map) PHPSerializer .unserialize(str.getBytes());
					if (obj instanceof Map)
					{
						Map<String, Object> objMap = (Map<String, Object>)obj;
						for (Map.Entry<String, Object> o : objMap.entrySet())
						{
							
							map0.put(o.getKey(), o.getValue()!=null?o.getValue().toString():"");
						}
					}
					else if (obj instanceof List)
					{
						System.out.println("PHP反序列化错误");
					}
//					Tools.printData( map);;
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
				
			}
		}
	}
	public Map<String, Object> parsePHPSerializerToMap(List<Map<String, String>> list, String field) {
		Map<String, Object>temp = new HashMap<String, Object>();
		for(Map<String, String> map0:list)
		{
			String str = map0.get(field);
			if(str !=null && !"".equals(str))
			{
				
				try {
					Object obj = (Map) PHPSerializer .unserialize(str.getBytes());
					if (obj instanceof Map)
					{
						Map<Object, Object> objMap = (Map<Object, Object>)obj;
						for (Map.Entry<Object, Object> o : objMap.entrySet())
						{
							
							temp.put(o.getKey().toString(), o.getValue()!=null?o.getValue().toString():"");
						}
					}
					else if (obj instanceof List)
					{
						System.out.println("PHP反序列化错误");
					}
//					Tools.printData( map);;
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
				
			}
		}
		return temp;
	}
	
	public static Map<String, String> checkFieldMap(Connection conn,
			HashMap<String, Object> rp, String table, String param) throws NumberFormatException, ClassNotFoundException, SQLException, IOException {
		List<Map<String,String>> list = null;
		String paramField = param;
		List<Object[]> paramCondition =  (List<Object[]>) rp.get("paramCondition");
		
		DataSet ds = T.load(table+" t", conn).W(paramCondition).Q(paramField); 
		list = BeanMapUtils.dataSetToListMap(ds);
		return list!=null?list.get(0):null;
	}
	
	public void parseResultDate(List<Map<String, String>> list,String[] arr)
	{
		if(arr.length!=0)
			for(Map<String, String> map:list)
				for (String str:arr)
					if(!"0".equals(map.get(str)))
						map.put(str,parseTime(map.get(str)));
	}

	
	public static Long IM(String table,List<Map<String, Object>>insertData,int num,Connection conn) {
		//数据库查询部分
		Long resCount=0l;
		double count = Math.ceil(DfMath.s2div(insertData.size()+"",num+"",10));
		int ex = insertData.size()%300;
		
		for (int i = 0; i < count; i++) {
			List<Map<String, Object>> thisList;
			if(ex>0&&(i+1)==count) thisList = insertData.subList(i*num, i*num+ex);
			else thisList = insertData.subList(i*num, (i+1)*num);
			try {
				resCount = T.load(table, conn).I(insertData);
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				logger.error("批量插入失败:Table="+table+",首行数据="+insertData.get(0)+"e="+e.toString());
			}
		}
		return resCount;
	}
	
	public static String addOne(String tableName,HashMap<String, Object> Idata,Connection conn) {
		long res =0l;
		try{
			res = T.load(tableName, conn).I(Idata);
		} catch (Exception e) {
			logger.error("addOne失败", e);
			return "fail";
		} 
		return "success";		
	}
	
	public static Map<String, String> getOne(String tableName,List<Object[]>map,String field,String orderBy,int start,int num,Connection conn) {
		Map<String, String> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).O(orderBy).L(start, num).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getOne失败", e);
			res=null;
		} 
		return res;		
	}
	
	public static Map<String, String> getOne(String tableName,List<Object[]>map,String field,String orderBy,Connection conn) {
		Map<String, String> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).O(orderBy).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getOne失败", e);
			res=null;
		} 
		return res;		
	}
	
	public static Map<String, String> getOne(String tableName,List<Object[]>map,String field,Connection conn) {
		Map<String, String> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds).get(0);
		} catch (Exception e) {
			logger.error("getOne失败", e);
			res=null;
		} 
		return res;		
	}
	
	public static List<Map<String, String>> getList(String tableName,List<Object[]>map,String field,int limit,String orderBy,Connection conn) {
		List<Map<String, String>> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).L(0, limit).O(orderBy).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds);
		} catch (Exception e) {
			logger.error("getList失败", e);
			res=null;
		} 
		return res;		
	}
	
	public static List<Map<String, String>> getList(String tableName,List<Object[]>map,String field,int limit,Connection conn) {
		List<Map<String, String>> res =null;
		try{
			DataSet ds = T.load(tableName, conn).W(map).L(0, limit).Q(field);
			res=BeanMapUtils.dataSetToListMap(ds);
		} catch (Exception e) {
			logger.error("getList失败", e);
			res=null;
		} 
		return res;		
	}
	
}
