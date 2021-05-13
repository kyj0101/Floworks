package com.kh.floworks.member.model.dao;

import com.kh.floworks.member.model.vo.Member;

public interface MemberDao {

	Member selectOneMember(String username);

}
