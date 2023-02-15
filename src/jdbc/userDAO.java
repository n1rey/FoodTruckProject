package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class userDAO {

public static int insert(String id, String password, String mail ,String name) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO user(id,password,mail,name) VALUES(?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, mail);
				pstmt.setString(4, name);
				
			return	pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
	}

public static int login(String id, String password) throws NamingException, SQLException {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT id, password FROM user WHERE id = ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
		rs = pstmt.executeQuery();
		
		if(!rs.next()) return 1; //1 아이디가 존재하지 않는 경우
		if(!password.equals(rs.getString("password"))) return 2;//아이디는 존재하지만 비번이 일치하지 않는 경우
		return 0;
		
	}finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	}
}
