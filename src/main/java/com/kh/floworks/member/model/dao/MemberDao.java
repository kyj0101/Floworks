package com.kh.floworks.member.model.dao;

import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

public interface MemberDao {

	Member selectOneMember(String username);

//	User selectOneUser(String id);
//
//	Object updateMember(User user);

}
