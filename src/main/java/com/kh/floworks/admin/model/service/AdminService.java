
package com.kh.floworks.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.admin.model.vo.Workspace;


public interface AdminService {

	List<UserList> selectUserList(Map<String, Object> param, String workspace);
	
	UserDetail selectOneUserDetail(String userId);

	Workspace selectOneWorkspace(Workspace workspace);
	
	List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId);

	List<String> selectAllMemberAttendanceYear(String workspaceId);
	
	List<String> selectAllMemberAttendanceMonth(String workspaceId);
	
	List<Map<String, Object>> selectLeaveSystem(String workspaceId);

	Map<String, Object> selectOneAttend(Map<String, Object> param);

	List<AttendList> selectSearchAttendList(Map<String, Object> param);

	//직원 정보수정
	int userUpdate(UserDetail userDetail);


	int updateWsPw(Workspace workspace);

	int memberUpdate(UserDetail userDetail);





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	

	int updateAttendanceSystem(Map<String, Object> param);

	int updateLeaveSystem(Map<String, Object> param);

	int updateAttend(Map<String, Object> param);

	int getTotalAttendContents(String workspaceId);

	int getTotalContents(String workspace);

	int getTotalSearchAttendContents(Map<String, Object> param);



}
