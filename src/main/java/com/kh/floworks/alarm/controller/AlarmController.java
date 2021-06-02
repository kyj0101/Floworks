package com.kh.floworks.alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.alarm.model.service.AlarmService;
import com.kh.floworks.alarm.model.vo.Alarm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
}
