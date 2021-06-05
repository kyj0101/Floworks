package com.kh.floworks.organization.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.admin.model.vo.UserList;

public interface OrganizationService {

	List<UserList> selectUserList(Map<String, Object> param, Map<String, Object> search);

	int getTotalContents(Map<String, Object> search);

}
