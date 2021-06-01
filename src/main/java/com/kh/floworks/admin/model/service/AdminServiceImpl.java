package com.kh.floworks.admin.model.service;

import java.util.List;
import java.util.Map;

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
	public List<UserList> selectUserList(Map<String, Object> param, String workspace) {
		return adminDao.selectUserList(param, workspace);
	}

	@Override
	public int getTotalContents(String workspace) {
		return adminDao.getTotalContents(workspace);
		
	}

	

	@Override
	public List<AttendList> selectAttendList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	@Override
	public int updateAttendanceSystem(Map<String, Object> param) {
		return adminDao.updateAttendanceSystem(param);
	}









	
}
