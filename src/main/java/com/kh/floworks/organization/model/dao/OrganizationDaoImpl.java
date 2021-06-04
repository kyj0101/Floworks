package com.kh.floworks.organization.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.member.model.dao.MemberDaoImpl;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class OrganizationDaoImpl implements OrganizationDao {
	
	@Autowired
	private SqlSession session;
}
