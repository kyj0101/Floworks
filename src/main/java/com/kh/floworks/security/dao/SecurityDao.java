package com.kh.floworks.security.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SecurityDao {
	
	private SqlSession session;

	public Member selectOneMember(String userName) {
		return session.selectOne("member.selectOneMember", userName);
	}

	public User selectOneUser(String userName) {
		return session.selectOne("user.selectOneUser", userName);
	}
	
	
}
