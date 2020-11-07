package com.gc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.gc.domain.Goods;
import com.gc.domain.User;
import com.gc.service.GoodsService;
import com.gc.service.UserService;
import com.gc.service.impl.GoodsServiceImpl;

@Controller
public class GoodsController {
	//得到所有用户的控制
		 @RequestMapping(value="/getGoodsList")
		 public void getGoodsList(HttpServletResponse response) throws IOException {
			ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
			GoodsService goodsService=ctx.getBean("goodsService",GoodsServiceImpl.class);
			List< Goods> goodsList = goodsService.getAllGoods();
			//JSON是阿里提供的对象转JSON的jar包，可以快速把对象或者列表对象集合转化为json字符串
			String jsonString = JSON.toJSONString(goodsList);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonString);
	 	}
		 
		 @RequestMapping(value="/selectfloor")
		 public void selectfloor(@RequestParam("floor") String floor,HttpServletResponse response) throws IOException{
			 ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
			 GoodsService goodsService=ctx.getBean("goodsService",GoodsServiceImpl.class);
			 List<Goods>goodsList = goodsService.selectFloor(floor);
			 String jsonString = JSON.toJSONString(goodsList);
			 response.setCharacterEncoding("UTF-8");
			 response.getWriter().write(jsonString);
		 }
		 
		 @RequestMapping(value="/addGoods")
		 public void addGoods(@RequestParam("id") int id,@RequestParam("location") String location,@RequestParam("name") String name,@RequestParam("size") String size,@RequestParam("url") String url) throws IOException {
			ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
			GoodsService goodsService=ctx.getBean("goodsService",GoodsServiceImpl.class);
			Goods goods=new Goods();
			goods.setId(id);
			goods.setLocation(location);
			goods.setName(name);
			goods.setSize(size);
			goods.setUrl(url);			
			goodsService.addGoods(goods);	
	 	}
		 
		 @RequestMapping(value="/updateGoods")
		 public void updateGoods(@RequestParam("id") int id,@RequestParam("location") String location,@RequestParam("name") String name,@RequestParam("size") String size,@RequestParam("url") String url) throws IOException {
			ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
			GoodsService goodsService=ctx.getBean("goodsService",GoodsServiceImpl.class);
			Goods goods=new Goods();
			goods.setId(id);
			goods.setLocation(location);
			goods.setName(name);
			goods.setSize(size);
			goods.setUrl(url);
			goodsService.updateGoods(goods);	
	 	}
		 
		 @RequestMapping(value="/delGoods")
		 
		 public void delGoods(@RequestParam("id") int id,HttpServletResponse response) throws IOException {
				ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
				GoodsService goodsService=ctx.getBean("goodsService",GoodsServiceImpl.class);
				response.setContentType("text/json; charset=utf-8");
				Map<String, Object> resultMap = new HashMap<>();
				if(goodsService.delGoods(id)>0)
					resultMap.put("success", true);
					else
					resultMap.put("success", false);		
				String jsonString = JSON.toJSONString(resultMap);
				response.getWriter().write(jsonString);
					
					
		 	}
		 
		 
		 
}
