package com.kh.security;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/application-context.xml",
	                   "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class LoginTest {
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder bcry;
	

	@Test 
	public void testInsertMember() {
		log.info("{}", bcry.encode("123456"));
	}
}
