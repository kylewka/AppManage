package com.gc.domain;
/**
* <p>Title: User</p>  
* <p>Description: 用户实体类</p>  
* @date 2018年9月10日
 */
public class User {
	Integer id;
	String name;
	String pwd;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + "]";
	}
	
}
