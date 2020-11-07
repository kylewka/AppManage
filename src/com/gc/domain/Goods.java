package com.gc.domain;
/**
* <p>Title: Goods</p>  
* <p>Description:商品实体类 </p>  
* @date 2018年9月10日
 */
public class Goods {
	Integer id;
	String location;
	String name;
	String size;
	String url;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", location=" + location + ",name=" + name + ", size=" + size
				+ ", url=" + url + "]";
	}
}
