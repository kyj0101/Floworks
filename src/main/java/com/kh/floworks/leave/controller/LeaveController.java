package com.kh.floworks.leave.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
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

import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.common.utils.PageBarUtils;
import com.kh.floworks.leave.model.service.LeaveService;
import com.kh.floworks.leave.model.vo.Leave;
import com.kh.floworks.leave.model.vo.LeaveFile;
import com.kh.floworks.leave.model.vo.LeaveRequest;
import com.kh.floworks.member.model.service.MemberService;
import com.kh.floworks.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/leave")
public class LeaveController {
	
	private int numPerPage = 4;
	
	@Autowired
	private LeaveService leaveService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ServletContext servletContext;
	
	
	@GetMapping("/request")
	public String request(@RequestParam String id, Model model) {
		
		Member member = memberService.selectOneMember(id);
		
		// leaveCnt : 잔여 연차 수
		int leaveCnt = member.getLeave();
		String applicantName = member.getName();
		
		model.addAttribute("leaveCnt", leaveCnt);
		model.addAttribute("applicantName", applicantName);
		return "/leave/leaveRequest";
	}
	
	
	@PostMapping("/request/submit")
	public String leaveSubmit(@ModelAttribute LeaveRequest lvReq,
							@RequestParam(required = false) MultipartFile lvFile,
							HttpServletRequest request,
							RedirectAttributes redirectAttr) {
		log.info("leaveSubmit_LeaveRequest = {}", lvReq);
		log.info("leaveSubmit_workspaceId = {}", lvReq.getWorkspaceId());
		log.info("leaveSubmit_lvfileOriginalFileName = {}", lvFile.getOriginalFilename());
		
		// 1. leaveId 값 set
		String lvId = lvReq.getApplicant() + "_" + System.currentTimeMillis();
		lvReq.setLeaveId(lvId);
		
		// 2. 카테고리 값 set
		int categoryNum = Integer.parseInt(lvReq.getCategory());
		String ctg = "";
		
		if ((lvReq.getCategory() != null) && (categoryNum >= 1 && categoryNum <= 7)) {
			switch (categoryNum) {
			case 1:
				ctg = "연차";
				break;
			case 2:
				ctg = "훈련";
				break;
			case 3:
				ctg = "교육";
				break;
			case 4:
				ctg = "경조사";
				break;
			case 5:
				ctg = "병가";
				break;
			case 6:
				ctg = "출산";
				break;
			case 7:
				ctg = "무급";
				break;
			default:
				break;
			}
		} else {
			log.error("Invalid Value for leaveSubmit_LeaveRequest_Category");
		}
		
		lvReq.setCategory(ctg);
		
		// 3. applicantName 처리
		Member member = memberService.selectOneMember(lvReq.getApplicant());
		lvReq.setApplicantName(member.getName());
		
		// 4. File 처리
		try {
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/leave");
			
			File dir = new File(saveDirectory);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			
			// 첨부파일이 존재하는 경우
			if (!lvFile.isEmpty() && lvFile.getSize() != 0) {
				log.info("LeaveRequest_lvFile = {}", lvFile);
				log.info("LeaveRequest_lvFile.name = {}", lvFile.getOriginalFilename());
				log.info("LeaveRequest_lvFile.size = {}", lvFile.getSize());
				
				// 저장할 파일명 생성
				File renamedFile = FileUtils.getRenamedFile(saveDirectory, lvFile.getOriginalFilename());
				
				// 파일 저장
				lvFile.transferTo(renamedFile);
				
				LeaveFile attach = new LeaveFile();
				attach.setOriginalFileName(lvFile.getOriginalFilename());
				attach.setRenamedFileName(renamedFile.getName());
				lvReq.setAttach(attach);
			}
			
			int result = leaveService.insertLeaveReq(lvReq);
			String msg = result > 0 ? "휴가신청 완료" : "휴가신청 실패";
			redirectAttr.addFlashAttribute("msg", msg);
			log.info("leaveRequest = {}", msg);
			
		} catch (IllegalStateException | IOException e) {
			log.error("첨부파일 오류", e);
		} catch (Exception e) {
			log.error("휴가신청 오류", e);
			throw e;
		}
		
		
		return "redirect:/leave/list?workspaceId=" + lvReq.getWorkspaceId();
		
	}
	
	@GetMapping("/list")
	public String list(@RequestParam String workspaceId,
					@RequestParam(defaultValue = "1") int cPage,
					Model model,
					HttpServletRequest request) {
		// 1. 사용자 입력값
		Map<String, Object> param = new HashMap<>();
		param.put("numPerPage", numPerPage);
		param.put("cPage", cPage);
		log.info("list-workspaceID = {}", workspaceId);
		
		List<LeaveRequest> lvList = leaveService.selectLeaveList(param, workspaceId);
		log.info("lvList = {}", lvList);
		
		int totalContents = lvList.size();
		String url = request.getRequestURI() + "?workspaceId=" + workspaceId;
		String pageBar = PageBarUtils.getPageBar(totalContents, cPage, numPerPage, url);
		
		Map<String, Object> lvAttach = new HashMap<>();
		Iterator<LeaveRequest> iterator = lvList.iterator();
		
		while (iterator.hasNext()) {
			LeaveRequest leaveRequest = (LeaveRequest) iterator.next();
			if (leaveRequest.getAttach() != null) {
				lvAttach.put(leaveRequest.getLeaveId(),leaveRequest.getAttach());
			}
		}
		
		model.addAttribute("lvList", lvList);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("lvAttach", lvAttach);
		
		return "/leave/leaveList";
	}
	
