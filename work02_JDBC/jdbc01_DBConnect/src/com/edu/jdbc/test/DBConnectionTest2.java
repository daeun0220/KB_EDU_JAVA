package com.edu.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import config.ServerInfo;

/*
 *  디비 연결과정
 *  
 *  1. 서버의 정보를 가지고 있는 Driver를 메모리에 로딩
 */
public class DBConnectionTest2 {
	
	public DBConnectionTest2() {
		//jdbc 4단계 작업...
		
			//1. Driver Loading
			//FQCN (Full Qualified Class Name)
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("Driver Loading....Succes~~!!");
			
			//2. DB Connection...
			Connection conn = DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASSWORD);
			System.out.println("DB Connection....");
			
			//3. PrepareStatement 객체 생성
			//custom 테이블에 하나의 행을 추가하는 쿼리문
			String query = "INSERT INTO custom (id, name, address) VALUES(?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);
			System.out.println("Creating PreparedStatement....");
			
			//?에 값을 바인딩
			ps.setInt(1, 40);
			ps.setString(2, "Haba");
			ps.setString(3, "LA");
			
			//4. 쿼리문 실행
			int result = ps.executeUpdate();
			System.out.println(result);
			
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading...Fail~~!!");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("DB Connection...Fail");
		}
		
	}

	public static void main(String[] args) {
		new DBConnectionTest2();

	}

}
