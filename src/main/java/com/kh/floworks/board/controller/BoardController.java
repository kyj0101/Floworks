package com.kh.floworks.board.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.board.model.service.BoardService;
import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostComment;
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
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private ServletContext servletContext; 
	
	
	@GetMapping(value="/boardList", produces="application/json;charset=UTF-8")
	public void boardList(@RequestParam(defaultValue = "1") int cPage,  
				@RequestParam int boardNo, 
				@RequestParam String dept, 
				Model model,
				HttpServletRequest request) {
		//1. 사용자입력값
		int numPerPage = 10;
		log.info("cPage = {}", cPage);
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		
		Map<String, Object> search = new HashMap<>();
		search.put("boardNo", boardNo);
		search.put("dept", dept);
		
		//2. 업무로직
		//a. contents영역 : mybatis의 RowBounds
		List<PostList> list = boardService.selectPostList(param, search);
		log.info("list = {}", list);
		
		//b. pagebar영역
		int totalContents = boardService.getTotalContents(search);
		String url = request.getRequestURI() + "?boardNo=" + boardNo + "&dept=" + dept;
		log.info("totalContents = {}", totalContents);
		log.info("url = {}", url);
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		
		//3. jsp처리 위임
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("boardNo", boardNo);
	}
	

	
	
	@GetMapping({"/boardView", "/boardUpdateForm"})
	public void boardView(@RequestParam int postNo, Model model) {
		//1. 업무로직
		PostList postList = boardService.selectOnePostCollection(postNo);
		log.info("postList = {}", postList);
		//조회수
		boardService.rdCountPost(postNo);
		log.info("postNo = {}", postNo);
		//2. jsp위임
		model.addAttribute("postList", postList);
	}
	
	
	@GetMapping("/boardForm")
	public void boardForm(@RequestParam int boardNo,Model model) {
		model.addAttribute("boardNo", boardNo);
	}					
	
	
	@PostMapping("/boardEnroll")
	public String boardEnroll(Post post,
							  @RequestParam String id,
							  @RequestParam int boardNo,
							  RedirectAttributes redirectAttr,
							  @RequestParam(value="upFile", required = false) MultipartFile[] upFiles,
							  HttpServletRequest request) throws Exception {

		try {
			log.info("post = {}", post);
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
			post.setBoardNo(boardNo);
			post.setId(id);
			log.info("post = {}", post);
			int result = boardService.insertPost(post);
			
			//2. 사용자피드백
			String msg = result > 0 ? "게시글이 등록되었습니다" : "게시글 등록에 실패하였습니다";
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error("게시물 등록 오류!", e);
			throw e;
		}

		return "redirect:/board/boardList?boardNo=" + boardNo + "&dept=";
	}
	
	
	
	@GetMapping(
			value = "/fileDownload", 
			produces = "application/octet-stream;charset=utf-8"
		)
	@ResponseBody
	public Resource fileDownload(@RequestParam int postFile, 
								HttpServletResponse response) throws UnsupportedEncodingException{
		
		//1.업무조회
		PostFile pFile = boardService.selectOnePostFile(postFile);
		log.info("pFile = {}", pFile);
	
		String postOriginalFileName = pFile.getPostOriginalFileName();
		String postRenamedFileName = pFile.getPostRenamedFileName();
		
		//2. Resource준비
		String saveDirectory = servletContext.getRealPath("/resources/upload/board");
		File downFile = new File(saveDirectory, postRenamedFileName);
		String location = "file:" + downFile;
		log.info("location = {}", location);
		Resource resource = new FileSystemResource(downFile);
		
		//3. 응답헤더
		//한글파일 깨짐 방지
		postOriginalFileName = new String(postOriginalFileName.getBytes("utf-8"), "iso-8859-1");
		response.setContentType("application/octet-stream;charset=utf-8");
		response.addHeader("Content-Disposition", "attachment;filename=\"" + postOriginalFileName + "\"");
		
		return resource;
	}
	
	
	
	@PostMapping("/postModify")
	public String postUpdate(@ModelAttribute("postList") PostList postList, 
							 @ModelAttribute("postFile") PostFile postFile, 
							 RedirectAttributes redirectAttr,
							 HttpServletRequest request, 
							 @RequestParam(value="upFile", required = false) MultipartFile[] upFiles) throws Exception{
								
		log.info("postList = {}", postList);
		log.info("postFile = {}", postFile);
		
		//파일 삭제 
		//boardService.deletePost(deleteNo);
		
		try {
			log.info("post = {}", postList);
			log.info("upFiles = {}", upFiles);
			
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
				pF.setPostNo(postFile.getPostNo());
				pFList.add(pF);

				log.info("pFList = {}", pFList);
			}
			
		

			
			//1. 업무로직

//			postList.setPostNo(postList.getPostNo());
			postList.setPostFileList(pFList);
			log.info("post = {}", postList);
			int result = boardService.updatePost(postList);
			log.info("result = {}", result);
			//2. 사용자피드백
			String msg = result > 0 ? "게시글이 수정 등록되었습니다" : "게시글 수정에 실패하였습니다";
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error("게시물 수정 오류!", e);
			throw e;
		}
			
		return "redirect:/board/boardList?boardNo=" + postList.getBoardNo() + "&dept=";
	}

	
	
	@GetMapping("/postDelete")
	public String postDelete(@RequestParam int postNo, 
							@RequestParam int boardNo, 
							RedirectAttributes redirectAttr) {
		//1. 업무로직
		int result = boardService.updateDelPost(postNo);
		log.info("result = {}", result);
		
		//2. 사용자피드백
		String msg = result > 0 ? "게시글이 삭제되었습니다" : "게시글 삭제에 실패하였습니다";
		redirectAttr.addFlashAttribute("msg", msg);
		log.info("boardNo = {}", boardNo);
		
		
		return "redirect:/board/boardList?boardNo=" + boardNo + "&dept=";
	}
	

	
	@PostMapping("/commentInsert")
	public String commentInsert(PostComment postComment,
							  RedirectAttributes redirectAttr,
							  HttpServletRequest request) {

			//1. 업무로직
			log.info("postComment = {}", postComment);
			int result = boardService.insertPostComment(postComment);
			
			//2. 사용자피드백
			String msg = result > 0 ? "댓글이 등록되었습니다" : "댓글 등록에 실패하였습니다";
			redirectAttr.addFlashAttribute("msg", msg);
		

		return "redirect:/board/boardView?postNo=" + postComment.getPostNo();
	}
	
	
	@GetMapping("/commentDelete")
	public String commentDelete(@RequestParam int postNo,
								@RequestParam int commentNo, 
							RedirectAttributes redirectAttr) {
		//1. 업무로직
		int result = boardService.commentDelete(commentNo);
		log.info("result = {}", result);
		
		//2. 사용자피드백
		String msg = result > 0 ? "댓글이 삭제되었습니다" : "댓글 삭제에 실패하였습니다";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/board/boardView?postNo=" + postNo;
	}
	

	
	
	
	
	
	
	
}
