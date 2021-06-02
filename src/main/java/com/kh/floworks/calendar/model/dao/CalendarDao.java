package com.kh.floworks.calendar.model.dao;


import java.util.Map;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.vo.Calendar;


public interface CalendarDao {

	int insertCal(Map<String, String> param);


}
