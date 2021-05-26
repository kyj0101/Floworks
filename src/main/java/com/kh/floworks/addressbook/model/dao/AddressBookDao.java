package com.kh.floworks.addressbook.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;

public interface AddressBookDao {

	List<Member> selectSearchMemberList(Map<String, Object> param);

}
