package com.kh.floworks.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.floworks.member.model.dao.MemberDao;
import com.kh.floworks.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

//	@Override
//	public User selectOneUser(String id) {
//		return memberDao.selectOneUser(id);
//	}

	/**
	 * @return UserDetails을 상속한 Member객체 
	 */
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		User user = memberDao.selectOneMember(id);
		log.debug("userSevice = {}", user);
		if(user == null)
			throw new UsernameNotFoundException(id);
		return user;
	}

//	@Override
//	public int updateMember(User user) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//	

}
