package com.kh.floworks.addressbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.addressbook.model.service.AddressBookService;
import com.kh.floworks.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/address")
@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService addressBookService;
	
	@GetMapping("/list")
	public String addressList() {
		return "/address/addressBook";
	}
	
	@ResponseBody
	@GetMapping("/search")
	public List<Member> searchMember(String type, 
                                     String keyword,
                                     String id,
                                     String workspaceId,
                                     @RequestParam(defaultValue = "1") int cPage) {

		Map<String, Object> param = new HashMap<>();

		param.put("type", type);
		param.put("keyword", keyword);
		param.put("id", id);
		param.put("workspaceId", workspaceId);
		
		log.info("{}",id);
		List<Member> memberList = addressBookService.selectSearchMemberList(param);
		
		log.info("{}",memberList);
		return memberList;
	}
}
