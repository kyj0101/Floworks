package com.kh.floworks.approval.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.approval.model.service.ApprovalService;
import com.kh.floworks.approval.model.vo.Approval;
import com.kh.floworks.approval.model.vo.Approver;
import com.kh.floworks.approval.model.vo.ApvlDoc;
import com.kh.floworks.approval.model.vo.ApvlFile;
import com.kh.floworks.approval.model.vo.ApvlHistory;
import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.common.utils.PageBarUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * @author Kim Jakyeong
 */
@Controller
@Slf4j
@RequestMapping("/approval")
public class ApprovalController {
	
	private int numPerPage = 4;
	
	@Autowired
	private ApprovalService apvlService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/apvlWrite")
	public void apvlWrite(@RequestParam String workspaceId, Model model) {
		log.info("apvlWrite_workspaceId = {}", workspaceId);
		List<Approver> apverList = apvlService.selectApproverList(workspaceId);
		log.info("apvlWrite_apverList = {}", apverList);
		model.addAttribute("apverList", apverList);
	}
	
	
	@PostMapping("/apvlWrite/enroll")
	public String apvlEnroll(@ModelAttribute ApvlDoc apvlDoc,
					  @RequestParam(value="upFile", required = false) MultipartFile[] upFiles,
					  @RequestParam String category,
					  @RequestParam int year,
					  HttpServletRequest request,
					  RedirectAttributes redirectAttr) {
		log.info("apvlEnroll - {}", apvlDoc);
		log.info("upFiles - {}", upFiles);
		log.info("year = {}", year);
		
		// 1. 입력
		// a. 문서ID
		String apvlId = apvlDoc.getWriter() + "_" + System.currentTimeMillis();
		log.info("apvlId = {}", apvlId);
		apvlDoc.setApvlId(apvlId);
		
		// b. 카테고리
		log.info("Category={}", category);
		apvlDoc.setCategory(category);
		
		// c. 보존연한
		Date dueDate = apvlService.selectDueDate(year);
		log.info("dueDate={}", dueDate);
		apvlDoc.setDueDate(dueDate);
		
		// d. 파일 저장 및 Attachment객체 생성
		try {
			// 저장경로
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/approval");
			
			File dir = new File(saveDirectory);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			// 복수개의 Attachment객체를 담을 list생성
			List<ApvlFile> afList = new ArrayList<>();
			
			for(MultipartFile upFile : upFiles) {	
				if(upFile.isEmpty() || upFile.getSize() == 0)
					continue;
				log.info("upFile = {}", upFile);
				log.info("upFile.name = {}", upFile.getOriginalFilename());
				log.info("upFile.size = {}", upFile.getSize());
				// 저장할 파일명 생성
				File renamedFile = FileUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());
				// 파일 저장
				upFile.transferTo(renamedFile);
			
				// Attachment객체생성
				ApvlFile attach = new ApvlFile();
				attach.setOriginalFileName(upFile.getOriginalFilename());
				attach.setRenamedFileName(renamedFile.getName());
				afList.add(attach);
			}
			
			apvlDoc.setAfList(afList);
			int result = apvlService.insertApproval(apvlDoc);
			
			String msg = result > 0 ? "결재문서 기안 완료" : "결재문서 기안 실패";
			redirectAttr.addFlashAttribute("msg", msg);
			
		} catch (IllegalStateException | IOException e) {
			log.error("첨부파일 오류", e);
		} catch (Exception e) {
			log.error("결재문서 기안 오류", e);
			throw e;
		}
		
		
		return "redirect:/approval/apvlProgress?workspaceId=" + apvlDoc.getWorkspaceId();
	}
	
	
	@GetMapping("/apvlProgress")
	public void apvlProgress(
				@RequestParam String workspaceId,
				@RequestParam(defaultValue = "1") int cPage,
				Model model,
				HttpServletRequest request) {
		// 1. 사용자 입력값
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		log.info("workspaceId : {}", workspaceId);
		
		// 2. 업무로직
		// a. Content영역
		// (1) 결재 문서 목록
		List<Approval> list = apvlService.selectApvlList(param, workspaceId);
		log.info("list = {}", list);
		
		// (2) 결재 문서 별 결재선 리스트 Map<String, List<Approver>>
		Iterator<Approval> iterator = list.iterator();
		Map<String, Object> apverMap = new HashMap<String, Object>();
		
		while (iterator.hasNext()) {
			Approval approval = (Approval) iterator.next();
			List<Approver> apverList = new ArrayList<Approver>();
			
			if (approval.getApprover1() != null) {
				apverList.add(apvlService.selectApprover(approval.getApprover1()));
				
				if (approval.getApprover2() != null) {
					apverList.add(apvlService.selectApprover(approval.getApprover2()));
					
					if (approval.getApprover3() != null) {
						apverList.add(apvlService.selectApprover(approval.getApprover3()));
						
						if (approval.getApprover4() != null) {
							apverList.add(apvlService.selectApprover(approval.getApprover4()));
						}
					}
				}
			}
			
			apverMap.put(approval.getApvlId(), apverList);
		}
		log.info("apverMap = {}", apverMap);
		
		// b. pagebar 영역
		int totalContents = apvlService.getTotalContents(workspaceId);
		String url = request.getRequestURI() + "?workspaceId=" + workspaceId;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		// 3. jsp 처리 위임
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("apverMap", apverMap);
	}
	
	
	@GetMapping("/apvlProgressDetail")
	public void apvlProgressDetail(@RequestParam String apvlId, Model model) {
		// 파라미터 체크
		log.info("apvlProgressDetail_apvlId = {}", apvlId);
		
		// 결재문서 정보 조회
		Approval approval = apvlService.selectOneApprovalCollection(apvlId);
		log.info("apvlProgressDetail_approval = {}", approval);
		
		// 결재선 조회 Approver List
		List<Approver> apverList = new ArrayList<Approver>();
		
		if (approval.getApprover1() != null) {
			apverList.add(apvlService.selectApprover(approval.getApprover1()));
			
			if (approval.getApprover2() != null) {
				apverList.add(apvlService.selectApprover(approval.getApprover2()));
				
				if (approval.getApprover3() != null) {
					apverList.add(apvlService.selectApprover(approval.getApprover3()));
					
					if (approval.getApprover4() != null) {
						apverList.add(apvlService.selectApprover(approval.getApprover4()));
					}
				}
			}
		}
		
		model.addAttribute("approval", approval);
		model.addAttribute("apverList", apverList);
		
	}
	
	
	//fileDownload
   @GetMapping(
         value = "/fileDownload", 
         produces = "application/octet-stream;charset=utf-8"
      )
   @ResponseBody
   public Resource fileDownload(@RequestParam int idx, HttpServletResponse response) 
         throws UnsupportedEncodingException {
      
      ApvlFile attach = apvlService.selectOneAttachment(idx);
      log.info("attach = {}", attach);
   
      String originalFileName = attach.getOriginalFileName();
      String renamedFileName = attach.getRenamedFileName();
      
      String saveDirectory = servletContext.getRealPath("/resources/upload/approval");
      File downFile = new File(saveDirectory, renamedFileName);
      String location = "file:" + downFile;
      log.info("location = {}", location);
      Resource resource = new FileSystemResource(downFile);
      
      originalFileName = new String(originalFileName.getBytes("utf-8"), "iso-8859-1");
      response.setContentType("application/octet-stream;charset=utf-8");
      response.addHeader("Content-Disposition", "attachment;filename=\"" + originalFileName + "\"");
      
      return resource;
   }
   
   // TODO 여기가 값이 안넘어오는 곳입니다.
   @RequestMapping("/apvlProgressDetail/process")
   public String apvlProcess(
		   				@ModelAttribute ApvlHistory apvlHistory,
		   				@RequestParam(value = "apvlId", required = false) String apvlId,
		   				@RequestParam(value = "approver", required = false) String approver,
		   				@RequestParam(value = "status", required = false)String status,
		   				RedirectAttributes redirectAttr,
					    HttpServletRequest request) {
	   // @ModelAttribute ApvlHistory apvlHistory,
	   log.info("apvlProcess_apvlId=", apvlId);
	   log.info("apvlProcess_approver=", approver);
	   log.info("apvlProcess_status=", status);

	   return "redirect:/approval/apvlProgressDetail?apvlId=" + apvlId;
   }
   
	
	@GetMapping("/checkProgress")
	@ResponseBody
	public List<Approver> checkProgress(@RequestParam String apvlId, Model model) {
		log.info("apvlId = {}", apvlId);
		List<Approver> avrList = new ArrayList<Approver>();
		Approval apvl = apvlService.selectOneApproval(apvlId);
		log.info("Selected Approval = {}", apvl);
		
		if (apvl.getApprover1() != null) {
			avrList.add(apvlService.selectApprover(apvl.getApprover1()));
			
			if (apvl.getApprover2() != null) {
				avrList.add(apvlService.selectApprover(apvl.getApprover2()));
				
				if (apvl.getApprover3() != null) {
					avrList.add(apvlService.selectApprover(apvl.getApprover3()));
					
					if (apvl.getApprover4() != null) {
						avrList.add(apvlService.selectApprover(apvl.getApprover4()));
					}
				}
			}
		}
		
		return avrList;
	}
	
}
