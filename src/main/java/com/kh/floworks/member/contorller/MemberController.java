package com.kh.floworks.member.contorller;

import java.util.stream.Collectors;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.member.model.service.MemberService;
import com.kh.floworks.member.model.vo.User;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.authentication.email.model.vo.EmailAuthentication;
import com.kh.floworks.member.model.service.MemberService;

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
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@GetMapping("/mainPage")
	public String indexPage() {
		return "/member/mainPage";
	}
	
	@GetMapping(value={"/mypage","/mypage/update"})
	public String mypage() {		
		return "/member/memberUpdate";
	}

//	@PostMapping("member/memberUpdate")
//	public String memberUpdate(@ModelAttribute("member") User user,
//			 ModelMap model, 
//			   @ModelAttribute("loginMember") User loginMember,
//			   RedirectAttributes redirectAttributes) {
//		try {
//			log.debug("member = {} ", user);
//				
//			//1.비지니스로직 실행
//			int result = memberService.updateMember(user);
//			
//			//2.처리결과에 따라 view단 분기처리
//			String msg = "회원정보수정성공!";
//			if(result > 0){
//				//회원정보 수정 성공시 session객체 갱신
//				User updateMember = memberService.selectOneUser(user.getId());
//				model.addAttribute("loginMember", updateMember);
//			}
//			redirectAttributes.addFlashAttribute("msg", msg);
////			redirectAttributes.addAttribute("msg", msg); // /spring?msg=수정성공
//			
//		}catch(Exception e) {
//			log.error("회원 정보 수정 실패", e);
//			throw e;
//		}
//		return "redirect:/";
//		
//	}
//	
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(User updateMember, Authentication oldAuthentication, RedirectAttributes redirectAttr) {
		//1.업무로직 : db반영
		
		log.info("updateMember = {}", updateMember);
		
		//2. 인증객체(Principal) 준비, 비밀번호(password), 권한목록(authorities) 필드는 null이어서는 안된다.
		updateMember.setPassword(((User)oldAuthentication.getPrincipal()).getPassword());

		//Collection<? extends GrantedAuthority>로 저장된 권한 collection을 List<SimpleGrantedAuthority>로 변환
			updateMember.setAuthorities(
					oldAuthentication
						.getAuthorities()
						.stream()
						.map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
						.collect(Collectors.toList())
			);
		
		
		
		//2. security context 에서 principal 갱신
		Authentication newAuthentication = 
				new UsernamePasswordAuthenticationToken(
							updateMember,
							oldAuthentication.getCredentials(),
							oldAuthentication.getAuthorities()
						);
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		//3.사용자 피드백
		redirectAttr.addFlashAttribute("msg", "사용자 정보 수정 성공");
		
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
