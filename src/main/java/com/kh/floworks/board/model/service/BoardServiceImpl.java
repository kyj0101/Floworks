package com.kh.floworks.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.floworks.board.model.dao.BoardDao;
import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostComment;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public List<PostList> selectPostList(Map<String, Object> param, Map<String, Object> search) {
		return boardDao.selectPostList(param, search);
	}

	
	@Override
	public int getTotalContents(Map<String, Object> search) {
		return boardDao.getTotalContents(search);
	}

	@Override
	public int insertPost(Post post) {
		int result = 0;
		//1. board객체 등록
		result = boardDao.insertPost(post);
		log.info("postNo = {}", post.getPostNo());
		//2. 객체 등록
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


	@Override
	public int updatePost(PostList postList) {
		int result = 0;
		//1. board객체 등록
		result = boardDao.updatePost(postList);
		log.info("postNo = {}", postList.getPostNo());
		log.info("postNo = {}", postList.getPostFileList());
		if(!postList.getPostFileList().isEmpty()) {
			for(PostFile pFile : postList.getPostFileList()) {
				pFile.setPostNo(postList.getPostNo());
				result = boardDao.insertPostFile(pFile);
			}
		}
		return result;
	}

	@Override
	public int updateDelPost(int postNo) {
		int result = 0;
		result = boardDao.updateDelPost(postNo);
		return result;
	}

	@Override
	public void rdCountPost(int postNo) {
		boardDao.rdCountPost(postNo);
		return;
	}

	@Override
	public int insertPostComment(PostComment postComment) {
		int result = 0;
		result = boardDao.insertPostComment(postComment);
		return result;
	}

	@Override
	public int commentDelete(int commentNo) {
		int result = 0;
		result = boardDao.commentDelete(commentNo);
		
		return result;
	}



	@Override
	public List<Post> selectMainList() {
		return boardDao.selectMainList();
	}


	@Override
	public void deletePost(int deleteNo) {
		boardDao.deletePost(deleteNo);
		
	}




	@Override
	public void insertPostFile(List<PostFile> pFList) {
		boardDao.insertPostFile(pFList);
		
	}




}
