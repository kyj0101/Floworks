package com.kh.floworks.search.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;

public interface SearchDao {

	List<Map<String, Object>> selectSearchPostList(Map<String, Object> param);

	List<Email> selectSearchEmailSent(Map<String, Object> param);

	int getTotalSearchPost(String keyword);
	
	int getTotalSearchEmailSent(Map<String, Object> param);

}
