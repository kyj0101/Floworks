package com.kh.floworks.admin.model.service;

import java.util.List;

import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

public interface AdminService {

	List<UserList> selectUserList();

	List<UserDetail> selectOneDetail();


}
