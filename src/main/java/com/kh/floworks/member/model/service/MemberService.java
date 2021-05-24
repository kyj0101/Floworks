package com.kh.floworks.member.model.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.kh.floworks.member.model.vo.User;

public interface MemberService extends UserDetailsService {
	
	String ROLE_USER = "USER";
	String ROLE_ADMIN = "USER";
	
//	User selectOneUser(String id);
//
//	int updateMember(User user);

	
}
