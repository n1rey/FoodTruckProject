package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jdbc.*;

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
				
			 return   pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
			 
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

	public static userDTO info(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.get();
			
			String sql = "SELECT * FROM user WHERE id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			userDTO userDTO = new userDTO();
			
			if(rs.next()) {
				userDTO.setId(rs.getString(1));
				userDTO.setPassword(rs.getString(2));
				userDTO.setMail(rs.getString(3));
				userDTO.setMname(rs.getString(4));
			}
			
			return userDTO;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	} // end of info

	//정보 수정
	public static int edit(String id, String password, String name, String mail) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE user SET password=?, name=?, mail=? WHERE id=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, mail);
			pstmt.setString(4, id);
			
			return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	} // end of edit

	public static int delete(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM user WHERE id=?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				return	pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
			}finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
		}
	}



	
}