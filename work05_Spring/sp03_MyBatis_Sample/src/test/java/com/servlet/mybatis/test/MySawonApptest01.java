package com.servlet.mybatis.test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.service.mybatis.vo.MySawon;

public class MySawonApptest01 {
	
	public static void main(String[] arg) throws IOException{
		
		 MySawon pvo = new MySawon();
		 pvo.setId("zero");
		 pvo.setPwd("1111");
		 pvo.setName("공유");
		 pvo.setAge(42);
		 
		 Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		 
		 //3. SqlSessionFactory 생성
		 SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		 
		 //4. SqlSession 생성
		 SqlSession session = factory.openSession();
		 System.out.println("SqlSession이 드디어 만들어졌습니다.....");
		 
		 /*
		  * SqlSession 쿼리문을 수행하는 모든 기능을 다 가지고 있다!!!
		  * int insert()
		  * int delete()
		  * int update()
		  * 
		  *  List selection
		  * 
		  */
		 
		 //sawonAdd 쿼리문 단위테스트....insert()
		 session.insert("SawonMapper.sawonAdd", pvo);
		 System.out.println(pvo.getName() + "님 회원등록 성공^^");
		 
		 //반드시!!
		 session.commit();
		 session.close();
	}
}






