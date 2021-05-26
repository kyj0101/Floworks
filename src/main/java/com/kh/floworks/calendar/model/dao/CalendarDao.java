package com.kh.floworks.calendar.model.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.vo.Calendar;

public interface CalendarDao {

	Object insertCalendar(Model model);

	List<Calendar> showSchedule(String id);

	void addSchedule(Calendar vo);

}
