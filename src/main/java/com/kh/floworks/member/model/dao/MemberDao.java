package com.kh.floworks.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

public interface MemberDao {
	
	int insertUser(User user);
	
	int insertMember(Member member);

	int insertWorkspace(Map<String, String> param);

	int insertDefaultAttendanceSystem(String workspaceId);
	
	int insertDefaultLeaveSystem(Map<String, String> param);

	int selectIdDuplicate(String id);

	int selectEmailDuplicate(String email);

	int selectPhoneDuplicate(String phone);

	int selectWorkSpaceIdExist(String workSpaceId);
	
	int selectworkspaceIdDuplicate(String id);
	
	List<Map<String, String>> selectDeptNameList();

	List<String> selectPositionList();

	String selectWorkspacePassword(String workSpaceId);
	
	String selectWorkspaceOwner(String workspaceId);
	
	Member selectOneMember(String id);

	int selectLeaveDay(Map<String, String> param);

	int updateUserWorkspaceId(Map<String, String> param);

	int updateMember(Member updateMember);

	int updateProfile(Member updateMember);

	int updatePassword(Map<String, Object> param);

	int updateQuitMember(String id);

	int updateWorkspaceOwnerAdmin(Map<String, String> param);

	int deleteAddressBook(String id);
}
