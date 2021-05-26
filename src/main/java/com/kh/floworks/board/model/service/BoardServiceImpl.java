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
	public List<PostList> selectPostList(Map<String, Object> param, int boardNo) {
		return boardDao.selectPostList(param, boardNo);
	}



	@Override
	public List<PostList> selectdeptList(String dept) {
		return boardDao.selectdeptList(dept);
	}

	
	
	@Override
	public int getTotalContents(int boardNo) {
		return boardDao.getTotalContents(boardNo);
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

	@Override
	public int updatePost(PostList postList) {
		int result = 0;
		//1. board객체 등록
		result = boardDao.updatePost(postList);
		log.info("postNo = {}", postList.getPostNo());
		//2. attachment객체 등록
		//insert into attachment (no, board_no, original_filename, rename_filename)
		//values(seq_attachment_no.nextval, #{boardNo}, #{originalFileName}, #{renamedFileName})
		if(!postList.getPostFileList().isEmpty()) {
			for(PostFile pFile : postList.getPostFileList()) {
				pFile.setPostNo(postList.getPostNo());
				result = boardDao.updatePostFile(pFile);
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




}
