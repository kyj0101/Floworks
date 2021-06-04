package com.kh.floworks.organization.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.member.model.dao.MemberDaoImpl;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class OrganizationDaoImpl implements OrganizationDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<UserList> selectUserList(Map<String, Object> param, String workspace) {
		int cPage = (int)param.get("cPage");
		
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		log.info("workspace = {}", workspace);
		return session.selectList("organization.selecUserList", workspace, rowBounds);
	}

	@Override
	public int getTotalContents(String workspace) {
		return session.selectOne("organization.getTotalContents", workspace);
	}
	
	
}
