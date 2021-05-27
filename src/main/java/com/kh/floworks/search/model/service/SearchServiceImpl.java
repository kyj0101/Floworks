package com.kh.floworks.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int getTotalSearchEmail(String keyword) {
		// TODO Auto-generated method stub
				return 0;
	}

	@Override
	public int getTotalSearchPost(String keyword) {
		return searchDao.getTotalSearchPost(keyword);
	}
}
