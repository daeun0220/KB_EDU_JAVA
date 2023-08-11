package com.jdbc.test;


import com.jdbc.dao.impl.CustomDAOImpl;
import com.jdbc.vo.Custom;

import config.ServerInfo;

public class CustomDAOTest {

	public static void main(String[] args) throws Exception{
		CustomDAOImpl dao = CustomDAOImpl.getInstance();
		dao.addCustom(new Custom(40, "아이유", "서울"));
		

	}
	
	static { // static 이 main보다 먼저 실행됨 
		try {  //가장 먼저 실행됨 
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("Driver Loading Success...");
			
		} catch(ClassNotFoundException e) {
			System.out.println("Driver Loading Fail...");
		} 
	}

}
