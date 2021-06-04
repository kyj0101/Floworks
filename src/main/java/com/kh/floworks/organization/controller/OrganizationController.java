package com.kh.floworks.organization.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.organization.model.service.OrganizationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/organization")
@Slf4j
public class OrganizationController {

	@Autowired
	private OrganizationService organizationService;
	
	@GetMapping("/organizationChart")
	public void organiztionChart() {	
		
	}
}
