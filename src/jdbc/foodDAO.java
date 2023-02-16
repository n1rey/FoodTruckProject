package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class foodDAO {
	//가게 등록
	public static int inserttemp(String fname, String fphoto, String flocation, String ftime,
						         String fmenu, String fprice) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO food(fname, fphoto, flocation, ftime, fmenu, fprice, fpro) "
						+ "VALUES(?, ?, ?, ?, ?, ?, ?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fname);
				pstmt.setString(2, fphoto);
				pstmt.setString(3, flocation);
				pstmt.setString(4, ftime);
				pstmt.setString(5, fmenu);
				pstmt.setString(6, fprice);
				pstmt.setString(7, "0");
				
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//가게 정보 수정
	public static int updatefood(String fname, String fphoto, String flocation, String ftime, String fmenu,
								 String fprice, String fno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE food SET fname = ?, fphoto = ?, flocation = ?, ftime = ?, "
					+ "fmenu = ?, fprice = ? WHERE fno = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fname);
				pstmt.setString(2, fphoto);
				pstmt.setString(3, flocation);
				pstmt.setString(4, ftime);
				pstmt.setString(5, fmenu);
				pstmt.setString(6, fprice);
				
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//가게 삭제
	public static int deletefood(String fno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM food WHERE fno = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fno);
				
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//가게 승인 절차
		public static int insertadmin(String fno) throws SQLException, NamingException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE food SET fpro = ? WHERE fno = ?";
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "1");
					pstmt.setString(2, fno);
					
				return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
				
			} finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			
		}
		
	//가게 승인 거부 절차
	public static int deleteadmin(String fno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM food WHERE fno = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fno);
			
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
					
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	}


	//가게 이름 가져오기
	public static String getName(int fno) throws SQLException {
		String sql = "SELECT fname FROM food WHERE fno = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String name = null;

		try {

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				name = rs.getString(1);
			}

			return name;
		} catch (Exception e) {
			e.printStackTrace();
			return name;
		} finally {
			if (rs != null) pstmt.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
}