	@PostMapping("/list/approve")
	public String leaveApprove(@RequestParam String leaveId,
								@RequestParam String lvDuration,
								@RequestParam String lvDates,
								@RequestParam String applicant,
								@RequestParam String workspaceId,
								@RequestParam String approver,
								HttpServletRequest request,
								RedirectAttributes redirectAttr) {
		log.info("leaveapprove_leaveId = {}", leaveId);
		log.info("leaveapprove_lvDuration = {}", lvDuration);
		log.info("leaveapprove_lvDates = {}", lvDates);
		log.info("leaveapprove_applicant = {}", applicant);
		log.info("leaveapprove_workspaceId = {}", workspaceId);
		log.info("leaveapprove_approver = {}", approver);
		
		// 1. lvDates --> 신청한 연차 갯수 카운트
		double duration = 0;
		if (lvDuration.equals("M") || lvDuration.equals("A")) {
			duration = 0.5; // 반차 
		} else if (lvDuration.equals("E")) {
			duration = 1.0; // 연차
		}
		log.info("duration = {}", duration);
		
		StringTokenizer st = new StringTokenizer(lvDates, ","); // 2021-06-01,2021-06-02
	    int requestedDates = st.countTokens();
	    log.info("requestedDates = {}", requestedDates);
	    
	    
	    // 2. leave_request apvl_yn 업데이트
	    int result = leaveService.updateApprove(leaveId);
	    
	    
	    // 3. member 객체 연차 갯수 차감
	    Member member = memberService.selectOneMember(applicant.trim());
	    
	    double dayoffCnt = member.getLeave() - (duration * requestedDates); 
	    log.info("dayoffCnt = {}", dayoffCnt);
	    Leave lv = new Leave();
	    lv.setId(member.getId());
	    lv.setDayoffCnt(dayoffCnt);
	    
	    if (result > 0 && dayoffCnt > 0) {
			result = leaveService.updateMemberLeave(lv);
		} else {
			log.info("LEAVE_REQUEST 업데이트 실패 : approve");
		}
	    
	    String msg = result > 0 ? "휴가 승인 처리 성공" : "휴가 승인 처리 실패";
	    log.info("leaveApprove = {}", msg);
	    redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/leave/list?workspaceId=" + workspaceId;
	}
	
	@PostMapping("/list/reject")
	public String leaveReject(@RequestParam String leaveId,
			@RequestParam String workspaceId,
			HttpServletRequest request,
			RedirectAttributes redirectAttr) {
		
		// leave_request apvl_yn 업데이트
		int result = leaveService.updateReject(leaveId);
		
		String msg = result > 0 ? "휴가 반려 처리 성공" : "휴가 반려 처리 실패";
		log.info("leaveReject = {}", msg);
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/leave/list?workspaceId=" + workspaceId;
	}
	
	@PostMapping("/list/delete")
	public String leaveDelete(@RequestParam String leaveId,
			@RequestParam String workspaceId,
			HttpServletRequest request,
			RedirectAttributes redirectAttr) {
		log.info("leaveDelete_leaveId = {}", leaveId);
		log.info("leaveDelete_workspaceId = {}", workspaceId);
		int result = leaveService.deleteLeave(leaveId);
		
		String msg = result > 0 ? "휴가 삭제 처리 성공" : "휴가 삭제 처리 실패";
		log.info("leaveDelete = {}", msg);
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/leave/list?workspaceId=" + workspaceId;
	}
	
	@GetMapping(value = "/fileDownload", produces = "application/octet-stream;charset=utf-8")
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response)
			throws UnsupportedEncodingException {

		LeaveFile attach = leaveService.selectOneAttachment(no);
		log.info("attach = {}", attach);

		String originalFileName = attach.getOriginalFileName();
		String renamedFileName = attach.getRenamedFileName();

		String saveDirectory = servletContext.getRealPath("/resources/upload/leave");
		File downFile = new File(saveDirectory, renamedFileName);
		String location = "file:" + downFile;
		log.info("location = {}", location);
		Resource resource = new FileSystemResource(downFile);

		originalFileName = new String(originalFileName.getBytes("utf-8"), "iso-8859-1");
		response.setContentType("application/octet-stream;charset=utf-8");
		response.addHeader("Content-Disposition", "attachment;filename=\"" + originalFileName + "\"");

		return resource;
	}
}
