package com.kh.floworks.member.contorller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.common.utils.FileUtils;
import com.kh.floworks.member.model.service.MemberService;
import com.kh.floworks.member.model.vo.Member;
import com.kh.floworks.member.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
@SessionAttributes(value = {"loginMember", "anotherValue"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	@GetMapping("/mainPage")
	public String indexPage() {
		return "/member/mainPage";
	}
	
	@GetMapping(value={"/mypage","/mypage/update"})
	public String mypage() {		
		return "/member/memberUpdate";
	}

	@GetMapping("/memberDetail.do")
	public void memberDetail(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();	
		model.addAttribute("loginMember", authentication.getPrincipal());
		
	}

	@GetMapping("/memberUpdate.do")
	public void memberDetail(Authentication authentication, @AuthenticationPrincipal Member member, Model model) {
		//1.security context holder bean
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		//2. handler의 매개인자로 authentication객체 요청
		// UsernamePasswordAuthenticationToken
		log.debug("authentication = {}", authentication); 
		log.debug("member = {}", authentication.getPrincipal());
		
		//3. @AuthenticationPrincipal Member member
		log.debug("member = {}", member);
		
		model.addAttribute("loginMember", authentication.getPrincipal());
		
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US);
	
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	//이메일 변경시 이메일 재인증 기능은 아직 없음.
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(User updateUser, 
                               Member updateMember, 
                               Authentication oldAuthentication, 
                               RedirectAttributes redirectAttr,
                               HttpServletRequest request,
                               @RequestParam(value="profile", required = false) MultipartFile multipartFile) {
		

		try {
			
			//member를 커맨드 객체로 사용하면 상속 받은 멤버변수값을 가져오지 못하므로 직접 set으로 값대입함.
			updateMember.setName(updateUser.getName());
			updateMember.setId(updateUser.getId());
			updateMember.setEmail(updateUser.getEmail());
			updateMember.setPhone(updateUser.getPhone());
			updateMember.setAddress(updateUser.getAddress());
			updateMember.setWorkspaceId(updateUser.getWorkspaceId());
			updateMember.setPassword(((Member)oldAuthentication.getPrincipal()).getPassword());

			updateMember.setRole(
								oldAuthentication
								.getAuthorities()
								.stream()
								.map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
								.collect(Collectors.toList()).toString()
			);
			
			Authentication newAuthentication = 
					new UsernamePasswordAuthenticationToken(
															updateMember,
															oldAuthentication.getCredentials(),
															oldAuthentication.getAuthorities()
															);	
			
			if(multipartFile != null) {
				
				String saveDirectory = request.getServletContext().getRealPath(FileUtils.PROFILE_SAVEDIRECTORY);
				MultipartFile[] multipartFiles = {multipartFile};
				Map<String, String> fileMap = FileUtils.getFileMap(multipartFiles, saveDirectory);
				
				if(!updateMember.getProfileFileRename().equals("default.png")){
					FileUtils.deleteOneFile(saveDirectory, updateMember.getProfileFileRename());					
				}
				
				updateMember.setProfileFileRename(fileMap.get("reNamed1"));
				memberService.updateProfile(updateMember);
			}
			
			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
			memberService.updateMember(updateMember);		
			redirectAttr.addFlashAttribute("msg", "사용자 정보 수정 성공");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

		
		return "redirect:/member/memberUpdate.do";
	}
	
	
	@GetMapping("/delete")
	public String memberDelete() {		
		return "/member/memberDelete";
	}
	
	@GetMapping("/updatePwd")
	public String updatePassword() {	
		return "/member/updatePassword";
	}
	
}
