
package com.kh.floworks.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.admin.model.vo.Workspace;

public interface AdminDao {

	List<UserList> selectUserList(Map<String, Object> param, String workspace);
	
	UserDetail selectOneUserDetail(String userId);
	
	//직원 정보수정
	int userUpdate(UserDetail userDetail);	
	
	int updateWsPw(Workspace workspace);

	Workspace selectOneWorkspace(Workspace workspace);
	
	
	


	//--강준혁 관리자 근태관리 리스트 뽑아오기
	List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId);

	List<String> selectAllMemberAttendanceYear(String workspaceId);

	List<String> selectAllMemberAttendanceMonth(String workspaceId);
	
	List<Map<String, Object>> selectLeaveSystem(String workspaceId);
	
	Map<String, Object> selectOneAttend(Map<String, Object> param);
	
	List<AttendList> selectSearchAttendList(Map<String, Object> param);
	

	
	int updateAttendanceSystem(Map<String, Object> param);

	int memberUpdate(UserDetail userDetail);

	int updateLeaveSystem(Map<String, Object> param);

	int updateAttend(Map<String, Object> param);

	int getTotalAttendContents(String workspaceId);
	
	int getTotalContents(String workspace);


	int getTotalSearchAttendContents(Map<String, Object> param);

}