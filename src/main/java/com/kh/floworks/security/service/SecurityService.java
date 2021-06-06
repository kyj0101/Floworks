package com.kh.floworks.security.service;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.floworks.common.Exception.MemberNotFountException;
import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;
import com.kh.floworks.security.dao.SecurityDao;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Slf4j
public class SecurityService implements UserDetailsService{

	private SecurityDao securityDao;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Member member = securityDao.selectOneMember(userName);
		User user = selectOneUser(userName);
		
		if(member == null && user != null) {
			throw new MemberNotFountException("MemberNotFoundException");
		}
		
		if(member == null && user == null ) {
			throw new UsernameNotFoundException("UserNotFoundException");
		}

		return member;
	}
	

	public User selectOneUser(String userName) {
		return securityDao.selectOneUser(userName);
	}

}
