package com.kh.floworks.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

public interface MemberDao {

	Member selectOneMember(String username);

	int selectIdDuplicate(String id);

	int selectEmailDuplicate(String email);

	int selectPhoneDuplicate(String phone);

	int selectWorkSpaceIdExist(String workSpaceId);

	int insertUser(User user);

	List<Map<String, String>> selectDeptNameList();

	List<String> selectPositionList();

	String selectWorkspacePassword(String workSpaceId);

	int insertMember(Member member);



}
