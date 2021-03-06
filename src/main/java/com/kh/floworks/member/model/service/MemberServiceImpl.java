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

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insertUser(User user) {
		return memberDao.insertUser(user);
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
	public int insertDefaultAttendanceSystem(String workspaceId) {
		return memberDao.insertDefaultAttendanceSystem(workspaceId);
	}
	
	@Override
	public int insertDefaultLeaveSystem(Map<String, String> param) {
		return memberDao.insertDefaultLeaveSystem(param); 
	}


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
	public String selectWorkspaceOwner(String workspaceId) {
		return memberDao.selectWorkspaceOwner(workspaceId);
	}
	
	@Override
	public Member selectOneMember(String id) {
		log.info("{}==========================================",id);
		return memberDao.selectOneMember(id);
	}
	
	@Override
	public int selectLeaveDay(Map<String, String> param) {
		return memberDao.selectLeaveDay(param);
	}
	
	@Override
	public Map<String, String> selectOneWorkspace(String id) {
		return memberDao.selectOneWorkspace(id);
	}

	@Override
	public int updateUserWorkspaceId(Map<String, String> param) {
		return memberDao.updateUserWorkspaceId(param);
	}

	@Override
	public int updateMember(Member updateMember) {
		return memberDao.updateMember(updateMember);
	}

	@Override
	public int updateProfile(Member updateMember) {
		return memberDao.updateProfile(updateMember);
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		return memberDao.updatePassword(param);
	}

	@Override
	public int updateQuitMember(String id) {
		return memberDao.updateQuitMember(id);
	}

	@Override
	public int updateWorkspaceOwnerAdmin(Map<String, String> param) {
		return memberDao.updateWorkspaceOwnerAdmin(param);
	}

	@Override
	public int deleteAddressBook(String id) {
		return memberDao.deleteAddressBook(id);
	}




	

	



	
}