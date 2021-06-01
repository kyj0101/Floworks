package com.kh.floworks.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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

import com.kh.floworks.attendance.model.service.AttendanceService;
import com.kh.floworks.attendance.model.vo.Attendance;
import com.kh.floworks.common.utils.AttendanceUtils;
import com.kh.floworks.common.utils.PageBarUtils;

import lombok.extern.slf4j.Slf4j;


@RequestMapping("/attendance")
@Controller
@Slf4j
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping("/view")
	public String attendanceView(String workspaceId, String id, Model model) {
		
		try {
			
			Calendar calendar = Calendar.getInstance();
			
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			
			Map<String, Object> param = new HashMap<>();
			
			param.put("id", id);
			param.put("month", Calendar.DAY_OF_MONTH );

			//일주일의 시작이 일요일 기준이기 때문에 추가적인 처리를 해야한다.
			int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
			SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			
			if(dayOfWeek == 1) {
				calendar.add(Calendar.DATE, -7); //월요일
				param.put("startOfWeek", new Date(calendar.getTimeInMillis()));
				
				calendar.add(Calendar.DAY_OF_WEEK, 7); //일요일
				param.put("endOfWeek", new Date(calendar.getTimeInMillis()));
			
			}else {
				calendar.set(Calendar.DAY_OF_WEEK, (Calendar.MONDAY-1)); //월요일
				param.put("startOfWeek", new Date(calendar.getTimeInMillis()));

				calendar.add(Calendar.DAY_OF_WEEK, 7); //일요일
				param.put("endOfWeek", new Date(calendar.getTimeInMillis()));
			}

			int latenessCount = attendanceService.selectLatenessCount(param);
			Attendance attendance = attendanceService.selectOneAttendance(id);

			Map<String, Object> attendanceSystem = attendanceService.selectAttendanceSystem(workspaceId);
			List<Attendance> weekOfficeAttendance = attendanceService.selectweekOfficeHours(param);
			List<Attendance> monthOfficeAttendance = attendanceService.selectmonthOfficeHours(param);
			
			for(Attendance a : weekOfficeAttendance) {
				log.info("{}",a);
			}
			
			String lunchTimeStart = (String)attendanceSystem.get("lunchTimeStart");
			String lunchTimeEnd = (String)attendanceSystem.get("lunchTimeEnd");
			
			double lunchTime = AttendanceUtils.getTimeDifference(lunchTimeStart, lunchTimeEnd);
			double weekLunchTime = weekOfficeAttendance.size() * lunchTime;
			double monthLunchTime = monthOfficeAttendance.size() * lunchTime;

			model.addAttribute("attendance", attendance);
			model.addAttribute("latenessCount", latenessCount);
			model.addAttribute("attendanceSystem", attendanceSystem);
			model.addAttribute("weekOfficeHours", AttendanceUtils.getOfficeHoursToString(weekOfficeAttendance, weekLunchTime));
			model.addAttribute("monthOfficeHours", AttendanceUtils.getOfficeHoursToString(monthOfficeAttendance, monthLunchTime));
			
			return "/attendance/myAttendanceCheck";
			
		} catch (NullPointerException e) {
			throw e;
		}
	}

	/**
	 * 
	 * @param id : 출근 기록을 하는 사용자 아이디
	 * @param officeInTimeSystem : 몇 시까지 출근해야하는지 (출근제도시간)
	 */
	@PostMapping("/office/in")
	public String officeIn(String id,
			               String workspaceId,
			               @RequestParam(value = "officeInTime") String officeInTimeSystem,
			               Model model) {
	
		try {
			
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
			Calendar calendar = Calendar.getInstance();
			Date now = new Date(calendar.getTimeInMillis());
			
			//실제 insert에는 아래 코드 사용 
			String time = timeFormat.format(now);

			double latenessDouble = AttendanceUtils.getTimeDifference(time,officeInTimeSystem);
			String latenessYn = (latenessDouble / 1000 / 60) > 0 ? "N" : "Y";
	
			Attendance attendance = new Attendance(id, now, now, null, latenessYn);
			attendanceService.insertAttendanceOfficeIn(attendance);
			
			return "redirect:/attendance/view?workspaceId=" + workspaceId + "&id=" + id;
			
		} catch (NullPointerException e) {
			throw e;
		}
	}
	
	@PostMapping("/office/off")
	public String  officeOff(String id,
                             String workspaceId,
                             @RequestParam(value = "officeInTime") String officeInTimeSystem,
                             Model model) throws Exception {
		try {
			
			Calendar calendar = Calendar.getInstance();
			Date now = new Date(calendar.getTimeInMillis());
			
			Map<String, Object> param = new HashMap<>();
			param.put("now", now);
			param.put("id", id);
		
			attendanceService.updateAttendanceOfficeOff(param);
			
			return "redirect:/attendance/view?workspaceId=" + workspaceId + "&id=" + id;
			
		} catch (NullPointerException e) {
			throw e;
		}
	}
	
	@GetMapping("/list")
	public String attendanceList(String id,
			                     @RequestParam(defaultValue = "1") int cPage,	
			                     HttpServletRequest request,
			                     Model model) {
		int numPerPage = 10;
		Map<String, Object> param = new HashMap<>();
		
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		param.put("id", id);
		
		int totalContents = attendanceService.getTotalAttendance(id);
		String url = request.getRequestURI() + "?id=" + id;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		List<String> yearList = attendanceService.selectAttendanceYear(id);
		List<String> monthList = attendanceService.selectAttendanceMonth(id);
		List<Attendance> attendanceList = attendanceService.selectListAttendance(param);
		
		model.addAttribute("yearList", yearList);
		model.addAttribute("monthList", monthList);
		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("pageBar", pageBar);
		
		return "/attendance/myAttendanceList";
	}
} 

