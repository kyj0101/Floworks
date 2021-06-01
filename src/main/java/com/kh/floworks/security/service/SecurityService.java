package com.kh.floworks.security.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

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
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = securityDao.selectOneMember(username);
		
		if(member == null) {
			throw new UsernameNotFoundException(username + "not fount");
		}

		log.info("Role{}", member.getRole());
		
		return member;
	}

}
