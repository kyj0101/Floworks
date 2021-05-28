package com.kh.floworks.attendance.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.floworks.attendance.model.dao.AttendDao;

public class AttendServiceImpl implements AttendService {

	@Autowired
	AttendDao attendDao;
}
