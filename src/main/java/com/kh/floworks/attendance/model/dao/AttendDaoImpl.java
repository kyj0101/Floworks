package com.kh.floworks.attendance.model.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.board.model.dao.BoardDaoImpl;
import com.kh.floworks.board.model.vo.Post;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AttendDaoImpl implements AttendDao {
	
	@Autowired
	private SqlSession session;
	
	
}
