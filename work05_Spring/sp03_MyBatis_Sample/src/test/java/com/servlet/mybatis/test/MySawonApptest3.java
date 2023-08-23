package com.servlet.mybatis.test;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.service.mybatis.vo.MySawon;

import util.FactoryService;


public class MySawonApptest3 {

	public static void main(String[] args) throws IOException{

		SqlSessionFactory factory = FactoryService.getFactory();
		//3. SqlSession 리턴받고
		SqlSession session = factory.openSession();
		
		//4. selectList() 호출
		List<MySawon> list = session.selectList("SawonMapper.sawonList");
		for(MySawon vo : list) System.out.println(vo);
		
	}

}
