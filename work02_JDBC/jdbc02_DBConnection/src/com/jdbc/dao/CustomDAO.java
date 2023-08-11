package com.jdbc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ServerInfo;

/*
 * Business Logic을 가지고 있는 DAO 클래스
 * 하나의 기능이 완벽한 서비스 단위이다
 */
public class CustomDAO {
	
	public CustomDAO() {
		System.out.println("CustomDAO...Creating...");
	}
	////////// 공통적으로 반복되는 로직 ////////////
	private Connection getConnect() throws SQLException {
		Connection conn = DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASSWORD);
		System.out.println("DB Connect...");

		return conn;
	}
	private void closeAll(Connection conn, PreparedStatement ps) throws SQLException {
		if(ps!=null) ps.close();
		if(conn!=null)conn.close();
	}
	private void closeAll(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException {
		if(rs!=null) rs.close();
		closeAll(conn, ps);
	}
    
	////////// Business Logic //////////// 하나의 메서드가 하나의 기능 
	public void addCustom(int id, String name, String addr) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnect();
			
			String query = "INSERT INTO custom (id, name, address) VALUES(?,?,?)";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, addr);
			
			System.out.println(ps.executeUpdate() + "명 등록 성공");
			
		} finally {
			closeAll(conn, ps);
		}
		
		
	}
	
	public void deleteCustom(int id) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnect();
			
			String query = "DELETE custom WHERE id = ?";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);

			System.out.println(ps.executeUpdate() + "명 삭제 성공");
			
		} finally {
			closeAll(conn, ps);
		}
		
	}

	public void updateCustom(int id, String name, String addr) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnect();
			
			String query = "UPDATE custom SET id=?, name=?, address=? WHERE id = ?";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, addr);
			ps.setInt(4, id);
			
			System.out.println(ps.executeUpdate() + "명 수정 성공");
			
		} finally {
			closeAll(conn, ps);
		}
	
	}
	
	public void printAllCustom() throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnect();
			
			String query = "SELECT name, address FROM custom";
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {   // 다 출력이라 while 끝까지 
				System.out.println(rs.getString("name") +"\t" + rs.getString("address"));
			}
			
		} finally {
			closeAll(conn, ps, rs);
		}
	}
	
	public void printACustom(int id) throws SQLException{  // 한개만 출력하는거니까 if 사용 (while사용 X)
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnect();
			
			String query = "SELECT name, address FROM custom WHERE id=?";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) { // 한개만 출력하는거니까 if 사용 (while사용 X)
				System.out.println(rs.getString("name") +"\t" + rs.getString("address"));
			}
			
		} finally {
			closeAll(conn, ps, rs);
		}
		
		
	}
}
