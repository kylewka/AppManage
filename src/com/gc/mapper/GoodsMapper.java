package com.gc.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gc.domain.Goods;
public interface GoodsMapper {
	
	@Select("SELECT * FROM GOODS WHERE ID = #{id}")
	@Results({
		@Result(column="id",property="id"),
		@Result(column="location",property="location"),
		@Result(column="name",property="name"),
		@Result(column="size",property="size"),
		@Result(column="url",property="url"),
	})	
	Goods getGoods(String id);
	
	@Insert("INSERT INTO GOODS(id,location,name,size,url) VALUES(#{id},#{location},#{name},#{size},#{url})")
	int addGoods(Goods good);
	
	@Select("SELECT * FROM GOODS")
	List<Goods> getGoodsAll();	

	@Update("UPDATE GOODS SET id = #{id},location = #{location},name = #{name},size = #{size},url = #{url} WHERE ID = #{id}")
	int updateGoods(Goods good);

	@Delete("DELETE FROM GOODS WHERE ID = #{id}")
	int deleteGoods(int id);
	
	@Select("select * from goods where location =#{location}")
	List<Goods> selectFloorAll(String floor);
}
