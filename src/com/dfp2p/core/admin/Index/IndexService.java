package com.dfp2p.core.admin.Index;

import java.sql.Connection;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.DataBase;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.Parameter;
import com.dfp2p.util.PageData;

@Service("indexService")
public class IndexService {

	private static Log logger = LogFactory.getLog(IndexService.class);

	@Resource
	private IndexDao indexDao;

	public Long addUser(PageData pd) {
		Connection conn = MySQL.getConnectionReadOnly(false);
		Long key = 0l;

		try {
			key = indexDao.insertUser(conn, pd);

			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("添加用户失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}

		return key;
	}
	
	public DataSet findUser(){
		Connection conn = MySQL.getConnectionReadOnly(true);
		DataSet key = null;
		try {
			DataBase.executeQuery(conn, "select sleep(10)",new Parameter[0]);
			logger.info("是否自动投资："+conn.getAutoCommit());
			key = indexDao.queryUser(conn);

			MySQL.commit(conn);
		} catch (Exception e) {
			MySQL.rollback(conn);
			logger.error("添加用户失败", e);
		} finally {
			MySQL.closeConnection(conn);
		}

		return key;
	}

}
