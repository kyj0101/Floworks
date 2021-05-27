package com.kh.floworks.addressbook.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;

public interface AddressBookDao {

	List<Member> selectSearchMemberList(Map<String, Object> param);

	int insertAddress(Map<String, String> param);

	List<Member> selectAddressMemberList(String owner);

	int getTotalAddressBook(String owner);

	List<Member> selectAddressMemberList(Map<String, Object> param);

	int deleteAddress(Map<String, String> param);

}
