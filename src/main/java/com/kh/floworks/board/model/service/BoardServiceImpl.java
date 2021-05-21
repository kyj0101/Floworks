package com.kh.floworks.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.floworks.board.model.dao.BoardDao;
import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public List<PostList> selectPostList(Map<String, Object> param) {
		return boardDao.selectPostList(param);
	}

	@Override
	public int getTotalContents() {
		return boardDao.getTotalContents();
	}

//	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertPost(Post post) {
		int result = 0;
		//1. board객체 등록
		result = boardDao.insertPost(post);
		log.info("postNo = {}", post.getPostNo());
		//2. attachment객체 등록
		//insert into attachment (no, board_no, original_filename, rename_filename)
		//values(seq_attachment_no.nextval, #{boardNo}, #{originalFileName}, #{renamedFileName})
		if(!post.getPostFileList().isEmpty()) {
			for(PostFile pFile : post.getPostFileList()) {
				pFile.setPostNo(post.getPostNo());
				result = boardDao.insertPostFile(pFile);
			}
		}
		return result;
	}

	@Override
	public PostList selectOnePostCollection(int postNo) {
		return boardDao.selectOnePostCollection(postNo);
	}

	@Override
	public PostFile selectOnePostFile(int postFile) {
		return boardDao.selectOnePostFile(postFile);
	}
}
