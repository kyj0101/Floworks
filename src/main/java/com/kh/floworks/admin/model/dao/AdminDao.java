
package com.kh.floworks.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

public interface AdminDao {

	List<UserList> selectUserList(Map<String, Object> param, String workspace);

	int getTotalContents(String workspace);

	UserDetail selectOneUserDetail(String userId);
	
	//--강준혁 관리자 근태관리 리스트 뽑아오기
	List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	
	int updateAttendanceSystem(Map<String, Object> param);





	

	List<Map<String, Object>> selectLeaveSystem(String workspaceId);




	int updateLeaveSystem(Map<String, Object> param);


	int getTotalAttendContents(String workspaceId);


}