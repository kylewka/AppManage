package com.gc.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gc.domain.Goods;
import com.gc.domain.User;
public interface UserMapper {
	
	@Select("SELECT * FROM USER WHERE ID = #{id}")
	@Results({
		@Result(id=true,column="id",property="id"),
		@Result(column="name",property="name"),
		@Result(column="pwd",property="pwd"),
	})	
	User getUser(String id);
	
	@Insert("INSERT INTO USER(name,pwd) VALUES(#{name},#{pwd})")
	int addUser(User user);
	
	@Select("SELECT * FROM USER")
	List<User> getUserAll();	

	@Update("UPDATE USER SET name = #{name},pwd = #{pwd} WHERE ID = #{id}")
	int updateUser(User user);

	@Delete("DELETE FROM USER WHERE ID = #{id}")
	int deleteUser(String id);
	
	@Select("SELECT * FROM USER WHERE NAME = #{0} AND PWD = #{1}")
	User getLoginUser(String name,String pwd);
	
	@Select("SELECT COUNT(*) FROM USER WHERE NAME = #{name}")
	int getUserByName(String name);
	
}
