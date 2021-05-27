package com.kh.floworks.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.email.model.vo.Email;
import com.kh.floworks.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SearchDao searchDao;

	@Override
	public List<Map<String, Object>> selectSearchPostList(Map<String, Object> param) {
		return searchDao.selectSearchPostList(param);
	}
	
	@Override
	public List<Email> selectSearchEmailSent(Map<String, Object> param) {
		return searchDao.selectSearchEmailSent(param);
	}

	@Override
	public int getTotalSearchPost(String keyword) {
		return searchDao.getTotalSearchPost(keyword);
	}


	@Override
	public int getTotalSearchEmailSent(Map<String, Object> param) {
		return searchDao.getTotalSearchEmailSent(param);
	}
}
