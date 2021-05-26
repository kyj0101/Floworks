package com.kh.floworks.addressbook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.member.model.vo.Member;

@Repository
public class AddressBookDaoImpl implements AddressBookDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Member> selectSearchMemberList(Map<String, Object> param) {
		return session.selectList("addressBook.selectSearchMemberList", param);
	}

}
