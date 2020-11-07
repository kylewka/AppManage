package com.gc.service;

import java.util.List;

import com.gc.domain.Goods;


public interface GoodsService {
	
	public List< Goods> getAllGoods();
	public int addGoods(Goods goods);
	public int updateGoods(Goods goods);
	public int delGoods(int id);
	public List<Goods> selectFloor(String floor);
}
