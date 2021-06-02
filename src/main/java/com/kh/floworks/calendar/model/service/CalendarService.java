package com.kh.floworks.calendar.model.service;

import java.util.Map;
import java.util.List;

import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.vo.Calendar;

public interface CalendarService {

	int insertCal(Map<String, Object> calendarDate);

	int insertCal(String dateList);


}
