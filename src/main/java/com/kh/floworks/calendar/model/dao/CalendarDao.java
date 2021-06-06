package com.kh.floworks.calendar.model.dao;

import java.util.List;

import com.kh.floworks.calendar.model.vo.Calendar;


public interface CalendarDao {

	List<Calendar> selectListCalendar(String id);

	int insertCalendar(Calendar cal);

	int updateCalendar(Calendar cal);

	int deleteCalendar(int no);

}
