package com.kh.floworks.member.contorller;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(User updateMember, Authentication oldAuthentication, RedirectAttributes redirectAttr) {
		//1.업무로직 : db반
		log.info("??????????????????????????????????>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		log.info("updateMember = {}", updateMember);
		
			
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
