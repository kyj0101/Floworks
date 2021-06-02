package com.kh.floworks.calendar.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public String calendarInsert(@RequestParam Map<String, Object> calendarDate, 
								 HttpServletRequest request, 
								 RedirectAttributes redirectAttr) {
		log.debug("calendarDate = {}", calendarDate);
		
		Gson gson = new Gson();
	
		try {
			//44번째 fromJson에서부터 막혀서 여기부터 51번째줄까지 주석처리했습니다!
//			Map<String, Object>[] dateMapList = gson.fromJson(calendarDate, Map[].class);
//			log.info("dateMapList = {}", dateMapList);
			
//			int result = calendarService.insertCal(calendarDate);
//			String msg = result > 0 ? "일정 입력 성공!" : "일정 입력 실패! 다시 입력해주세요";
			
//			for(Map<String, Object> date : dateMapList)
//				log.info("date = {}", date);
				//map.put("msg", "")
		} catch(Exception e){
			log.error("일정 등록 실패!", e);	
			throw e;
		}
		return null;
	}


//	@PostMapping("/calendarInsert")
//    public String calendarInsert(@RequestParam String dateList) {
//        log.info("dateList = {}", dateList);ß
//
//        Gson gson = new Gson();
//        Map<String, String>[] dateMapList = gson.fromJson(dateList, Map[].class);
//
//        log.info("dateMapList = {}", dateMapList);
//        for(Map<String, String> date : dateMapList)
//            log.info("date = {}", date);
//
//        return "redirect:/calendar/calendarMain.do";
//    }



	

}
