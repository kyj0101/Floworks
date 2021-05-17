package com.kh.floworks.email.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String emailList() {
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

	@GetMapping("/inbox")
	public String emailIndoxList(@RequestParam String id, Model model) {

		List<Email> emailList = emailService.selectInboxList(id);

		model.addAttribute("emailList", emailList);
		model.addAttribute("listType", "indox");

		return "/email/emailList";
	}

	@GetMapping("/drafts")
	public String emailDraftList(@RequestParam String id, Model model) {

		List<Email> emailList = emailService.selectDraftList(id);

		model.addAttribute("emailList", emailList);
		model.addAttribute("listType", "drafts");

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
	public String emailDetail(int emailNo, Model model, String listType) {

		Email email = emailService.selectOneEmail(emailNo);
		Map<String, String> fileMap = emailService.selectFile(email.getFileNo());

		model.addAttribute("email", email);
		model.addAttribute("listType", listType);
		model.addAttribute("fileMap", fileMap);

		log.info("fileMap={}", fileMap);

		return "/email/emailDetail";
	}

	@RequestMapping("/draftDetail")
	public String draftEmailDetail(int emailNo, Model model) {

		Email email = emailService.selectOneDraftEmail(emailNo);
		Map<String, String> fileMap = emailService.selectFile(email.getFileNo());

		email.setEmailContent(StringEscapeUtils.escapeJavaScript(email.getEmailContent()));
		model.addAttribute("email", email);
		model.addAttribute("fileMap", fileMap);

		return "/email/emailDraft";
	}

	@PostMapping("/draftUpdate")
	public String draftEmailUpdate(Email email) {

		try {
			log.info("email={}", email);
			int result = emailService.updateDraft(email);
			log.info("result={}", result);

			return "redirect:/email/drafts?id=" + email.getId();

		} catch (Exception e) {
			throw e;
		}

	}
	
	@PostMapping("/draft/send")
	public String draftEmailSend(Email email) throws IOException {

		try {
			log.info("{}",email);
			emailService.deleteDraft(email.getEmailNo());
			return sendEmail(email);

		} catch (IOException e) {
			throw e;
		}

	}

	@GetMapping("/getRecipientList")
	public ResponseEntity<List<String>> getRecipientList(String searchKeyword, String workspaceId) {

		Map<String, String> param = new HashMap<>();

		param.put("searchKeyword", searchKeyword);
		param.put("workspaceId", workspaceId);

		List<String> recipientList = emailService.selectRecipientList(param);

		return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(recipientList);
	}

	@PostMapping("/saveFile")
	public ResponseEntity<Integer> saveFile(@RequestParam(value = "uploadFile") MultipartFile[] uploadFile)
			throws IOException {
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

			if (email.getSubject().trim().equals("")) {
				email.setSubject("제목 없음");
			}

			int result = emailService.insertEmail(email);

			log.info("email={}", email);
			log.info("InsertResult = {}", result);

			return "redirect:/email/list";

		} catch (IllegalStateException e) {
			throw e;
		}
	}

	@GetMapping("/download")
	public ResponseEntity<Resource> fileDownload(String fileReName, String fileOriName)
			throws UnsupportedEncodingException {

		try {

			String saveDirectory = servletContext.getRealPath(directory);
			File downloadFile = new File(saveDirectory, fileReName);
			Resource resource = resourceLoader.getResource("file:" + downloadFile);

			String encodingOriName = "attachment;fileName=\"" + URLEncoder.encode(fileOriName, "UTF-8") + "\"";

			return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
					.header(HttpHeaders.CONTENT_DISPOSITION, encodingOriName).body(resource);

		} catch (UnsupportedEncodingException e) {
			throw e;

		} catch (NullPointerException | IllegalArgumentException e) {
			throw e;
		}
	}

	@RequestMapping("/ckupload")
	@ResponseBody
	public String imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		MultipartFile[] m = { upload };

		String saveDirectory = servletContext.getRealPath("/resources/upload/editorEmailFile");
		Map<String, String> fileMap = FileUtils.getFileMap(m, saveDirectory);
		String urlDirectory = request.getContextPath() + "/resources/upload/editorEmailFile/" + fileMap.get("reNamed1");
		JsonObject json = new JsonObject();

		response.setContentType("text/html");

		json.addProperty("uploaded", 1);
		json.addProperty("fileName", fileMap.get("reNamed1"));
		json.addProperty("url", urlDirectory);

		log.info("{}", json);

		new Gson().toJson(json, response.getWriter());

		return null;
	}

	@PostMapping("/save")
	public String saveEmail(Email email) {

		try {

			int result = emailService.insertDraftEmail(email);

			return "redirect:/email/drafts?id=" + email.getId();

		} catch (Exception e) {
			throw e;
		}
	}

	@PostMapping("/draftFile/update")
	public ResponseEntity<Integer> draftFileUpdate(MultipartFile[] uploadFile, String[] uploadFileReName,
			String[] uploadFileOriName, int fileNo) throws Exception {

		try {
			String saveDirectory = servletContext.getRealPath(directory);
			
			if (uploadFile.length == 0 && uploadFileReName == null) {

				emailService.deleteFile(fileNo);

				fileNo = 0;

			} else {

				Map<String, String> fileMap = FileUtils.getFileMap(uploadFile, saveDirectory);

				if (fileNo == 0) {

					emailService.insertFile(fileMap);

					String strNo = String.valueOf(fileMap.get("no"));
					fileNo = Integer.parseInt(strNo);

				} else {

					int length = uploadFile.length + 1;

					for (int i = 0; i < uploadFileReName.length; i++) {

						fileMap.put(("originalName" + length), uploadFileOriName[i]);
						fileMap.put(("reNamed" + length), uploadFileReName[i]);

						length++;
					}
				}

				Map<String, Object> param = new HashMap<String, Object>();

				param.put("fileNo", fileNo);
				param.put("fileMap", fileMap);

				int result = emailService.updateDraftFile(param);
				
				log.info("update result = {}", result);
			}
			
			List<Map<String, String>> renameFileMapList = emailService.selectFileList();
			List<String> renameList = new ArrayList<>();

			for (Map<String, String> map : renameFileMapList) {

				Set<String> keySet = map.keySet();

				for (String key : keySet) {
					renameList.add(map.get(key));
				}
			}

			FileUtils.cleaningFiles(renameList, saveDirectory);

			return ResponseEntity.ok()
					             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					             .body(fileNo);

		} catch (Exception e) {
			throw e;
		}

	}
}
