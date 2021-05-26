package com.kh.floworks.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.calendar.model.service.CalendarService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/calendar")
public class CalendarController {  
//	
//	@Autowired
//	private CalendarService calendarService;
	
	@GetMapping("/calendarMain")
	public String calendarMain() {
		log.info("cal컨트롤러 테스트");
		return "/calendar/calendarMain";
	}
	
	//일정추가팝업
	@GetMapping("/calendarPopup")
	public String calendarPopup() throws Exception {
		return "/calendar/calendarPopup";
	}
	
//	//일정 관리 페이지
//	@RequestMapping("/calendarMain")
//	public String calendar(Model model)throws Exception {
//		
//		model.addAttribute("showSchedule" , CalendarService.showSchedule());
//		
//		return "/calendar/calendarkMain";
//	}
	
//	//일정 추가 버튼 클릭 Ajax
//	@ResponseBody
//	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
//	public Map<Object,Object> addSchedule(@RequestBody Calendar vo) throws Exception{
//		Map<Object,Object>map = new HashMap<Object,Object>();
//
//		CalendarService.addSchedule(vo);
//	
//		return map;
//	}
//
//	//일정 보이기 (임시)
//	@ResponseBody
//	@RequestMapping(value = "/showSchedule")
//	public List<Calendar> showSchedule() throws Exception {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
//		
//		List<Calendar> list = CalendarService.showSchedule();
//		
//		return list;
//	}
}
