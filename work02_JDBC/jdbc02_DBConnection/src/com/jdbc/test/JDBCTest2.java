package com.jdbc.test;

import com.jdbc.dao.CustomDAO;

import config.ServerInfo;

public class JDBCTest2 {

	public static void main(String[] args) throws Exception{
		CustomDAO dao = new CustomDAO();
		
		//dao.addCustom(1, "이정재", "서울");
		//dao.deleteCustom(1);
		//dao.updateCustom(1, "이정재", "부산");
		//dao.printACustom(10);
		dao.printAllCustom();

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
