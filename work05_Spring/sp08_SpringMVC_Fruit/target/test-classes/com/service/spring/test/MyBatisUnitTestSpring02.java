package com.service.spring.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.spring.domain.Item;
import com.service.spring.service.ItemCatalog;

public class MyBatisUnitTestSpring02 {
	@Test
	public void DITest() throws Exception{
		// 빈을 생성하는 DI 컨테이너 생성.. Pre Loading... getBean() 타임이 아닌 주문서를 읽자마자 빈을 생성 
		ApplicationContext factory = new ClassPathXmlApplicationContext("bean/itemservice.xml");
		
		ItemCatalog service = (ItemCatalog)factory.getBean("itemCatalogImpl");
		System.out.println("============== getItemList ============= ");
		List<Item> list = service.getListItem();
		for(Item i: list) System.out.println(i);
		
		System.out.println("============== getItem ============= ");
		Item item = service.getItem(2222);
		System.out.println(item);
	}
}
