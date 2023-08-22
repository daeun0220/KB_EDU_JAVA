package servlet.model;
/*
 * DataSource방식으로 디비 연결하기..
 * Connection을 디비 연결할때마다 직접 생성해서 반환받는 것이 아니라
 * 이미 컨테이너 차원에서 여러개의 생성된 Connection을 가지고 있는 Connection Factory에서
 * 하나씩 Rent해온다.
 * 
 * 0. InitialContext 객체를 생성 
 * 1. DataSource를 하나 받아온다
 * 2. 그 안에 있는 Connection을 하나 빌어다 쓴다
 * 
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAOImpl implements MemberDAO{
	//필드 추가
	private DataSource ds;
	
	//싱글톤
	private static MemberDAOImpl dao = new MemberDAOImpl();
	private MemberDAOImpl() {
		 //0. InitialContext 객체를 생성 
		 //1. DataSource를 하나 받아온다
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/oracleDB");
			System.out.println("DataSource Lookup....Success...");
		} catch (NamingException e) {
			System.out.println("DataSource Lookup....Fail...");
		}		
	}
	public static MemberDAOImpl getInstance() {
		return dao;
	}
	
	
	@Override
	public Connection getConnection() throws SQLException {		
		System.out.println("디비연결 성공....");
		return ds.getConnection(); //Connection 하나씩 Pool에서 받아온다..
	}

	@Override
	public void closeAll(PreparedStatement ps, Connection conn) throws SQLException{
		if(ps!=null) ps.close();		
		if(conn != null) conn.close();
	}

	@Override
	public void closeAll(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException{		
		if(rs != null)	rs.close();
		closeAll(ps, conn);		
	}

	@Override
	public void registerMember(MemberVO vo) throws SQLException {		
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = getConnection();
			String query = "INSERT INTO member (id, password, name, address) VALUES(?,?,?,?)";
			ps = conn.prepareStatement(query);
			
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getAddress());
		
			System.out.println(ps.executeUpdate()+" row INSERT OK~~!!");
		}finally{
			closeAll(ps, conn);
		}
	}

	@Override
	public ArrayList<MemberVO> showAllMember() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			String query = "SELECT id, password, name, address FROM member";
			ps = conn.prepareStatement(query);
			System.out.println("PreparedStatement....showAllMember()..");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new MemberVO(
						rs.getString("id"), 
						rs.getString("password"), 
						rs.getString("name"), 
						rs.getString("address")));
			}
		}finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}

	@Override
	public MemberVO findByIdMember(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try{
			conn = getConnection();
			String query = "SELECT id, password, name, address FROM member WHERE id=?";
			ps= conn.prepareStatement(query);
			
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo = new MemberVO(id, 
						          rs.getString("password"), 
						          rs.getString("name"), 
						          rs.getString("address"));
			}
			System.out.println(id+ ", findByIdMember Success~~!!");
		}finally{
			closeAll(rs, ps, conn);
		}
		return vo;
	}	

	@Override
	public MemberVO login(String id, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			conn = getConnection();
			String query = "SELECT id, password, name, address FROM member WHERE id=? and password=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo = new MemberVO(id, 
						          password, 
						          rs.getString("name"), 
						          rs.getString("password"));
			}
			
		}finally {
			closeAll(rs, ps, conn);
		}
		return vo;
	}
		

}

















