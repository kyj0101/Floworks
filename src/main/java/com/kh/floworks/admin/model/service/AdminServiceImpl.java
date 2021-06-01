package com.kh.floworks.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.admin.model.dao.AdminDao;
import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	
	@Override
	public List<UserList> selectUserList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<UserDetail> selectOneDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AttendList> selectAttendList() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
