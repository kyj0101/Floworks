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
				@RequestParam String workspaceId, 
				Model model,
				HttpServletRequest request) {
		//1. ??????????????????
		int numPerPage = 15;
		log.info("cPage = {}", cPage);
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		
		Map<String, Object> search = new HashMap<>();
		search.put("boardNo", boardNo);
		search.put("dept", dept);
		search.put("workspaceId", workspaceId);
		
		//2. ????????????
		//a. contents?????? : mybatis??? RowBounds
		List<PostList> list = boardService.selectPostList(param, search);
		log.info("list = {}", list);
		
		//b. pagebar??????
		int totalContents = boardService.getTotalContents(search);
		String url = request.getRequestURI() + "?boardNo=" + boardNo + "&dept=" + dept + "&workspaceId=" + workspaceId;
		log.info("totalContents = {}", totalContents);
		log.info("url = {}", url);
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		
		//3. jsp?????? ??????
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("boardNo", boardNo);
	}
	

	
	
	@GetMapping({"/boardView", "/boardUpdateForm"})
	public void boardView(@RequestParam int postNo, Model model) {
		//1. ????????????
		PostList postList = boardService.selectOnePostCollection(postNo);
		log.info("postList = {}", postList);
		//?????????
		boardService.rdCountPost(postNo);
		log.info("postNo = {}", postNo);
		//2. jsp??????
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
							  @RequestParam String workspaceId, 
							  RedirectAttributes redirectAttr,
							  @RequestParam(value="upFile", required = false) MultipartFile[] upFiles,
							  HttpServletRequest request) throws Exception {

		try {
			log.info("post = {}", post);
			//0. ?????? ?????? ??? Attachment?????? ??????
			//????????????
			String saveDirectory = 
					request.getServletContext().getRealPath("/resources/upload/board");
			//File????????? ????????? directory??????
			File dir = new File(saveDirectory);
			if(!dir.exists()) 
				dir.mkdirs(); // ????????? ?????? ?????? ??????
			
			//???????????? postFile????????? ?????? list??????
			List<PostFile> pFList = new ArrayList<>();
		
			for(MultipartFile upFile : upFiles) {	
				if(upFile.isEmpty() || upFile.getSize() == 0)
					continue;
				log.info("upFile = {}", upFile);
				log.info("upFile.name = {}", upFile.getOriginalFilename());
				log.info("upFile.size = {}", upFile.getSize());
				//????????? ????????? ??????
				File renamedFile = FileUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());
				//?????? ??????
				upFile.transferTo(renamedFile);
				log.info("renamedFile = {}", renamedFile);
				log.info("upFile = {}", upFile);
				//PostFile????????????
				PostFile pF = new PostFile();
				pF.setPostOriginalFileName(upFile.getOriginalFilename());
				pF.setPostRenamedFileName(renamedFile.getName());
				pFList.add(pF);
				log.info("pFList = {}", pFList);
			}
			
			//1. ????????????
			post.setPostFileList(pFList);
			post.setBoardNo(boardNo);
			post.setId(id);
			log.info("post = {}", post);
			int result = boardService.insertPost(post);
			
			//2. ??????????????????
			String msg = result > 0 ? "???????????? ?????????????????????" : "????????? ????????? ?????????????????????";
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error("????????? ?????? ??????!", e);
			throw e;
		}

		return "redirect:/board/boardList?boardNo=" + boardNo  + "&workspaceId=" + workspaceId + "&dept=";
	}
	
	
	
	@GetMapping(
			value = "/fileDownload", 
			produces = "application/octet-stream;charset=utf-8"
		)
	@ResponseBody
	public Resource fileDownload(@RequestParam int postFile, 
								HttpServletResponse response) throws UnsupportedEncodingException{
		
		//1.????????????
		PostFile pFile = boardService.selectOnePostFile(postFile);
		log.info("pFile = {}", pFile);
	
		String postOriginalFileName = pFile.getPostOriginalFileName();
		String postRenamedFileName = pFile.getPostRenamedFileName();
		
		//2. Resource??????
		String saveDirectory = servletContext.getRealPath("/resources/upload/board");
		File downFile = new File(saveDirectory, postRenamedFileName);
		String location = "file:" + downFile;
		log.info("location = {}", location);
		Resource resource = new FileSystemResource(downFile);
		
		//3. ????????????
		//???????????? ?????? ??????
		postOriginalFileName = new String(postOriginalFileName.getBytes("utf-8"), "iso-8859-1");
		response.setContentType("application/octet-stream;charset=utf-8");
		response.addHeader("Content-Disposition", "attachment;filename=\"" + postOriginalFileName + "\"");
		
		return resource;
	}
	
	
	
	@PostMapping("/postModify")
	public String postUpdate(@ModelAttribute("postList") PostList postList, 
							 @ModelAttribute("postFile") PostFile postFile, 
							 @RequestParam String workspaceId, 
							 RedirectAttributes redirectAttr,
							 HttpServletRequest request, 
							 @RequestParam(value="upFile", required = false) MultipartFile[] upFiles) throws Exception{
								
		log.info("postList = {}", postList);
		log.info("postFile = {}", postFile);
		
		
		try {
			log.info("post = {}", postList);
			log.info("upFiles = {}", upFiles);
			
			//0. ?????? ?????? ??? Attachment?????? ??????
			//????????????
			String saveDirectory = 
					request.getServletContext().getRealPath("/resources/upload/board");
			//File????????? ????????? directory??????
			File dir = new File(saveDirectory);
			if(!dir.exists()) 
				dir.mkdirs(); // ????????? ?????? ?????? ??????
			
			//???????????? postFile????????? ?????? list??????
			List<PostFile> pFList = new ArrayList<>();

			
			for(MultipartFile upFile : upFiles) {	
				if(upFile.isEmpty() || upFile.getSize() == 0)
					continue;
				log.info("upFile = {}", upFile);
				log.info("upFile.name = {}", upFile.getOriginalFilename());
				log.info("upFile.size = {}", upFile.getSize());
				//????????? ????????? ??????
				File renamedFile = FileUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());
				//?????? ??????
				upFile.transferTo(renamedFile);
				log.info("renamedFile = {}", renamedFile);
				log.info("upFile = {}", upFile);
				//PostFile????????????
				PostFile pF = new PostFile();
				pF.setPostOriginalFileName(upFile.getOriginalFilename());
				pF.setPostRenamedFileName(renamedFile.getName());
				pF.setPostNo(postFile.getPostNo());
				pFList.add(pF);

				log.info("pFList = {}", pFList);
			}

			//1. ????????????
			postList.setPostFileList(pFList);
			log.info("post = {}", postList);
			int result = boardService.updatePost(postList);
			log.info("result = {}", result);
			//2. ??????????????????
			String msg = result > 0 ? "???????????? ?????? ?????????????????????" : "????????? ????????? ?????????????????????";
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error("????????? ?????? ??????!", e);
			throw e;
		}
			
		return "redirect:/board/boardList?boardNo=" + postList.getBoardNo()  + "&workspaceId=" + workspaceId + "&dept=";
	}

	
	
	@PostMapping("/postDelete")
	public String postDelete(@RequestParam int postNo, 
							@RequestParam int boardNo, 
							@RequestParam String workspaceId, 
							RedirectAttributes redirectAttr) {
		//1. ????????????
		int result = boardService.updateDelPost(postNo);
		log.info("result = {}", result);
		
		//2. ??????????????????
		String msg = result > 0 ? "???????????? ?????????????????????" : "????????? ????????? ?????????????????????";
		redirectAttr.addFlashAttribute("msg", msg);
		log.info("boardNo = {}", boardNo);
		
		
		return "redirect:/board/boardList?boardNo=" + boardNo + "&workspaceId=" + workspaceId + "&dept=" ;
	}
	

	
	@PostMapping("/commentInsert")
	public String commentInsert(PostComment postComment,
							  RedirectAttributes redirectAttr,
							  HttpServletRequest request) {

			//1. ????????????
			log.info("postComment = {}", postComment);
			int result = boardService.insertPostComment(postComment);
			
			//2. ??????????????????
			String msg = result > 0 ? "????????? ?????????????????????" : "?????? ????????? ?????????????????????";
			redirectAttr.addFlashAttribute("msg", msg);
		

		return "redirect:/board/boardView?postNo=" + postComment.getPostNo();
	}
	
	
	@PostMapping("/commentDelete")
	public String commentDelete(@RequestParam int postNo,
								@RequestParam int commentNo, 
								RedirectAttributes redirectAttr) {
		//1. ????????????
		int result = boardService.commentDelete(commentNo);
		log.info("result = {}", result);
		
		//2. ??????????????????
		String msg = result > 0 ? "????????? ?????????????????????" : "?????? ????????? ?????????????????????";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/board/boardView?postNo=" + postNo;
	}
	
	@PostMapping("/fileDelete")
	@ResponseBody
	public void fileDelete(@RequestParam int deleteNo) {
		log.info("deleteNo = {}", deleteNo);
		//1. ????????????
		boardService.deletePost(deleteNo);
	}
	
	
	
	
	
	
}
