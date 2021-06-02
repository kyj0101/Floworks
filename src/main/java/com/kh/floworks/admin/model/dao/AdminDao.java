package com.kh.floworks.admin.model.dao;

import java.util.List;
import java.util.Map;


import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

public interface AdminDao {

	List<UserList> selectUserList(Map<String, Object> param, String workspace);

	int getTotalContents(String workspace);
	
	UserDetail selectOneUserDetail(String userId);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	
	int updateAttendanceSystem(Map<String, Object> param);

	

	

}
