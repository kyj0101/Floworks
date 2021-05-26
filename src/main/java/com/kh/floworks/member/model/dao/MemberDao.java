package com.kh.floworks.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

public interface MemberDao {

	//Member selectOneMember(String username);

//	User selectOneUser(String id);
//
//	Object updateMember(User user);
	int selectIdDuplicate(String id);

	int selectEmailDuplicate(String email);

	int selectPhoneDuplicate(String phone);

	int selectWorkSpaceIdExist(String workSpaceId);
	
	int selectworkspaceIdDuplicate(String id);

	int insertUser(User user);

	List<Map<String, String>> selectDeptNameList();

	List<String> selectPositionList();

	String selectWorkspacePassword(String workSpaceId);
	
	String selectWorkspaceOwner(String workspaceId);

	int insertMember(Member member);

	int insertWorkspace(Map<String, String> param);

	int updateUserWorkspaceId(Map<String, String> param);

}
