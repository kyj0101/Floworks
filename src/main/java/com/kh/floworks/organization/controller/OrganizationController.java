package com.kh.floworks.organization.controller;

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

import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.common.utils.PageBarUtils;
import com.kh.floworks.organization.model.service.OrganizationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/organization")
@Slf4j
public class OrganizationController {

	@Autowired
	private OrganizationService organizationService;
	
	@GetMapping("/organizationChart")
	public void organiztionChart(@RequestParam(defaultValue = "1") int cPage,
								@RequestParam String workspace,
								@RequestParam String dept,
								Model model,
								HttpServletRequest request) {
		
		//1. 사용자입력값
	      int numPerPage = 10;
	      log.info("cPage = {}", cPage);
	      Map<String, Object> param = new HashMap<>();
	      param.put("numPerPage", numPerPage);
	      param.put("cPage", cPage);
	      param.put("workspace", workspace);
	      param.put("dept", dept);
	      
	     
	      //2. 업무로직
	      List<UserList> userList = organizationService.selectUserList(param);
	      log.info("userList = {}", userList);
	      
	      //b. pagebar영역
	      int totalContents = organizationService.getTotalContents(param);
	      String url = request.getRequestURI() + "?workspace=" + workspace + "&dept=" + dept;
	      log.info("totalContents = {}", totalContents);
	      log.info("url = {}", url);
	      String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
	      
	      
	      //3. jsp처리 위임
	      model.addAttribute("userList", userList);
	      model.addAttribute("pageBar", pageBar);

	}

}
