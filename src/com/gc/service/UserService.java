package com.gc.service;

import java.util.List;

import com.gc.domain.User;


public interface UserService {
	//定义用户业务bean的接口类，应该有那些功能
	public User getUser(String id);
	public User getLoginUser(String name,String pwd);
	public List< User>  getUserAll();
	public boolean existUser(String name);
	public int addUser(User user);
	public int updateUser(User user);
	public int deleteUser(String id);
}
