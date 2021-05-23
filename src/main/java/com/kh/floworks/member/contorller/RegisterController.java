package com.kh.floworks.member.contorller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.member.model.service.MemberService;
import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/register")
@Slf4j
public class RegisterController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@ResponseBody
	@GetMapping("/id/duplicate")
	public String idDuplicateTest(String id) {	
		
		boolean isduplicate = memberService.selectIdDuplicate(id);
		
		return isduplicate ? "true" : "false";
	}
	
	@ResponseBody
	@GetMapping("/email/duplicate")
	public String emailDuplicateTest(String email) {	
		
		boolean isduplicate = memberService.selectEmailDuplicate(email);
		
		return isduplicate ? "true" : "false";
	}
	
	
	@ResponseBody
	@GetMapping("/phone/duplicate")
	public String phoneDuplicateTest(String phone) {	
		
		boolean isduplicate = memberService.selectPhoneDuplicate(phone);
		
		return isduplicate ? "true" : "false";
	}
	
	@ResponseBody
	@GetMapping("/workspace/exist")
	public String workSpaceIdExistTest(String workSpaceId) {
		
		boolean isExist = memberService.selectWorkSpaceIdExist(workSpaceId);
		
		return isExist ? "true" : "false";
	}
	
	@ResponseBody
	@PostMapping("/bcrypt/password")
	public String getBcryptPassword(String password) {

		String bcryptPwd = bcryptPasswordEncoder.encode(password);
		
		return bcryptPwd;
	}
	
	@PostMapping("/insert")
	public String registerUser(User user) {

		try {
			
			log.info("{}", user);
			
			memberService.insertUser(user);
			
			return "redirect:/register/registerWorkspace?id=" + user.getId() + "&workSpaceId=" + user.getWorkspaceId();
			
		} catch (NullPointerException e) {
			throw e;
		}
	}
	
	@RequestMapping("/registerWorkspace")
	public String registerWorkspace(String id, String workSpaceId,  Model model) {
		
		List<Map<String,String>> deptList = memberService.selectDeptNameList();
		List<String> positionList = memberService.selectPositionList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("workSpaceId", workSpaceId);
		model.addAttribute("id", id);
		
 		return "/member/registerWorkspace";
	}
	
	@PostMapping("/registerWorkspace/insert")
	public String registerWorkspaceInsert(	String password,
											String id,
											String workSpaceId,
											Member member,
											@RequestParam(required = false)MultipartFile profile, 
											HttpServletRequest request,
											RedirectAttributes redirectAttr) throws IOException {
		try {

		String workSpacePassword = memberService.selectWorkspacePassword(workSpaceId);

		if(!bcryptPasswordEncoder.matches(password, workSpacePassword)){
			
			redirectAttr.addFlashAttribute("msg", "워크스페이스 비밀번호가 일치하지 않습니다.");
			
			return "redirect:/register/registerWorkspace?id=" + id + "&workSpaceId=" + workSpaceId;
		}
		
		MultipartFile[] multipartFile = {profile};
		String saveDirectory = request.getServletContext().getRealPath("/resources/upload/profile");
		Map<String, String> fileMap = FileUtils.getFileMap(multipartFile, saveDirectory);
		
		member.setProfileFileOrinalname(fileMap.get("originalName1"));
		member.setProfileFileRename(fileMap.get("reNamed1"));
		member.setId(id);
		memberService.insertMember(member);
		redirectAttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		
 		return "redirect:/login";
 		
		} catch (IOException e) {
			throw e;
		}
	}

}