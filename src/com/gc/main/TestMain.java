package com.gc.main;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;





import com.gc.domain.User;
import com.gc.mapper.UserMapper;
import com.gc.service.UserService;


public class TestMain {	

		public static void main(String[] args) {
			Logger log = Logger.getLogger(TestMain.class);
			ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=ctx.getBean("userService",UserService.class);
			User u=userService.getLoginUser("李四","123456");			
//			ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
//			UserService userService=ctx.getBean("userService",UserService.class);
//			ArrayList l=(ArrayList) userService.getUserAll();
//			log.info(l.size());
			
			
		}	

	}