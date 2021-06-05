package com.kh.floworks.calendar.model.service;


import java.util.List;

import com.kh.floworks.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectListCalendar(String id);

	int insertCalendar(Calendar cal);

	int updateCalendar(Calendar cal);

	int deleteCalendar(int no);

}
