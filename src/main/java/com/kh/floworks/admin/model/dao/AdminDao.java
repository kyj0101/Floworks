
package com.kh.floworks.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

public interface AdminDao {

	List<UserList> selectUserList(Map<String, Object> param, String workspace);
	
	UserDetail selectOneUserDetail(String userId);

	//--강준혁 관리자 근태관리 리스트 뽑아오기
	List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId);
	
	List<String> selectAllMemberAttendanceYear(String workspaceId);

	List<String> selectAllMemberAttendanceMonth(String workspaceId);

	List<Map<String, Object>> selectLeaveSystem(String workspaceId);

	Map<String, Object> selectOneAttend(Map<String, Object> param);

	List<AttendList> selectSearchAttendList(Map<String, Object> param);

	int updateAttendanceSystem(Map<String, Object> param);
	
	//직원 정보수정 테이블이 두개라 두개로 나눔
	int userUpdate(UserDetail userDetail);	

	int memberUpdate(UserDetail userDetail);

	int updateLeaveSystem(Map<String, Object> param);

	int updateAttend(Map<String, Object> param);

	int getTotalAttendContents(String workspaceId);
	
	int getTotalContents(String workspace);

	int getTotalSearchAttendContents(Map<String, Object> param);



}