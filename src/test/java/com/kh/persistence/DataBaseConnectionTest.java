package com.kh.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.slf4j.Slf4j;


@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/application-context.xml")
@Slf4j
public class DataBaseConnectionTest {
	
	@Autowired
	private SqlSession session;
	
	@Test
	public void test() {
		List<String> test = session.selectList("sample.test");
		
		log.info("test = {}", test);
	}
	
}
