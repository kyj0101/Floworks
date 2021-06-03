package com.kh.floworks.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public int selectIdDuplicate(String id) {
		return session.selectOne("member.selectIdDuplicate", id);
	}

	@Override
	public int selectEmailDuplicate(String email) {
		return session.selectOne("member.selectEmailDuplicate", email);
	}

	@Override
	public int selectPhoneDuplicate(String phone) {
		return session.selectOne("member.selectPhoneDuplicate", phone);
	}
	
	@Override
	public int selectWorkSpaceIdExist(String workSpaceId) {
		return session.selectOne("member.selectWorkSpaceIdExist", workSpaceId);
	}
	
	@Override
	public int selectworkspaceIdDuplicate(String id) {
		return session.selectOne("member.selectworkspaceIdDuplicate", id);
	}

	@Override
	public int insertUser(User user) {
		return session.insert("member.insertUser", user);
	}

	@Override
	public List<Map<String, String>> selectDeptNameList() {
		return session.selectList("member.selectDeptNameList");
	}

	@Override
	public List<String> selectPositionList() {
		return session.selectList("member.selectPositionList");
	}

	@Override
	public String selectWorkspacePassword(String workSpaceId) {
		return session.selectOne("member.selectWorkspacePassword", workSpaceId);
	}

	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public int insertWorkspace(Map<String, String> param) {
		return session.insert("member.insertWorkspace", param);
	}
	
	@Override
	public int insertDefaultAttendanceSystem(String workspaceId) {
		return session.insert("member.insertDefaultAttendanceSystem", workspaceId);
	}
	
	@Override
	public int insertDefaultLeaveSystem(Map<String, String> param) {
		return session.insert("member.insertDefaultLeaveSystem", param);
	}



	@Override
	public String selectWorkspaceOwner(String workspaceId) {
		return session.selectOne("member.selectWorkspaceOwner", workspaceId);
	}
	
	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("member.selectOneMember", id);
	}
	
	@Override
	public int selectLeaveDay(Map<String, String> param) {
		return session.selectOne("member.selectLeaveDay", param);
	}

	@Override
	public int updateUserWorkspaceId(Map<String, String> param) {
		return session.update("member.updateUserWorkspaceId", param);
	}

	@Override
	public int updateMember(Member updateMember) {
		return session.update("member.updateMember", updateMember);
	}

	@Override
	public int updateProfile(Member updateMember) {
		return session.update("member.updateProfile", updateMember);
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		return session.update("member.updatePassword",param);
	}

	@Override
	public int updateQuitMember(String id) {
		return session.update("member.updateQuitMember", id);
	}
	
	@Override
	public int updateWorkspaceOwnerAdmin(Map<String, String> param) {
		return session.update("member.updateWorkspaceOwnerAdmin", param);
	}

	@Override
	public int deleteAddressBook(String id) {
		return session.delete("member.deleteAddressBook", id);
	}

	


	


}
