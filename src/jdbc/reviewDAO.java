/**
 * 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
 * 최초작성일 : 2023/02/15
 * 
 * 버전 기록 : 0.1(시작 23/02/15)
 */
package jdbc;

import java.sql.*;
import javax.naming.NamingException;
import org.json.simple.*;
import util.ConnectionPool;

public class reviewDAO {
	
	//리뷰 등록 
	public static int insert(String id, String point, String rcontent) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int point2 = Integer.parseInt(point);//디비에 int로 넣어야해서 타입 변경
		try {
			String sql = "INSERT INTO review (fno, id, point, rcontent) VALUES(?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, 1);//가게 택한 후에 리뷰 작성이라 fno 받아올건데 현재 가게목록부분이 연결안되어 있어서 임시로 1
				pstmt.setString(2, id);
				pstmt.setInt(3, point2);
				pstmt.setString(4, rcontent);
			int result = pstmt.executeUpdate();
				
			return result;
				
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	//한 가게의 리뷰목록
	public static String getlist() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM review ORDER BY rregtime DESC";//가게 번호 받아올것(추후 수정)
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			JSONArray reviews = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(2));
				obj.put("point", rs.getString(3));
				obj.put("rcontent", rs.getString(4));
				obj.put("rregtime", rs.getString(5));
			
				reviews.add(obj);
			}
				
			return reviews.toJSONString();
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
}
