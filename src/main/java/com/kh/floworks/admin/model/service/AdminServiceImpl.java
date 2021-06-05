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
	
	@Override
	public List<String> selectAllMemberAttendanceYear(String workspaceId) {
		return adminDao.selectAllMemberAttendanceYear(workspaceId);
	}

	@Override
	public List<String> selectAllMemberAttendanceMonth(String workspaceId) {
		return adminDao.selectAllMemberAttendanceMonth(workspaceId);
	}
	
	@Override
	public List<Map<String, Object>> selectLeaveSystem(String workspaceId) {
		return adminDao.selectLeaveSystem(workspaceId);
	}
	
	//--강준혁 근태관리 리스트 뽑아오기
	@Override
	public List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId) {
		return adminDao.selectAttendList(param,workspaceId);
	}
	
	@Override
	public Map<String, Object> selectOneAttend(Map<String, Object> param) {
		return adminDao.selectOneAttend(param);
	}
	
	@Override
	public List<AttendList> selectSearchAttendList(Map<String, Object> param) {
		return adminDao.selectSearchAttendList(param);
	}
		
	@Override
	public int userUpdate(UserDetail userDetail) {
		return adminDao.userUpdate(userDetail);
	}


	@Override
	public int memberUpdate(UserDetail userDetail) {
		return adminDao.memberUpdate(userDetail);
	}

	@Override
	public int updateAttendanceSystem(Map<String, Object> param) {
		return adminDao.updateAttendanceSystem(param);
	}

	@Override
	public int updateLeaveSystem(Map<String, Object> param) {
		return adminDao.updateLeaveSystem(param);
	}
	

	@Override
	public int updateAttend(Map<String, Object> param) {
		return adminDao.updateAttend(param);
	}


	@Override
	public int getTotalAttendContents(String workspaceId) {
		return adminDao.getTotalAttendContents(workspaceId);
	}

	@Override
	public int getTotalSearchAttendContents(Map<String, Object> param) {
		return adminDao.getTotalSearchAttendContents(param);
	}

	
}
