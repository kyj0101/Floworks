package com.kh.floworks.member.contorller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
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

	@GetMapping("/mypage")
	public String memberUpdate(String id, Model model) {
		
		//스프링 시큐리티 태그를 사용하면 글자가 깨져서 직접 model에 member객체를 전달한다.
		Member member = memberService.selectOneMember(id);

		model.addAttribute("member", member);
		
		model.addAttribute("loginMember", authentication.getPrincipal());
		
	}

	@PostMapping("/update")
	public String memberUpdate(User updateUser, 
                               Member updateMember, 
                               Authentication oldAuthentication, 
                               RedirectAttributes redirectAttr,
                               HttpServletRequest request,
                               @RequestParam(value="profile", required = false) MultipartFile[] multipartFiles) {
		

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
			
			if(multipartFiles != null && multipartFiles[0].getOriginalFilename().length() > 0) {

				String saveDirectory = request.getServletContext().getRealPath(FileUtils.PROFILE_SAVEDIRECTORY);
				Map<String, String> fileMap = FileUtils.getFileMap(multipartFiles, saveDirectory);
				
				if(!updateMember.getProfileFileRename().equals("default.png")){
					FileUtils.deleteOneFile(saveDirectory, updateMember.getProfileFileRename());					
				}
				
				updateMember.setProfileFileRename(fileMap.get("reNamed1"));
				updateMember.setProfileFileOrinalname(fileMap.get("originalName1"));
				memberService.updateProfile(updateMember);
			}

			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
			memberService.updateMember(updateMember);		
			redirectAttr.addFlashAttribute("msg", "사용자 정보 수정 성공");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return "redirect:/member/mypage?id=" + updateMember.getId();
	}

	@GetMapping("/delete")
	public String memberDelete() {		
		return "/member/memberDelete";
	}
	
	@GetMapping("/update/password")
	public String updatePassword() {	
		return "/member/memberUpdatePassword";
	}
	
	@PostMapping("/update/password")
	public String updatePassword(String id,
			                     String password,
                                 @RequestParam(value="original-password") String originalPassword,
                                 RedirectAttributes redirectAttr) {	
		try {
			
			Member member = memberService.selectOneMember(id);
			
			if(bcryptPasswordEncoder.matches(originalPassword, member.getPassword())) {
				
				Map<String, Object> param = new HashMap<>();
				
				param.put("id", id);
				param.put("password", bcryptPasswordEncoder.encode(password));
				
				memberService.updatePassword(param);
				redirectAttr.addFlashAttribute("msg", "정상적으로 비밀번호가 변경되었습니다.");
			
			}else {
				redirectAttr.addFlashAttribute("msg", "비밀번호가 일치하지 않으므로 비밀번호를 변경할 수 없습니다.");
			}
			
			return "redirect:/member/update/password";
			
		} catch (Exception e) {
			throw new RuntimeException();
		}

	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US);
	
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
