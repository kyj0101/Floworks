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

	@Override
	public int insertAddress(Map<String, String> param) {
		return session.insert("addressBook.insertAddress", param);
	}

	@Override
	public List<Member> selectAddressMemberList(String owner) {
		return session.selectList("addressBook.selectAddressMemberList", owner);
	}

	@Override
	public int getTotalAddressBook(String owner) {
		return session.selectOne("addressBook.getTotalAddressBook", owner);
	}

	@Override
	public List<Member> selectAddressMemberList(Map<String, Object> param) {
		
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("addressBook.selectAddressMemberList", param, rowBounds);
	}

	@Override
	public int deleteAddress(Map<String, String> param) {
		return session.delete("addressBook.deleteAddress", param);
	}

}
