package com.kh.floworks.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.floworks.email.model.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class EmailAspect {
	
	@Autowired 
	private EmailService emailService;
	
	@Pointcut("execution(* com.kh.floworks.email.controller.EmailController.sendEmail*(..))")
	public void pointcut(){}
	
	@AfterThrowing(pointcut="pointcut()", throwing="exceptObj" )
	public void afterThrowingAdvice(JoinPoint jp, Exception exceptObj) {
		//타겟메소드 실행중 예외가 발생했을 때, 부가적인 로직을 제공할 목적으로 사용하는 Advice
		String methodName = jp.getSignature().getName();
		log.info("{}",methodName + "() 메소드 수행 중 예외 발생!");
		log.info(exceptObj.getMessage());
	}
}
	
