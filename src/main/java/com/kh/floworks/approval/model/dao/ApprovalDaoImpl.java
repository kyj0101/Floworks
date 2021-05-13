package com.kh.floworks.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
}
