package com.kh.floworks.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.kh.floworks.common.Exception.MemberNotFountException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginFailHandler implements AuthenticationFailureHandler {
	

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String msg =  "알 수 없는 이유로 로그인 하실 수 없습니다. 고객센터로 문의 바랍니다.";
		String errorMsg = exception.getMessage();
		log.info("{}", errorMsg);
		if("UserNotFoundException".equals(errorMsg)){
			msg = "아이디 또는 비밀번호가 잘못되었습니다.";
		}
		
		if("MemberNotFoundException".equals(errorMsg)) {
			msg = "등록된 워크스페이스 정보가 없습니다. 먼저 워크스페이스를 등록하거나 생성하세요.";
		}

		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/login").forward(request, response);
	}
}
