package com.kh.floworks.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.board.model.service.BoardService;
import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;
import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.common.utils.PageBarUtils;


import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public void boardList(
				@RequestParam(defaultValue = "1") int cPage, 
				Model model,
				HttpServletRequest request) {
		//1. 사용자입력값
		int numPerPage = 10;
		log.info("cPage = {}", cPage);
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		
		//2. 업무로직
		//a. contents영역 : mybatis의 RowBounds
		List<PostList> list = boardService.selectPostList(param);
		log.info("list = {}", list);
		
		//b. pagebar영역
		int totalContents = boardService.getTotalContents();
		String url = request.getRequestURI();
		log.info("totalContents = {}", totalContents);
		log.info("url = {}", url);
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		
		//3. jsp처리 위임
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
	}
	
	@GetMapping("/boardView")
	public void boardView(@RequestParam int postNo, Model model) {
		//1. 업무로직
//		Board board = boardService.selectOneBoard(no);
		Post post = boardService.selectOnePostCollection(postNo);
		log.info("post = {}", post);
		
		//2. jsp위임
		model.addAttribute("post", post);
}
	
	@GetMapping("/boardUpdate")
	public void boardUpdate() {
		
	}
	
	@GetMapping("/boardForm")
	public void boardForm() {
			
	}					
	
	
	@PostMapping("/boardEnroll")
	public String boardEnroll(Post post,
							  RedirectAttributes redirectAttr,
							  @RequestParam(value="upFile", required = false) MultipartFile[] upFiles,
							  HttpServletRequest request) throws Exception {

		try {
			log.debug("post = {}", post);
			//0. 파일 저장 및 Attachment객체 생성
			//저장경로
			String saveDirectory = 
					request.getServletContext().getRealPath("/resources/upload/board");
			//File객체를 통해서 directory가능
			File dir = new File(saveDirectory);
			if(!dir.exists()) 
				dir.mkdirs(); // 복수개 폴더 생성 가능
			
			//복수개의 postFile객체를 담을 list생성
			List<PostFile> pFList = new ArrayList<>();
		
			for(MultipartFile upFile : upFiles) {	
				if(upFile.isEmpty() || upFile.getSize() == 0)
					continue;
				log.info("upFile = {}", upFile);
				log.info("upFile.name = {}", upFile.getOriginalFilename());
				log.info("upFile.size = {}", upFile.getSize());
				//저장할 파일명 생성
				File renamedFile = FileUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());
				//파일 저장
				upFile.transferTo(renamedFile);
				log.info("renamedFile = {}", renamedFile);
				log.info("upFile = {}", upFile);
				//PostFile객체생성
				PostFile pF = new PostFile();
				pF.setPostOriginalFileName(upFile.getOriginalFilename());
				pF.setPostRenamedFileName(renamedFile.getName());
				pFList.add(pF);
				log.info("pFList = {}", pFList);
			}
			
			//1. 업무로직
			post.setPostFileList(pFList);
			log.info("post = {}", post);
			int result = boardService.insertPost(post);
			
			//2. 사용자피드백
			String msg = result > 0 ? "게시글이 등록되었습니다" : "게시글 등록에 실패하였습니다";
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error("게시물 등록 오류!", e);
			throw e;
		}

		return "redirect:/board/boardList";
	}
	
}
