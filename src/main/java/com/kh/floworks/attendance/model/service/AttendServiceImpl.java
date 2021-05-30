package com.kh.floworks.attendance.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.attendance.model.dao.AttendDao;
import com.kh.floworks.board.model.service.BoardServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttendServiceImpl implements AttendService {

	@Autowired
	AttendDao attendDao;
}
