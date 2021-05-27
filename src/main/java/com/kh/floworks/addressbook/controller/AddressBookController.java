package com.kh.floworks.addressbook.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.addressbook.model.service.AddressBookService;
import com.kh.floworks.common.utils.PageBarUtils;
import com.kh.floworks.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


/**
 * @param id : 주소록에 추가된 아이디
 * @param owner : 현재 주소록의 주인 
 *
 */
@Slf4j
@RequestMapping("/address")
@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService addressBookService;
	
	@GetMapping("/list")
	public String addressList(String owner,
                              @RequestParam(defaultValue = "1") int cPage, 
                              HttpServletRequest request,
                              Model model) {
		final int numPerPage = 5;
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", 5);
		param.put("cPage", cPage);
		param.put("owner", owner);
		
		int totalContents = addressBookService.getTotalAddressBook(owner);
		String url = request.getRequestURI() + "?owner=" + owner;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		List<Member> memberList = addressBookService.selectAddressMemberList(param);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageBar", pageBar);
		
		return "/address/addressBook";
	}
	
	@ResponseBody
	@GetMapping("/search")
	public List<Member> searchMember(String type, String keyword, String id,String workspaceId) {
		
		try {
			
			Map<String, Object> param = new HashMap<>();

			param.put("type", type);
			param.put("keyword", keyword);
			param.put("id", id);
			param.put("workspaceId", workspaceId);
			
			List<Member> memberList = addressBookService.selectSearchMemberList(param);

			return memberList;
			
		}catch (NullPointerException e) {
			throw e;
		}
	}
	
	@PostMapping("/add")
	public ResponseEntity<String> addAddress(String id, String owner){
		
		try {
			log.info("id={}owner={}",id,owner);
			
			Map<String, String> param = new HashMap<>();
			
			param.put("id", id);
			param.put("owner", owner);
			
			addressBookService.insertAddress(param);
			String msg = id + "님이 주소록에 추가되었습니다.";
			return ResponseEntity.ok()
					             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					             .body(msg);
			
		} catch (NullPointerException e) {
			throw e;
		}					
	}
	
	
}
