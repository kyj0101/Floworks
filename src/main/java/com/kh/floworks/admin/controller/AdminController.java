package com.kh.floworks.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.floworks.admin.model.service.AdminService;
import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;
import com.kh.floworks.attendance.model.service.AttendanceService;
import com.kh.floworks.common.utils.PageBarUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {


   @Autowired
   private AdminService adminService;
   
   @Autowired
   private AttendanceService attendanceService;
   
   //직원 전체 목록
   @GetMapping("/userList")
   public void userList(@RequestParam(defaultValue = "1") int cPage,
         @RequestParam String workspace, 
         Model model,
         HttpServletRequest request) {
      
      //1. 사용자입력값
      int numPerPage = 15;
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
   

   //직원정보 상세보기 + 수정하기
   @GetMapping("/userDetail")
   public void userDetail(@RequestParam String userId, Model model) {
	   //1. 업무로직
	   UserDetail userDetail = adminService.selectOneUserCollection(userId);
	   
	   //2. jsp처리 위임
	   model.addAttribute("userDetail", userDetail);
	}	

   
   @GetMapping("/attendList")
   public void attendanceList(Model model) {
         
      //1. 사용자입력값
      
      //2. 업무로직
      List<AttendList> attendList = adminService.selectAttendList();
      //3. jsp처리 위임
         
         model.addAttribute("attendList", attendList);
   }


   


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===================== 강유정 근태 설정 ========================
	
	@GetMapping("/attendance/setting")
	public String attendanceSettingView(String workspaceId, Model model) {

		try {

			Map<String, Object> attendanceSystemMap = attendanceService.selectAttendanceSystem(workspaceId);

			model.addAttribute("attendanceSystem", attendanceSystemMap);
			model.addAttribute("workspaceId", workspaceId);

			return "/admin/attendanceSetting";

		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	@PostMapping("/attendance/setting")
	public String attendanceSettingView(String officeInTime, String officeOffTime, String lunchTimeStart,
			String lunchTimeEnd, String flexTimeYn, String memo, String workspaceId) {
		try {

			Map<String, Object> param = new HashMap<>();

			param.put("officeInTime", officeInTime);
			param.put("officeOffTime", officeOffTime);
			param.put("lunchTimeStart", lunchTimeStart);
			param.put("lunchTimeEnd", lunchTimeEnd);
			param.put("flexTimeYn", "on".equals(flexTimeYn) ? "Y" : "N");
			param.put("memo", memo);
			param.put("workspaceId", workspaceId);

			adminService.updateAttendanceSystem(param);

			return "redirect:/admin/attendance/setting?workspaceId=" + workspaceId;

		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
}

