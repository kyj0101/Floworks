package com.kh.floworks.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertCal(String dateList) {
		return session.insert("calendar.insertCal",dateList);
	}
	
}
