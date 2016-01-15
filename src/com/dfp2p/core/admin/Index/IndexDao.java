package com.dfp2p.core.admin.Index;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.PageData;

@Repository
public class IndexDao {
	private static Log logger = LogFactory.getLog(IndexDao.class);
	public Long insertUser(Connection conn, Map<String, Object> map) {
		Long key = 0l;
		logger.info("inset:"+map);
		try {
			key = T.load("`user`", conn).I(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return key;
	}

	public DataSet queryUser(Connection conn) throws NumberFormatException, SQLException {
		return T.load("`user`", conn).Q();
	}

	public DataSet queryOne(Connection conn, String paramCondition) throws NumberFormatException, SQLException {
		return T.load("`user`", conn).Q(paramCondition);
	}

	public Long update(Connection conn, Map<String, Object> paramField, String paramCondition) throws SQLException {
		return T.load("`user_test`", conn).U(paramField);
	}

	public Long delete(Connection conn, String paramCondition) throws SQLException {
		return T.load("`user_test`", conn).D(paramCondition);
	}
}
