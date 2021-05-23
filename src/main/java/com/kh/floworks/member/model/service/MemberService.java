package com.kh.floworks.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

public interface MemberService {
	
	String ROLE_USER = "USER";
	String ROLE_ADMIN = "ADMIN";
	
	boolean selectIdDuplicate(String id);

	boolean selectEmailDuplicate(String email);

	boolean selectPhoneDuplicate(String email);

	boolean selectWorkSpaceIdExist(String workSpaceId);

	boolean selectworkspaceIdDuplicate(String id);

	String selectWorkspacePassword(String workSpaceId);
	
	List<Map<String, String>> selectDeptNameList();

	List<String> selectPositionList();

	String selectWorkspaceOwner(String workspaceId);

	int insertUser(User user);

	int insertMember(Member member);

	int insertWorkspace(Map<String, String> param);
}
