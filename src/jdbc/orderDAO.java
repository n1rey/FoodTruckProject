/**
 * 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
 * 최초작성일 : 2023/02/15
 * 
 * 버전 기록 : 0.1(시작 23/02/15)
 */
package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.*;

import util.ConnectionPool;

public class orderDAO {
	
	//내 주문 목록
	public static String getmylist(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//String sql = "SELECT * FROM `order` WHERE id=?";
			String sql ="SELECT o.id, o.fno, f.fmenu, f.fname, f.fprice, o.menu, o.opro" +
			" FROM `order` o" +
			" JOIN `food` f ON o.fno = f.fno" +
			" WHERE o.id=? ";
			// 이후에 opro 값에 따라서 주문중인 것만 보여줄 것인지 생각해봐야 한다.
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			JSONArray reviews = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				obj.put("fno", rs.getString(2));
				obj.put("fmenu", rs.getString(3));
				obj.put("fname", rs.getString(4));
				obj.put("fprice", rs.getString(5));
				obj.put("menu", rs.getString(6));
				obj.put("opro", rs.getString(7));
				//추가 하고 싶은 데이터 열 추가해서 가져오면 됨.
				
				reviews.add(obj);
			}
			return reviews.toJSONString();
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	//주문하기 
	public static int order(String fno, String id, String json, int total) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int fno2 = Integer.parseInt(fno);//디비에 int로 넣어야해서 타입 변경
		String total2 = Integer.toString(total);//디비에 int로 넣어야해서 타입 변경
		try {
			String sql = "INSERT INTO `order` (fno, id, menu, total) VALUES(?, ?, ?, ?)";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, fno2);
					pstmt.setString(2, id);
					pstmt.setString(3, json);
					pstmt.setString(4, total2);
				int result = pstmt.executeUpdate();
					
				return result;
					
			} catch (Exception e) {
		         e.printStackTrace();

		         return 2;
		      } finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
}
