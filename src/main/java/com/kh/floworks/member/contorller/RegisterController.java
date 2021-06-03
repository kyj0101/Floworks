package com.kh.floworks.member.contorller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.floworks.security.service.SecurityService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/register")
@Slf4j
public class RegisterController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	/**
	 * 회원 가입만 하고 워크스페이스를 등록하지 않은 경우. 
	 * 
	 * 로그인후 워크스페이스를 생성 or 등록하도록 한다.
	 * 
	 */
	@GetMapping("/login")
	public String loginForRegister(String url, Model model) {
		
		String actionUrl = "/register/login";
		
		model.addAttribute("actionUrl", actionUrl);
		model.addAttribute("url", url);
		
		return "/login/login"; 
	}
	
	@PostMapping("/login")
	public String loginForRegister(String username, 
			                       String password, 
			                       String url, 
			                       RedirectAttributes redirectAttribute,
			                       Model model) {
		
		User user = securityService.selectOneUser(username);
		
		if(user == null) {
	
			redirectAttribute.addFlashAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
			
			return"redirect:/register/login";
		}
		
		if(user.getWorkspaceId() != null) {
			
			redirectAttribute.addFlashAttribute("msg", "이미 워크스페이스가 등록되었습니다.");
			
			return "redirect:/";
		}
		
		if(bcryptPasswordEncoder.matches(password, user.getPassword())) {	
			return "redirect:/register/workspace/" + url + "?id=" + user.getId();
		}
		
		
		return "redirect:/";
	}
	
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
	@GetMapping("/workspaceId/duplicate")
	public String workspaceIdDuplicateTest(String id) {	
		
		boolean isduplicate = memberService.selectworkspaceIdDuplicate(id);
		
		return isduplicate ? "true" : "false";
	}
	
	@PostMapping("/user")
	public String registerUser(User user , @RequestParam(required = false) boolean createWorkspace) {

		try {

			String bcryptPwd = bcryptPasswordEncoder.encode(user.getPassword());

			user.setPassword(bcryptPwd);
			memberService.insertUser(user);
			
			if(createWorkspace) {
				return "redirect:/register/createWorkspace?id=" + user.getId();
			}
			
			return "redirect:/register/workspace/member?id=" 
					+ user.getId() 
					+ "&workspaceId=" 
					+ user.getWorkspaceId();

		} catch (NullPointerException e) {
			throw e;
		}
	}
	
	@RequestMapping("/workspace/member")
	public String registerWorkspace(@RequestParam(required = false) String id, 
			                        @RequestParam(required = false) String workspaceId,
			                        Model model) {
		
		List<Map<String,String>> deptList = memberService.selectDeptNameList();
		List<String> positionList = memberService.selectPositionList();
		String owner = memberService.selectWorkspaceOwner(workspaceId);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("workspaceId", workspaceId);
		model.addAttribute("id", id);
		model.addAttribute("owner", owner);
		
 		return "/register/registerWorkspace";
	}
	
	@PostMapping("/workspace/member/insert")
	public String registerWorkspaceInsert(String password,
			                              String id,
			                              String workspaceId,
			                              Member member,
			                              @RequestParam(required = false)MultipartFile profile, 
			                              HttpServletRequest request,
			                              RedirectAttributes redirectAttr) throws IOException {
		try {
			
			String workSpacePassword = memberService.selectWorkspacePassword(workspaceId);

			if(!bcryptPasswordEncoder.matches(password, workSpacePassword)){
				
				redirectAttr.addFlashAttribute("msg", "워크스페이스 비밀번호가 일치하지 않습니다.");
				
				return "redirect:/register/registerWorkspace?id=" + id + "&workspaceId=" + workspaceId;
			}
			
			//직급별 기본 연차 가져오기
			Map<String, String> param = new HashMap<>();
			param.put("userId",id);
			param.put("workspaceId", workspaceId);
			param.put("position", member.getPosition());
			
			int leaveDay = memberService.selectLeaveDay(param);
	
			//프로필사진 처리 
			MultipartFile[] multipartFile = {profile};
			String saveDirectory = request.getServletContext().getRealPath(FileUtils.PROFILE_SAVEDIRECTORY);
			Map<String, String> fileMap = FileUtils.getFileMap(multipartFile, saveDirectory);
						
			member.setProfileFileOrinalname(fileMap.get("originalName1"));
			member.setProfileFileRename(fileMap.get("reNamed1"));
			member.setId(id);
			member.setLeave(leaveDay);
			
			//member에 추가
			memberService.insertMember(member);
			
			//워크스페이스에 등록
			memberService.updateUserWorkspaceId(param);
			redirectAttr.addFlashAttribute("msg", "워크스페이스 등록이 완료되었습니다. 다시 로그인 해주세요.");
		
			return "redirect:/login";
 		
		} catch (Exception e) {

			throw e;
		}
	}
	
	@PostMapping("/workspace/create/insert")
	public String createWorkspaceInsert(String userId, 
                                        String workspaceName,
                                        @RequestParam(name = "id") String workspaceId,
                                        String password,
                                        RedirectAttributes redirectAttr) {
		try {
			
			//직급별 기본 연차 설정
			List<String> positionList = memberService.selectPositionList();
			Map<String, String> param = new HashMap<>();

			param.put("userId", userId);
			param.put("workspaceName", workspaceName);
			param.put("workspaceId", workspaceId);
			param.put("password", bcryptPasswordEncoder.encode(password));
			
			for(String position : positionList) {
				
				param.put("position", position);
				memberService.insertDefaultLeaveSystem(param);
			}
			
			memberService.insertWorkspace(param);
			memberService.updateUserWorkspaceId(param);
			memberService.insertDefaultAttendanceSystem(workspaceId);
			memberService.updateWorkspaceOwnerAdmin(param);
			
			redirectAttr.addFlashAttribute("msg", "워크스페이스 생성이 완료되었습니다.");
			
			return "redirect:/register/workspace/member?id=" 
					+ userId 
					+ "&workspaceId=" 
					+ workspaceId;
			
		} catch (NullPointerException e) {

			throw e;
		}
	}
	
	@RequestMapping("/workspace/create")
	public String createWorkspace(String id, Model model) {
		
		model.addAttribute("id", id);
		
 		return "/register/createWorkspace";
	}
}


