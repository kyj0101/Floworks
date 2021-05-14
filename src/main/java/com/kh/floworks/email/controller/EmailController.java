package com.kh.floworks.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.email.model.service.EmailService;
import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/email")
@Slf4j
public class EmailController {
	
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/list")
	public String emailList(){
		return "/email/emailList";
	}
	
	@GetMapping("/compose")
	public String emailCompose() {
		return "/email/emailCompose";
	}
	
	@GetMapping("/getRecipientList")
	public ResponseEntity<List<String>> getRecipientList(String searchKeyword){
		
		List<String> recipientList = emailService.selectRecipientList(searchKeyword);
		
		return ResponseEntity.ok()
				             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				             .body(recipientList);
	}
	
	@PostMapping("/send")
	public String sendEmail(@RequestParam(value="uploadFile", required = false)
							MultipartFile[] uploadFile,
							Email email,
							HttpServletRequest request) {
		try {
			
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/email");
			Map<String, String> fileMap = new HashMap<>();
			File dir = new File(saveDirectory);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			for(int i = 0; i < uploadFile.length; i++) {
				
				MultipartFile upFile = uploadFile[i];
				
				if(upFile.isEmpty()) {
					continue;
				}
				
				File renameFile = FileUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());
				
				upFile.transferTo(renameFile);
				
				fileMap.put("originalName" + (i + 1), upFile.getOriginalFilename());
				fileMap.put("reNamed" + (i + 1), renameFile.getName());
				
				log.info("fileMap = {}", fileMap);;
			}
			try {
				int fileSaveResult = emailService.insertEmail(fileMap, email);
				log.info("fileINsertResult = {}", fileSaveResult);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			 
		} catch (IllegalStateException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		
		

			
		

		log.info("email = {}", email);
		
		return "redirect:/email/list";
	}
	
	
	
}
