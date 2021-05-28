package com.kh.floworks.search.model.service;

import java.util.List;
import java.util.Map;


import com.kh.floworks.email.model.vo.Email;


public interface SearchService {

	List<Map<String, Object>> selectSearchPostList(Map<String, Object> param);

	List<Email> selectSearchEmailSent(Map<String, Object> param);

	List<Email> selectSearchEmailInbox(Map<String, Object> param);

	List<Map<String, Object>> selectSearchPostFileList(Map<String, Object> param);

	List<Map<String, Object>> selectSearchEmailSentFileList(Map<String, Object> param);

	List<Map<String, Object>> selectSearchEmailInboxFileList(Map<String, Object> param);

	int getTotalSearchPost(Map<String, Object> param);

	int getTotalSearchEmailSent(Map<String, Object> param);

	int getTotalSearchEmailInbox(Map<String, Object> param);

	int getTotalSearchPostFile(Map<String, Object> param);

	int getTotalFileEmailInbox(Map<String, Object> param);

	int getTotalFileEmailSent(Map<String, Object> param);

}
