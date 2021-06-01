package com.kh.floworks.calendar.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.floworks.calendar.model.service.CalendarService;

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
	
	@PostMapping("/calendarInsert")
	public String calendarInsert(@RequestParam String dateList, RedirectAttributes redirectAttr) {
		log.info("dateList = {}", dateList);
		
		Gson gson = new Gson();
		Map<String, String>[] dateMapList = gson.fromJson(dateList, Map[].class);
		
		int result = calendarService.insertCal(dateList);
		String msg = result > 0 ? "일정 입력 성공!" : "일정 입력 실패! 다시 입력 해주세요.";
		log.info("dateMapList = {}", dateMapList);
		for(Map<String, String> date : dateMapList)
			log.info("date = {}", date);
		
		//2. 리다이렉트 및 사용자 피드백
		redirectAttr.addFlashAttribute("msg", msg);
				
		return "redirect:/calendar/calendarMain.do";
	}
	
	

}
