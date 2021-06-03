
package com.kh.floworks.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;


import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;


public interface AdminService {


	List<UserList> selectUserList(Map<String, Object> param, String workspace);

	int getTotalContents(String workspace);
	
	UserDetail selectOneUserDetail(String userId);
	
	//직원 정보수정 테이블이 두개라 두개로 나눔
	int userUpdate(UserDetail userDetail);
	int memberUpdate(UserDetail userDetail);


	


	List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	
	int updateAttendanceSystem(Map<String, Object> param);


	
	

	

	List<Map<String, Object>> selectLeaveSystem(String workspaceId);

	int updateLeaveSystem(Map<String, Object> param);

	int getTotalAttendContents(String workspaceId);



}
