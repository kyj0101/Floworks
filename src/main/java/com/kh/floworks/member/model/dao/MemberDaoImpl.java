package com.kh.floworks.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession session;
	
//	@Override
//	public Member selectOneMember(String username) {
//		return null;
//	}

//	@Override
//	public User selectOneUser(String id) {
//		return session.selectOne("user.selectOneUser",id);
//	}
//
//	@Override
//	public Object updateMember(User user) {
//		return session.update("user.updateMember", user);
//	}
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
	public String selectWorkspaceOwner(String workspaceId) {
		return session.selectOne("member.selectWorkspaceOwner", workspaceId);
	}

	@Override
	public int updateUserWorkspaceId(Map<String, String> param) {
		return session.update("member.updateUserWorkspaceId", param);
	}

	@Override
	public int updateMember(Member updateMember) {
		return session.update("member.updateMember", updateMember);
	}


}
