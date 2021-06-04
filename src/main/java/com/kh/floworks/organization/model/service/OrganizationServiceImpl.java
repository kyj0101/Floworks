package com.kh.floworks.organization.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.member.model.service.MemberServiceImpl;
import com.kh.floworks.organization.model.dao.OrganizationDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	private OrganizationDao organizationDao;
}
