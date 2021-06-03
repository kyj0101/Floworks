package com.kh.floworks.calendar.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
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
	public void calendarMain(@RequestParam String id, Model model) {
		log.info("cal컨트롤러 테스트");
		log.info("cal컨트롤러 select--------------------------------------");
		List<Calendar> calendarList = calendarService.selectListCalendar(id);
		
		model.addAttribute("calendarList", calendarList);
		
	}

	@PostMapping("/calendarInsert")
    public String calendarInsert(String id, @RequestParam String dateList) {
		try {
			Gson gson = new Gson();
			List<Map<String, String>> dateMapList = new ArrayList<>();
			dateMapList = (List<Map<String, String>>) gson.fromJson(dateList, dateMapList.getClass());
			
			for(Map<String, String> map : dateMapList) {
				
				map.put("id", id);
				Set<String> keySet = map.keySet();
				
				for(String key:keySet) {
					log.info("date{} key{}", map.get(key), key);
				}
				calendarService.insertCal(map);
			}
		} catch (Exception e) {
			throw e;
		}
        return "redirect:/calendar/calendarMain.do?id=" + id;
    }



	
//  for(Map<String, String> map : dateMapList) {
//  
//  	Set<String> keySet = map.keySet();
//  	
//  	for(String key:keySet) {
//  		log.info("key{} date", map.get(key), key);
//  	}
//  }
	
//	@GetMapping("/calendarMain")
//	public String calendarSelete(@RequestParam String id, Model model) {
//		log.info("cal컨트롤러 select--------------------------------------");
//		Calendar calnedar = calendarService.selectOneCalendar(id);
//		
//		
//		return "/calnedar/calendarMain";
//	}
}