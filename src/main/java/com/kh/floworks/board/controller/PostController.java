package com.kh.floworks.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.floworks.board.model.service.BoardService;
import com.kh.floworks.board.model.vo.Post;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PostController {

	
	@Autowired
	private BoardService boardService;
	
	
	
	@GetMapping("/home")
	public void mainBoardView(Model model) {
		//1. 업무로직
		List<Post> mainPostList = boardService.selectMainList();
		log.info("mainPostList = {}", mainPostList);

		//2. jsp위임
		model.addAttribute("mainPostList", mainPostList);
	}
	
	
}
