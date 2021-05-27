package com.kh.floworks.addressbook.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.member.model.vo.Member;

public interface AddressBookService {

	List<Member> selectSearchMemberList(Map<String, Object> param);

	int insertAddress(Map<String, String> param);

	int getTotalAddressBook(String owner);

	List<Member> selectAddressMemberList(Map<String, Object> param);

}
