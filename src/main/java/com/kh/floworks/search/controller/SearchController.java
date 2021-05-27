package com.kh.floworks.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.floworks.common.utils.EmailUtils;
import com.kh.floworks.common.utils.PageBarUtils;
import com.kh.floworks.common.utils.SearchListUtils;
import com.kh.floworks.email.model.vo.Email;
import com.kh.floworks.search.model.service.SearchService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/search")
@Slf4j
public class SearchController {

	@Autowired
	private SearchService searchServcie;


	@GetMapping("/post")
	public String searchPost(String keyword, 
			                 @RequestParam(defaultValue = "1") int cPage,
			                 HttpServletRequest request,
			                 Model model) {
		try {

			Map<String, Object> param = new HashMap<>();

			param.put("numPerPage", SearchListUtils.numPerPage);
			param.put("cPage", cPage);
			param.put("keyword", keyword);

			int totalContents = searchServcie.getTotalSearchPost(keyword);
			String url = request.getRequestURI() + "?keyword=" + keyword;
			String pageBar = PageBarUtils.getPageBar(totalContents, cPage, SearchListUtils.numPerPage, url);

			List<Map<String, Object>> postList = searchServcie.selectSearchPostList(param);

			for (Map<String, Object> postMap : postList) {

				String content = (String) postMap.get("postContent");
				content = SearchListUtils.shorteningContent(content);

				postMap.put("postContent", content);
			}

			model.addAttribute("postList", postList);
			model.addAttribute("pageBar", pageBar);

			return "/search/searchResult";

		} catch (NullPointerException e) {
			throw e;
		}
	}
		
		//보낸 이메일 : 작성자, 받은 사람, 내용, 발송일
		//받은 이메일 : 작성자, 받은 사람, 내용, 발송일
		//보낸이메일, 받은이메일 두번 DB에 가져와야할듯
		@GetMapping("/email/sent")
		public String searchEmail(String keyword, 
				                  String id, 
				                  @RequestParam(defaultValue = "1") int cPage,
				                  HttpServletRequest request, Model model) {
			try {

				Map<String, Object> param = new HashMap<>();

				param.put("numPerPage", SearchListUtils.numPerPage);
				param.put("cPage", cPage);
				param.put("keyword", keyword);
				param.put("id", id);

				int totalContents = searchServcie.getTotalSearchEmailSent(param);
				String url = request.getRequestURI() + "?keyword=" + keyword + "&id=" + id;
				String pageBar = PageBarUtils.getPageBar(totalContents, cPage, SearchListUtils.numPerPage, url);

				List<Email> emailSentList = searchServcie.selectSearchEmailSent(param);
				emailSentList = EmailUtils.shorteningLetters(emailSentList);

				model.addAttribute("emailSentList", emailSentList);
				model.addAttribute("pageBar", pageBar);

				return "/search/searchResult";

		} catch (NullPointerException e) {
				throw e;
		}
	}

	//이메일 파일, 게시판 파일, (전자결재는 일단 보류)
	public String searchFile() {
		return "/search/searchResult";
	}
	
}
