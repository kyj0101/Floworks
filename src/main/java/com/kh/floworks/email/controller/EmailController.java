package com.kh.floworks.email.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
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
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.floworks.alarm.controller.Collector;
import com.kh.floworks.common.Exception.NoMemberException;
import com.kh.floworks.common.utils.EmailUtils;
import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.common.utils.PageBarUtils;
import com.kh.floworks.email.model.service.EmailService;
import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/email")
@Slf4j
public class EmailController {

	private final int numPerPage = 15;
	
	@Autowired
	private Collector collector;
	
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	private EmailService emailService;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@GetMapping("/compose")
	public String emailCompose(@RequestParam(required = false) String defaultRecipient,
								Model model) {
		
		model.addAttribute("defaultRecipient", defaultRecipient);
		
		return "/email/emailCompose";
	}

	@RequestMapping("/sent")
	public String emailSentList(String id,
								@RequestParam(defaultValue = "1") int cPage,
								Model model,
								HttpServletRequest request) {
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		param.put("id", id);
		
		int totalContents = emailService.getTotalSentEmail(id);
		String url = request.getRequestURI() + "?id=" + id;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		List<Email> emailList = emailService.selectSentList(param);
		emailList = EmailUtils.shorteningLetters(emailList);
		
		model.addAttribute("emailList", emailList);
		model.addAttribute("listType", "sent");
		model.addAttribute("pageBar", pageBar);
	
		return "/email/emailList";
	}
		
	@RequestMapping("/inbox")
	public String emailIndoxList(String id,
								@RequestParam(defaultValue = "1") int cPage,
								Model model,
								HttpServletRequest request) {
		
		Map<String, Object> param = new HashMap<>();

		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		param.put("id", id);
		
		int totalContents = emailService.getTotalInboxEmail(id);
		String url = request.getRequestURI() + "?id=" + id;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		List<Email> emailList = emailService.selectInboxList(param);
		emailList = EmailUtils.shorteningLetters(emailList);
		
		model.addAttribute("emailList", emailList);
		model.addAttribute("listType", "inbox");
		model.addAttribute("pageBar", pageBar);

		return "/email/emailList";
	}

	@RequestMapping("/drafts")
	public String emailDraftList(String id,
								@RequestParam(defaultValue = "1") int cPage,
								Model model,
								HttpServletRequest request) {
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		param.put("id", id);
		
		int totalContents = emailService.getTotalDraftsEmail(id);
		String url = request.getRequestURI() + "?id=" + id;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		List<Email> emailList = emailService.selectDraftList(param);
		emailList = EmailUtils.shorteningLetters(emailList);
		
		model.addAttribute("emailList", emailList);
		model.addAttribute("listType", "drafts");
		model.addAttribute("pageBar", pageBar);

		return "/email/emailList";
	}

