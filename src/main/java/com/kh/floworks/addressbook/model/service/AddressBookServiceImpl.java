package com.kh.floworks.addressbook.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.addressbook.model.dao.AddressBookDao;
import com.kh.floworks.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Service
public class AddressBookServiceImpl implements AddressBookService{
	
	@Autowired
	private AddressBookDao addressBookDao;

	@Override
	public List<Member> selectSearchMemberList(Map<String, Object> param) {
		return addressBookDao.selectSearchMemberList(param);
	}

	@Override
	public int insertAddress(Map<String, String> param) {
		return addressBookDao.insertAddress(param);
	}

	@Override
	public int getTotalAddressBook(String owner) {
		return addressBookDao.getTotalAddressBook(owner);
	}

	@Override
	public List<Member> selectAddressMemberList(Map<String, Object> param) {
		return addressBookDao.selectAddressMemberList(param);
	}

	@Override
	public int deleteAddress(Map<String, String> param) {
		return addressBookDao.deleteAddress(param);
	}

}
