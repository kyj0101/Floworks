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
	private AddressBookDao addressBoodao;

	@Override
	public List<Member> selectSearchMemberList(Map<String, Object> param) {
		return addressBoodao.selectSearchMemberList(param);
	}

}