	/**
	 * 
	 * @param emailNo
	 * @param model
	 * @param listType : �씠硫붿씪 由ъ뒪�듃�쓽 �쑀�삎. 蹂대궦�씠硫붿씪|諛쏆��씠硫붿씪|�엫�떆���옣�씠硫붿씪
	 * @return
	 */
	@GetMapping("/detail")
	public String emailDetail(int emailNo, Model model, String listType, String id) {

		Email email = null;
		Map<String, Object> param = new HashMap<>();
		
		param.put("emailNo", emailNo);
		param.put("id", id);
		
		if(listType.equals("inbox")) {
		
			email = emailService.selectOneEmailInbox(param);

			model.addAttribute("fileRename", emailService.selectProfileRename(email.getId()));
	
		}else {
			email = emailService.selectOneEmailSent(emailNo);			
		}
		
		
		Map<String, String> fileMap = emailService.selectFile(email.getFileNo());
		log.info("email{}",email);
		model.addAttribute("email", email);
		model.addAttribute("listType", listType);
		model.addAttribute("fileMap", fileMap);
		model.addAttribute("id", id);

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

			emailService.updateDraft(email);
			
			return "redirect:/email/drafts?id=" + email.getId();

		} catch (Exception e) {
			throw e;
		}

	}

	@PostMapping("/draft/send")
	public String draftEmailSend(Email email, RedirectAttributes redirectAttr) throws MessagingException {

		try {

			emailService.deleteDraft(email.getEmailNo());
			
			return sendEmail(email, redirectAttr);

		} catch (MessagingException e) {
			throw e;
		}

	}

	@GetMapping("/getRecipientList")
	public ResponseEntity<List<String>> getRecipientList(String searchKeyword, String workspaceId, String id) {

		Map<String, String> param = new HashMap<>();

		param.put("searchKeyword", searchKeyword);
		param.put("workspaceId", workspaceId);
		param.put("id", id);

		List<String> recipientList = emailService.selectRecipientList(param);

		return ResponseEntity.ok()
							.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
							.body(recipientList);
	}

	@PostMapping("/saveFile")
	public ResponseEntity<Integer> saveFile(@RequestParam(value = "uploadFile") MultipartFile[] uploadFile)
			throws IOException {
		try {

			String saveDirectory = servletContext.getRealPath(EmailUtils.EMAIL_DIRECTORY);
			Map<String, String> fileMap = FileUtils.getFileMap(uploadFile, saveDirectory);

			emailService.insertFile(fileMap);

			String strNo = String.valueOf(fileMap.get("no"));
			int no = Integer.parseInt(strNo);

			return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(no);

		} catch (IOException e) {
			throw e;
		}
	}

	@PostMapping("/send")
	public String sendEmail(Email email, RedirectAttributes redirectAttr) throws MessagingException{

		try {

			if (email.getExternalRecipient() != null && !email.getExternalRecipient().equals("")) {

				String attachDirectory = servletContext.getRealPath(EmailUtils.EMAIL_DIRECTORY);
				String ckDirectory = servletContext.getRealPath("/resources/upload/editorEmailFile");


				Map<String, String> fileMap = emailService.selectFile(email.getFileNo());
				Map<String, File> attachFiles = FileUtils.getAttachFiles(fileMap, attachDirectory);
				Map<String, File> ckFiles = FileUtils.getAttachFiles(EmailUtils.getFileNames(email.getEmailContent()),ckDirectory);
				
				sendMail(email, ckFiles, attachFiles);
			}

			int result = emailService.insertEmail(email);

			log.info("email={}", email);
			log.info("InsertResult = {}", result);
			
			collector.Emailtoss(email);
			return "redirect:/email/sent?id=" + email.getId();

		} catch (IllegalStateException e) {
			throw e;

		} catch (MessagingException e) {
			throw e;

		} catch (NoMemberException e) {

			redirectAttr.addFlashAttribute("msg", "�닔�떊�옄[" + e.getMessage() + "]媛� 議댁옱�븯吏� �븡�뒿�땲�떎. �씠硫붿씪�쓣 �엫�떆蹂닿��빀�땲�떎.");

			saveDraft(email);

			return "redirect:/email/drafts?id=" + email.getId();
		}
	}

	@GetMapping("/download")
	public ResponseEntity<Resource> fileDownload(String fileReName, String fileOriName)
			throws UnsupportedEncodingException {

		try {

			String saveDirectory = servletContext.getRealPath(EmailUtils.EMAIL_DIRECTORY);
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

	@PostMapping("/draftSave")
	public String saveDraft(Email email) {

		try {

			emailService.insertDraftEmail(email);

			return "redirect:/email/drafts?id=" + email.getId();

		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 
	 * @param uploadFile        : �깉濡� �뾽濡쒕뱶 �맂 �뙆�씪
	 * @param uploadFileReName  : 湲곗〈�쓽 �뾽濡쒕뱶�맂 �뙆�씪 rename媛�
	 * @param uploadFileOriName : 湲곗〈�쓽 �뾽濡쒕뱶�맂 �뙆�씪 originalName媛�
	 * @param fileNo            : 湲곗〈�뿉 DB�뿉 ���옣�맂 �뙆�씪�꽆踰꾧컪. DB�뿉 ���옣�븯吏� �븡�븯�떎硫� 0�씠�떎.
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/draftFile/update")
	public ResponseEntity<Integer> draftFileUpdate(MultipartFile[] uploadFile, String[] uploadFileReName,
			String[] uploadFileOriName, int fileNo) throws Exception {

		try {

			String saveDirectory = servletContext.getRealPath(EmailUtils.EMAIL_DIRECTORY);

			// �뾽濡쒕뱶�맂 �뙆�씪 & 湲곗〈�뙆�씪�씠 �뾾�떎硫� �썝�옒�쓽 �뙆�씪�쓣 �궘�젣�븿.
			if (uploadFile.length == 0 && uploadFileReName == null) {

				emailService.deleteFile(fileNo);

				fileNo = 0;

			} else {

				// �뾽濡쒕뱶�맂 �뙆�씪�씠 �엳�떎硫� �깉 �뙆�씪�쓣 ���옣�븿.
				Map<String, String> fileMap = FileUtils.getFileMap(uploadFile, saveDirectory);

				// �깉濡� ���옣�맂 �뙆�씪�쓽 �씠由꾧컪�쓣 DB�뿉 ���옣�븿.
				if (fileNo == 0) {

					emailService.insertFile(fileMap);

					String strNo = String.valueOf(fileMap.get("no"));
					fileNo = Integer.parseInt(strNo);

				} else {

					// �뾽濡쒕뱶�맂 �뙆�씪 & 湲곗〈�뙆�씪�씠 �엳�떎硫� update�븿.
					int length = uploadFile.length + 1;

					for (int i = 0; i < uploadFileReName.length; i++) {

						fileMap.put(("originalName" + length), uploadFileOriName[i]);
						fileMap.put(("reNamed" + length), uploadFileReName[i]);

						length++;
					}

					Map<String, Object> param = new HashMap<String, Object>();

					param.put("fileNo", fileNo);
					param.put("fileMap", fileMap);

					int result = emailService.updateDraftFile(param);

					log.info("update result = {}", result);
				}
			}

			// �뙆�씪 �궘�젣
			List<Map<String, String>> renameFileMapList = emailService.selectFileList();
			List<String> renameList = new ArrayList<>();

			for (Map<String, String> map : renameFileMapList) {

				Set<String> keySet = map.keySet();

				for (String key : keySet) {
					renameList.add(map.get(key));
				}
			}

			FileUtils.cleaningFiles(renameList, saveDirectory);

			return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(fileNo);

		} catch (IOException e) {
			throw e;
		}
	}

	// 諛깆떊�봽濡쒓렇�옩�븣臾몄뿉 �삤瑜섎궇�닔�룄�엳�쓬.
	public void sendMail(Email email, Map<String, File> ckFiles, Map<String, File> attachFiles)
			throws MessagingException {

		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			String[] recipientArr = email.getExternalRecipient().split(", ");

			helper.setFrom(email.getId() + "[Floworks] <floworks@gmail.com>");
			helper.setTo(recipientArr);
			helper.setSubject(email.getSubject());

			if (attachFiles != null) {

				Set<String> attachKeySet = attachFiles.keySet();

				for (String key : attachKeySet) {
					helper.addAttachment(key, attachFiles.get(key));
				}
			}

			if (ckFiles != null) {

				Set<String> ckKeySet = ckFiles.keySet();
				List<String> cidList = new ArrayList<>();

				for (String key : ckKeySet) {
					cidList.add(key);
				}

				String content = StringEscapeUtils
						.unescapeJava(EmailUtils.addCidToTag(email.getEmailContent(), cidList).replace("\"", "'"));
				helper.setText(content, true);

				// setText�뿉 cid媛믪쓣 異붽��븳 �썑 addInline�쓣 �빐�빞�븳�떎.
				for (String key : ckKeySet) {
					helper.addInline(key, ckFiles.get(key));
				}

			} else {
				helper.setText(email.getEmailContent(), true);
			}

			mailSender.send(message);

		} catch (MessagingException e) {
			throw e;
		}
	}

	@ResponseBody
	@PostMapping("/updateStarred")
	public void updateStarredEmail(int emailNo, String type, String id, String value) {

		try {

			Map<String, Object> param = new HashMap<>();

			param.put("emailNo", emailNo);
			param.put("id", id);
			param.put("value", value);

			switch (type) {
			case "inbox":
				int i = emailService.updateStarredEmailInbox(param);
				log.info("result ={}", i);
				break;

			case "sent":
				emailService.updateStarredEmailSent(param);
				break;
			}

		} catch (Exception e) {
			throw e;
		}
	}

	@PostMapping("/delete")
	public String deleteMultipleEmails(Integer[] deleteCheck, String type, String id) {

		List<Integer> deleteCheckList = Arrays.asList(deleteCheck);

		try {

			Map<String, Object> param = new HashMap<>();

			param.put("deleteCheck", deleteCheckList);
			param.put("id", id);
			
			switch (type) {
			
			case "inbox":
				emailService.deleteEmailInbox(param);
				return"redirect:/email/inbox?id=" + id;

			case "sent":
				emailService.deleteEmailSent(param);
				return"redirect:/email/sent?id=" + id;

			case "drafts":
				emailService.deleteEmailDrafts(param);
				return"redirect:/email/drafts?id=" + id;
				
			default:
				throw new IllegalArgumentException();
			}

		} catch (Exception e) {
			throw e;
		}

	}
}
