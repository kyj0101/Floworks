package com.kh.floworks.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.floworks.member.model.dao.MemberDao;
import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

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
	@Override
	public boolean selectIdDuplicate(String id) {

		int result = memberDao.selectIdDuplicate(id);

		return result == 1;
	}

	@Override
	public boolean selectEmailDuplicate(String email) {

		int result = memberDao.selectEmailDuplicate(email);

		return result == 1;
	}

	@Override
	public boolean selectPhoneDuplicate(String phone) {

		int result = memberDao.selectPhoneDuplicate(phone);

		return result == 1;
	}

	@Override
	public boolean selectWorkSpaceIdExist(String workSpaceId) {

		int result = memberDao.selectWorkSpaceIdExist(workSpaceId);

		return result == 1;
	}
	
	@Override
	public boolean selectworkspaceIdDuplicate(String id) {
		
		int result = memberDao.selectworkspaceIdDuplicate(id);

		return result == 1;
	}

	@Override
	public int insertUser(User user) {
		return memberDao.insertUser(user);
	}

	@Override
	public List<Map<String, String>> selectDeptNameList() {
		return memberDao.selectDeptNameList();
	}

	@Override
	public List<String> selectPositionList() {
		return memberDao.selectPositionList();
	}

	@Override
	public String selectWorkspacePassword(String workSpaceId) {
		return memberDao.selectWorkspacePassword(workSpaceId);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int insertWorkspace(Map<String, String> param) {
		return memberDao.insertWorkspace(param);
	}

	@Override
	public String selectWorkspaceOwner(String workspaceId) {
		return memberDao.selectWorkspaceOwner(workspaceId);
	}




}
