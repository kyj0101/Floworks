package com.kh.floworks.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Member selectOneMember(String username) {
		return null;
	}

//	@Override
//	public User selectOneUser(String id) {
//		return session.selectOne("user.selectOneUser",id);
//	}
//
//	@Override
//	public Object updateMember(User user) {
//		return session.update("user.updateMember", user);
//	}

}
