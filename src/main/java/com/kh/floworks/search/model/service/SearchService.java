package com.kh.floworks.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.board.model.vo.Board;

public interface SearchService {

	List<Map<String, Object>> selectSearchPostList(Map<String, Object> param);

	int getTotalSearchEmail(String keyword);

	int getTotalSearchPost(String keyword);


}
