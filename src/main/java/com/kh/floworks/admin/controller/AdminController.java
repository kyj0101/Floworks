package com.kh.floworks.admin.controller;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 직원 전체 목록
	@GetMapping("/userList")
	public void userList(@RequestParam(defaultValue = "1") int cPage, @RequestParam String workspace, Model model,
			HttpServletRequest request) {

		// 1. 사용자입력값
		int numPerPage = 15;
		log.info("cPage = {}", cPage);
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);

		// 2. 업무로직
		List<UserList> userList = adminService.selectUserList(param, workspace);
		log.info("userList = {}", userList);

		// b. pagebar영역
		int totalContents = adminService.getTotalContents(workspace);
		String url = request.getRequestURI() + "?workspace=" + workspace;
		log.info("totalContents = {}", totalContents);
		log.info("url = {}", url);
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);

		// 3. jsp처리 위임
		model.addAttribute("userList", userList);
		model.addAttribute("pageBar", pageBar);

	}

	// 직원정보 상세보기
	@GetMapping("/userDetail")
	public void userDetail(@RequestParam String userId, Model model) {
		// 1. 업무로직
		UserDetail userDetail = adminService.selectOneUserDetail(userId);
		log.info("userDetail = {}", userDetail);

		// 2. jsp처리 위임
		model.addAttribute("userDetail", userDetail);
	}

	// 직원정보수정하기
	@PostMapping("/userUpdate")
	public String userUpdate(@ModelAttribute("userDetail") UserDetail userDetail, RedirectAttributes redirectAttr) {
		// 1. 업무로직
		int result = adminService.userUpdate(userDetail) + adminService.memberUpdate(userDetail);
		log.info("userDetail = {}", userDetail);
		// 2. 사용자피드백
		String msg = result > 0 ? "해당 직원의 정보가 수정되었습니다" : "해당 직원의 정보 수정에 실패하였습니다";
		redirectAttr.addFlashAttribute("msg", msg);

		return "redirect:/admin/userList?workspace=" + userDetail.getWorkspaceId();

	}

	@GetMapping("/attendList")
	public void attendanceList(@RequestParam(defaultValue = "1") int cPage, @RequestParam String workspaceId,
			Model model, HttpServletRequest request) {

		// 모델에는 딱히 값이 없다....(값을 받는다기 보다 jsp로 값을 보내주는게 주 역할)

		// 1. 사용자입력값
		int numPerPage = 13;

		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);

		// 2. 업무로직
		List<AttendList> attendList = adminService.selectAttendList(param, workspaceId);
		List<String> yearList = adminService.selectAllMemberAttendanceYear(workspaceId);
		List<String> monthList = adminService.selectAllMemberAttendanceMonth(workspaceId);
		
		// b. pagebar영역
		int totalContents = adminService.getTotalAttendContents(workspaceId);
		String url = request.getRequestURI() + "?workspaceId=" + workspaceId;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);

		// 3. jsp처리 위임
		model.addAttribute("yearList",yearList);
		model.addAttribute("monthList", monthList);
		model.addAttribute("attendList", attendList);
		model.addAttribute("pageBar", pageBar);
	}
	
	@GetMapping("/attend/search")
	public String searchAttendanceList(String id,			                         
			                           String year,
			                           String month,
			                           String day,
			                           String workspaceId,
			                           @RequestParam(defaultValue = "1") int cPage,
			                           HttpServletRequest request,
			                           Model model) {
		try {
			
			int numPerPage = 13;
			
			Map<String, Object> param = new HashMap<>();
			
			param.put("numPerPage", AttendanceService.NUMPER_PAGE);
			param.put("cPage", cPage);
			param.put("id", id);
			param.put("year", year);
			param.put("month", month);
			param.put("day", day);
			param.put("workspaceId", workspaceId);

			List<AttendList> attendList = adminService.selectSearchAttendList(param);
			List<String> yearList = adminService.selectAllMemberAttendanceYear(workspaceId);
			List<String> monthList = adminService.selectAllMemberAttendanceMonth(workspaceId);

			int totalContents = adminService.getTotalSearchAttendContents(param);
			String url = request.getRequestURI() 
					   + "?id=" + id 
					   + "&year=" + year
					   + "&month=" + month
					   + "&day=" + day
					   + "&workspaceId=" + workspaceId;
			String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);


			model.addAttribute("yearList",yearList);
			model.addAttribute("monthList", monthList);
			model.addAttribute("attendList", attendList);
			model.addAttribute("pageBar", pageBar);
			
			return "/admin/attendList";
			
		} catch (Exception e) {
			throw e;
		}		
	}
	
	
	@GetMapping("/attend/detail")
	public String attendDetail(String id, String day, Model model){
		
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("day", day);
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		
		Map<String, Object> attendMap = adminService.selectOneAttend(param);
		
		Timestamp officeInDate = (Timestamp) attendMap.get("officeIn"); 
		Timestamp officeOffDate = (Timestamp) attendMap.get("officeOff");
		
		attendMap.put("officeIn", timeFormat.format(officeInDate));
		
		if(officeOffDate != null) {
			attendMap.put("officeOff", timeFormat.format(officeOffDate));			
		}
		

		model.addAttribute("attendMap", attendMap);
		
		return "/admin/attendDetail";
	}
	
	@PostMapping("/attend/detail/update")
	public String attendDetailUpdate(String id,
			                         String workspaceId,
			                         String day,
			                         String officeIn,
			                         String officeOff,
			                         String latenessYn) throws ParseException {
		try {
			Map<String, Object> param = new HashMap<>();
			SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm");			
			Date officeInDate = format.parse(day + " " + officeIn);

			if(officeOff != null) {
				Date officeOffDate = format.parse(day + " " + officeOff);
				param.put("officeOff", officeOffDate);
			}
			
			param.put("id", id);
			param.put("day", day);
			param.put("officeIn", officeInDate);
			param.put("latenessYn", latenessYn);
			
			adminService.updateAttend(param);
			
			return "redirect:/admin/attendList?workspaceId=" + workspaceId;

		} catch (ParseException e) {
			throw e;
		}
	}

	@GetMapping("/attendance/setting")
	public String attendanceSettingView(String workspaceId, Model model) {

		try {

			Map<String, Object> attendanceSystemMap = attendanceService.selectAttendanceSystem(workspaceId);

			model.addAttribute("attendanceSystem", attendanceSystemMap);
			model.addAttribute("workspaceId", workspaceId);

			return "/admin/attendanceSetting";

		} catch (Exception e) {
			throw e;
		}
	}

	@PostMapping("/attendance/setting")
	public String attendanceSettingUpdate(String officeInTime,
			                              String officeOffTime,
			                              String lunchTimeStart,
			                              String lunchTimeEnd,
			                              String workingTime,
			                              String flexTimeYn,
			                              String memo,
			                              String workspaceId,
			                              RedirectAttributes redirectAttr) {
		try {

			Map<String, Object> param = new HashMap<>();

			param.put("officeInTime", officeInTime);
			param.put("officeOffTime", officeOffTime);
			param.put("lunchTimeStart", lunchTimeStart);
			param.put("lunchTimeEnd", lunchTimeEnd);
			param.put("workingTime", workingTime);
			param.put("flexTimeYn", "on".equals(flexTimeYn) ? "Y" : "N");
			param.put("memo", memo);
			param.put("workspaceId", workspaceId);

			adminService.updateAttendanceSystem(param);
			redirectAttr.addFlashAttribute("msg", "수정되었습니다.");

			return "redirect:/admin/attendance/setting?workspaceId=" + workspaceId;

		} catch (Exception e) {
			throw e;
		}
	}

	@GetMapping("/leave/setting")
	public String leaveSettingView(String workspaceId, Model model) {

		try {

			List<Map<String, Object>> leaveSystemMapList = adminService.selectLeaveSystem(workspaceId);

			model.addAttribute("leaveSystemMapList", leaveSystemMapList);
			model.addAttribute("workspaceId", workspaceId);

			return "/admin/leaveSetting";

		} catch (Exception e) {
			throw e;
		}
	}

	@ResponseBody
	@PostMapping("/leave/setting")
	public void leaveSettingUpdate(String workspaceId, String position, int leaveDay) {

		try {

			Map<String, Object> param = new HashMap<>();

			param.put("workspaceId", workspaceId);
			param.put("position", position);
			param.put("leaveDay", leaveDay);

			adminService.updateLeaveSystem(param);

		} catch (Exception e) {
			throw e;
		}
	}

}