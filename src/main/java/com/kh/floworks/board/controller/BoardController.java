package com.kh.floworks.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.board.model.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public void boardList() {
				
		
	}
	
	@GetMapping("/boardView")
	public void boardView() {
				
		
	}
	
	@GetMapping("/boardUpdate")
	public void boardUpdate() {
				
		
	}
	
	@GetMapping("/boardEnroll")
	public void boardEnroll() {
				
		
	}
	
}
