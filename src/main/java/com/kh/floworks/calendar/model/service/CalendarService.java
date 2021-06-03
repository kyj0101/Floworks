package com.kh.floworks.calendar.model.service;


import java.util.List;

import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectListCalendar(String id);

	int insertCalendar(Calendar cal);

}
