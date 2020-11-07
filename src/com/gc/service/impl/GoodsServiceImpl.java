package com.gc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.gc.domain.Goods;
import com.gc.domain.User;
import com.gc.mapper.GoodsMapper;
import com.gc.mapper.UserMapper;
import com.gc.service.GoodsService;

public class GoodsServiceImpl extends SqlSessionDaoSupport implements GoodsService {
	
	@Override
	public List< Goods> getAllGoods(){
		SqlSession sqlSession = this.getSqlSession();
		GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);		
		return mapper.getGoodsAll(); 
	}
	@Override
	public List<Goods> selectFloor(String floor){
		SqlSession sqlSession = this.getSqlSession();
		GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);
		return mapper.selectFloorAll(floor); 
	}
	@Override
	public int addGoods(Goods goods){
		SqlSession sqlSession = this.getSqlSession();
		GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);		
		return mapper.addGoods(goods); 
	}
	
	@Override
	public int updateGoods(Goods goods){
		SqlSession sqlSession = this.getSqlSession();
		GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);		
		return mapper.updateGoods(goods); 
	}
	
	@Override
	public int delGoods(int id){
		SqlSession sqlSession = this.getSqlSession();
		GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);		
		return mapper.deleteGoods(id); 	
	}
	

}
