package com.kh.floworks.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		log.info("--------------------------------------calendar컨트롤러--------------------------------------");
		List<Calendar> calendarList = calendarService.selectListCalendar(id);
		log.debug("calendarList = {}", calendarList);
		
		model.addAttribute("calendarList", calendarList);
		
	}

	@PostMapping("/calendarInsert")
    public String calendarInsert(@ModelAttribute Calendar cal,
    								RedirectAttributes redirectAttr) {
		try {
			log.debug("calInsert = {}", cal);
			
			int result = calendarService.insertCalendar(cal);
			
			String msg = "일정 등록 성공!";
			redirectAttr.addFlashAttribute("msg", msg);
		
		} catch (Exception e) {
			log.error("일정 등록 오류!", e);
			throw e;
		}
        return "redirect:/calendar/calendarMain.do?id=" + cal.getId();
    }
	
}