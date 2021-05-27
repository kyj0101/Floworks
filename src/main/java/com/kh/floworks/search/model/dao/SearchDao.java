package com.kh.floworks.search.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.board.model.vo.Board;

public interface SearchDao {

	List<Map<String, Object>> selectSearchPostList(Map<String, Object> param);

	int getTotalSearchPostEmail(String keyword);

	int getTotalSearchPost(String keyword);

}
