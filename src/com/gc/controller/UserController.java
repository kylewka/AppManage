package com.gc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;
import com.gc.domain.User;
import com.gc.service.UserService;

//Spring中定义为控制器，需要在	WebRoot/WEB-INF/springmvc-config.xml中 指定需要扫描的包<context:component-scan base-package="com.gc.controller" />


@Controller
@SessionAttributes(value="user",types={String.class})
public class UserController {
	Logger log = Logger.getLogger(UserController.class);
	
	//登录控制，类似登录login.servlet
	 @RequestMapping(value="/login")
	 public String login(@RequestParam("name") String name,@RequestParam("pwd") String pwd,Map<String,Object> map) {
		 
		ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		
		UserService userService=ctx.getBean("userService",UserService.class);
		User u =userService.getLoginUser(name,pwd);		
		if(u==null){
        	//登录失败
			 return "erro";
        }else{
        	map.put("user", u);	 
        	/*Spring直接调整到index.jsp，需要在WebRoot/WEB-INF/springmvc-config.xml指定视图文件在哪里，结尾是什么
        	 * 	<bean id="viewResolver"
		           class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		           <!-- 设置前缀 -->
		              <property name="prefix" value="/" />
		           <!-- 设置后缀 -->
		              <property name="suffix" value=".jsp" />
	            </bean>
        	 */
        	return "index";  
        }
	    }
	 
	//更新用户控制
	 @RequestMapping(value="/updateUser")
	 public void updateUser(@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("pwd") String pwd,HttpServletResponse response) throws IOException {
		 response.setContentType("text/json; charset=utf-8");
		 Map<String, Object> resultMap = new HashMap<>();
		 
		 ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService=ctx.getBean("userService",UserService.class);
		User user=userService.getUser(id);
		user.setName(name);	
		user.setPwd(pwd);
		if(userService.updateUser(user)>0)
		{
			resultMap.put("success", true);	
			resultMap.put("data", "修改成功");
		}
		else
		{
			resultMap.put("success", false);	
			resultMap.put("data", "失败");
		}
		String jsonString = JSON.toJSONString(resultMap);
		response.getWriter().println(jsonString);
 	}
	 
	//得到所有用户的控制
	 @RequestMapping(value="/getUserList")
	 public void getUserList(HttpServletResponse response) throws IOException {
		 response.setContentType("text/json; charset=utf-8");
		 ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService=ctx.getBean("userService",UserService.class);
		List< User> userList = userService.getUserAll();
		//JSON是阿里提供的对象转JSON的jar包，可以快速把对象或者列表对象集合转化为json字符串
		String jsonString = JSON.toJSONString(userList);
		
		response.getWriter().write(jsonString);
 	}
	 
	//删除一个用户的控制
	 @RequestMapping(value="/delUser")
	 public void delUser(@RequestParam("id") String id,HttpServletResponse response) throws IOException {
		 response.setContentType("text/json; charset=utf-8");
		 Map<String, Object> resultMap = new HashMap<>();
		 
		 ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService=ctx.getBean("userService",UserService.class);
		if(userService.deleteUser(id)>0)
		resultMap.put("success", true);
		else
		resultMap.put("success", false);		
		String jsonString = JSON.toJSONString(resultMap);
		response.getWriter().write(jsonString);
 	}
	 
	//增加一个用户的控制
	 @RequestMapping(value="/addUser")
	 public void addUser(@RequestParam("name") String name,@RequestParam("pwd") String pwd,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String jsonString="";
		ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService=ctx.getBean("userService",UserService.class);
		Map<String, Object> resultMap = new HashMap<>();
		if(userService.existUser(name))
		{	
			resultMap.put("success", false);
			resultMap.put("data", "存在当前用户名");
			jsonString = JSON.toJSONString(resultMap);
			response.getWriter().write(jsonString);
		}
		else
		{
			User user = new User();
			user.setName(name);
			user.setPwd(pwd);
			resultMap.put("success", true);
			if(userService.addUser(user)>0)
			{
			 resultMap.put("data", "保存成功");
			}
			 resultMap.put("data", "保存失败");
			jsonString = JSON.toJSONString(resultMap);
			response.getWriter().write(jsonString);
		}
		    
 	}
	 
	 
	 
}
