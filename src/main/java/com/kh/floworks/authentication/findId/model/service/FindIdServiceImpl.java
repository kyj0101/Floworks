package com.kh.floworks.authentication.findId.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.authentication.findId.model.dao.FindIdDao;

@Service
public class FindIdServiceImpl implements FindIdService{
	
	@Autowired
	private FindIdDao findIdDao;

	@Override
	public boolean selectUserEmail(String email) {
		
		int result = findIdDao.selectUserEmail(email);
		
		return result > 0;
	}

	@Override
	public String selectOneId(String email) {
		return findIdDao.selectOneId(email);
	}
	
	
	
	
}
