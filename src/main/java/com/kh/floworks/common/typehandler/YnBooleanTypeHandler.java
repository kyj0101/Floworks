package com.kh.floworks.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;


/**
 * boolean <-------> CHAR (Y | N)
 * @author despe
 *
 */
@MappedTypes(boolean.class)
@MappedJdbcTypes(JdbcType.CHAR)
public class YnBooleanTypeHandler extends BaseTypeHandler<Boolean> {

	/**
	 * PrepareStatement의 ?를 세팅
	 * boolean ---> setString
	 */
	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Boolean parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, parameter ? "Y" : "N");
	}

	@Override
	public Boolean getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return "Y".equals(rs.getString(columnName));
	}

	@Override
	public Boolean getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return "Y".equals(rs.getString(columnIndex));
	}

	@Override
	public Boolean getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		return "Y".equals(cs.getString(columnIndex));
	}

}
