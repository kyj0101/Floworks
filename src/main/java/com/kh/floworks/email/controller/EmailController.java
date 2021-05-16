package com.kh.floworks.email.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.email.model.service.EmailService;
import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/email")
@Slf4j
public class EmailController {
	
	private final String directory = "/resources/upload/email";
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@RequestMapping("/list")
	public String emailList(){
		return "/email/emailList";
	}
	
	@GetMapping("/compose")
	public String emailCompose() {
		return "/email/emailCompose";
	}
	
	@GetMapping("/sent")
	public String emailSentList(@RequestParam String id, Model model) {
		
		List<Email> emailList = emailService.selectSentList(id);
		
		model.addAttribute("emailList", emailList);
		model.addAttribute("listType", "sent");
		
		return "/email/emailList";
	}
	
	/**
	 * 
	 * @param emailNo
	 * @param model
	 * @param listType : 이메일 리스트의 유형. 보낸이메일|받은이메일|임시저장이메일
	 * @return
	 */
	@GetMapping("/detail")
	public String emailDetail(int emailNo, Model model, String listType){
		
		Email email = emailService.selectOneEmail(emailNo);
		Map<String, String> fileMap = emailService.selectFile(email.getFileNo());
		
		model.addAttribute("email", email);
		model.addAttribute("listType", listType);
		model.addAttribute("fileMap", fileMap);
		
		log.info("fileMap={}", fileMap);
		
		return "/email/emailDetail";
	}
	
	@GetMapping("/getRecipientList")
	public ResponseEntity<List<String>> getRecipientList(String searchKeyword){
		
		List<String> recipientList = emailService.selectRecipientList(searchKeyword);
		
		return ResponseEntity.ok()
				             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				             .body(recipientList);
	}
	
	@PostMapping("/saveFile")
	public ResponseEntity<Integer> saveFile(@RequestParam(value="uploadFile")
							MultipartFile[] uploadFile) throws IOException {
		try {
			
			String saveDirectory = servletContext.getRealPath(directory); 
			Map<String, String> fileMap = FileUtils.getFileMap(uploadFile, saveDirectory);
			
			emailService.insertFile(fileMap);
			
			String strNo = String.valueOf(fileMap.get("no"));
			int no = Integer.parseInt(strNo);
			
	
			return ResponseEntity.ok()
					             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					             .body(no);
		} catch (IOException e) {
			throw e;
		}
	}
	
	@PostMapping("/send")
	public String sendEmail(Email email) throws IOException {
		try {
			if(email.getSubject().trim().equals("")) {
				email.setSubject("제목 없음");
			}
			int result = emailService.insertEmail(email);
			log.info("email={}",email);
			
			log.info("INsertResult = {}", result);
			
			return "redirect:/email/list";
			
		} catch (IllegalStateException e) {
			throw e;
		}
	}
	

	
	@GetMapping("/download")
	public ResponseEntity<Resource> fileDownload(String fileReName, String fileOriName) throws UnsupportedEncodingException{
		
		try {
			
			String saveDirectory = servletContext.getRealPath(directory);
			File downloadFile = new File(saveDirectory, fileReName);
			Resource resource = resourceLoader.getResource("file:" + downloadFile);
			
			String encodingOriName = "attachment;fileName=\"" 
			                       + URLEncoder.encode(fileOriName, "UTF-8")
			                       + "\"";
			
			return ResponseEntity.ok()
					             .contentType(MediaType.APPLICATION_OCTET_STREAM)
					             .header(HttpHeaders.CONTENT_DISPOSITION, encodingOriName)
					             .body(resource);
		
		} catch (UnsupportedEncodingException e) {
			throw e;
			
		} catch (NullPointerException | IllegalArgumentException e) {
			throw e;
		}
	}
	

	@RequestMapping("/ckupload")
	@ResponseBody
	public String imageUpload(HttpServletRequest request,
							HttpServletResponse response,
							MultipartHttpServletRequest multiFile,
                            @RequestParam MultipartFile upload) throws Exception{
		
		MultipartFile[] m = {upload};
		
		String saveDirectory = servletContext.getRealPath("/resources/upload/editorEmailFile");
        Map<String, String> fileMap = FileUtils.getFileMap(m, saveDirectory);
        String urlDirectory =  request.getContextPath() + "/resources/upload/editorEmailFile/" + fileMap.get("reNamed1");


        response.setContentType("text/html");
        JsonObject json = new JsonObject();
        
        json.addProperty("uploaded", 1);
        json.addProperty("fileName", fileMap.get("reNamed1"));
        json.addProperty("url", urlDirectory );

        log.info("{}",json);
        
        new Gson().toJson(json,response.getWriter());
        
        return null;
    }
}
