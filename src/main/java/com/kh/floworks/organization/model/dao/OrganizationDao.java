package com.kh.floworks.organization.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.UserList;

public interface OrganizationDao {

	List<UserList> selectUserList(Map<String, Object> param, String workspace);

	int getTotalContents(String workspace);

	
}
