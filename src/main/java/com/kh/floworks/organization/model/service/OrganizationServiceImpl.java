package com.kh.floworks.organization.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.member.model.service.MemberServiceImpl;
import com.kh.floworks.organization.model.dao.OrganizationDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	private OrganizationDao organizationDao;

	@Override
	public List<UserList> selectUserList(Map<String, Object> param, Map<String, Object> search) {
		return organizationDao.selectUserList(param, search);
	}

	@Override
	public int getTotalContents(Map<String, Object> search) {
		return organizationDao.getTotalContents(search);
	}
}
