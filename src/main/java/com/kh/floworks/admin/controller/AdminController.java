package com.kh.floworks.admin.controller;

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

import com.kh.floworks.admin.model.service.AdminService;
import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.common.utils.PageBarUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/userList")
	public void userList(@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String workspace, 
			Model model,
			HttpServletRequest request) {
		
		//1. 사용자입력값
		int numPerPage = 10;
		log.info("cPage = {}", cPage);
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		
		//2. 업무로직
		List<UserList> userList = adminService.selectUserList(param, workspace);
		log.info("userList = {}", userList);
		
		//b. pagebar영역
		int totalContents = adminService.getTotalContents(workspace);
		String url = request.getRequestURI() + "?workspace=" + workspace;
		log.info("totalContents = {}", totalContents);
		log.info("url = {}", url);
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		
		//3. jsp처리 위임
		model.addAttribute("userList", userList);
		model.addAttribute("pageBar", pageBar);
	}
	
	
	@GetMapping("/userDetail")
	public void memberDetail(Model model) {
		
		//2. 업무로직
		//List<UserDetail> userDetail = adminService.selectOneDetail();
		//3. jsp처리 위임
		//model.addAttribute("userList", userDetail);
	}

	
	
	
	@GetMapping("/attendList")
	public void attendanceList(Model model) {
			
		//1. 사용자입력값
		
		//2. 업무로직
		List<AttendList> attendList = adminService.selectAttendList();
		//3. jsp처리 위임
			
			model.addAttribute("attendList", attendList);

	}
	

	
}
