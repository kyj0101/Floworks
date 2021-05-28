package com.kh.floworks.attendance.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class AttendDaoImpl implements AttendDao {
	
	@Autowired
	private SqlSession session;
	
}
