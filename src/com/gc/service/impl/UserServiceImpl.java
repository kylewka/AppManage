package com.gc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.gc.domain.User;
import com.gc.mapper.UserMapper;
import com.gc.service.UserService;


public class UserServiceImpl extends SqlSessionDaoSupport implements UserService {
	//定义用户业务bean的接口类的实现类，需要把定义的接口方法都实现
	
	
	@Override
	public User getUser(String id){
		//SqlSession是继承自SqlSessionDaoSupport父类，在这个父类里，Spring已经自动注入了SqlSession，可以直接使用
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);			
		return mapper.getUser(id);
	}
	
	
	@Override
	public User getLoginUser(String name,String pwd){
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);		
		return mapper.getLoginUser(name,pwd);
	}
	
	@Override
	public List< User>  getUserAll(){
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);		
		return mapper.getUserAll(); 
	}
	
	@Override
	public boolean existUser(String name){
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);		
		if(mapper.getUserByName(name)==0)return false;
		return true;
	}
	
	@Override
	public int addUser(User user){
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);		
		return mapper.addUser(user);
	}
	
	@Override
	public int updateUser(User user){
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);		
		return mapper.updateUser(user);
	}
	
	@Override
	public int deleteUser(String id){		
		SqlSession sqlSession = this.getSqlSession();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);		
		return mapper.deleteUser(id);
	}

}
