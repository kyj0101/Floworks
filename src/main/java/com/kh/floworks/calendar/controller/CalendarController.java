package com.kh.floworks.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.calendar.model.service.CalendarService;
import com.kh.floworks.calendar.model.vo.Calendar;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/calendar")
public class CalendarController {  
	
	@Autowired
	private CalendarService calendarService;

	
	@GetMapping("/calendarMain")
	public String calendarMain() {
		log.info("cal컨트롤러 테스트");
		return "/calendar/calendarMain";
	}
	
	//일정 관리 페이지
	@PostMapping("/calendarMain")
	public String calendar(Model model) throws Exception {
		log.info("----------------------컨드롤러다 --------------------------");
		log.info("model",model);
		
		model.addAttribute("showSchedule",calendarService.showSchedule(model));
		
		return "/calendar/calendarkMain";
	}
	
	//일정추가팝업
	@GetMapping("/calendarPopup")
	public String calendarPopup() throws Exception {
		return "/calendar/calendarPopup";
	}
	
	//일정 추가 버튼 클릭 Ajax......아닌가?
	//form 데이터를 받는 controller 
	@ResponseBody
	@PostMapping("/addSchedule")
	public Map<Object, Object> addSchedule(@RequestBody Calendar vo) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		log.info("=========================================");

		CalendarService.addSchedule(vo);
	
		return map;
	}
	
	@RequestMapping(value="/calendarMain")
	public String schedule(Model model)throws Exception{
		model.addAttribute("showSchedule", calendarService.showSchedule(model));
		log.info("겟방식의로 보내는중.");
		return "/calendarMain";
	}
	
	//일정 보이기 (임시)
	//
	@ResponseBody
	@GetMapping("/showSchedule")
	public List<Calendar> showSchedule() throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		
		List<Calendar> list = CalendarService.showSchedule();
		
		return list;
	}
}
