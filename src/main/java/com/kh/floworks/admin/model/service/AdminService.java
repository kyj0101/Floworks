package com.kh.floworks.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

public interface AdminService {


	List<UserList> selectUserList(Map<String, Object> param, String workspace);

	int getTotalContents(String workspace);

	List<AttendList> selectAttendList();

}
