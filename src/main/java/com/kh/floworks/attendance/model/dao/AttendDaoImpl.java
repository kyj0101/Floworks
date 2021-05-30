package com.kh.floworks.attendance.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.board.model.dao.BoardDaoImpl;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AttendDaoImpl implements AttendDao {
	
	@Autowired
	private SqlSession session;
	
}
