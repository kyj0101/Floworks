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
public class AdminServiceImpl implements AdminService{

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
	public UserDetail selectOneUserDetail(String userId) {
		return adminDao.selectOneUserDetail(userId);
	}

	

	
	

	//--강준혁 근태관리 리스트 뽑아오기
	@Override
	public List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId) {
		return adminDao.selectAttendList(param,workspaceId);
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	@Override
	public int updateAttendanceSystem(Map<String, Object> param) {
		return adminDao.updateAttendanceSystem(param);
	}

	@Override
	public List<Map<String, Object>> selectLeaveSystem(String workspaceId) {
		return adminDao.selectLeaveSystem(workspaceId);
	}


	@Override
	public int updateLeaveSystem(Map<String, Object> param) {
		return adminDao.updateLeaveSystem(param);
	}

	@Override
	public int getTotalAttendContents(String workspaceId) {
		return adminDao.getTotalAttendContents(workspaceId);
	}




	
}
