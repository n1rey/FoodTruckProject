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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class orderDAO {
	
	//food 테이블의 fmenu 컬럼 속 값{메뉴명, 가격} 가져오기 
	public static String getMenuList(String fno) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int fno1 = Integer.parseInt(fno);//디비에 int로 넣어야해서 타입 변경
		
		try {
			String sql = "select fmenu from food where fno=?";//일단 전 메뉴 하나에 받기 > 추후 수정 ㅠ 
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fno1);
			rs = pstmt.executeQuery();
			
			JSONArray menus = new JSONArray();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("menuList", rs.getString(1));
			
				menus.add(obj);
			}	
			return menus.toJSONString();
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//내 주문 목록
	public static String getmylist(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql ="SELECT o.id, o.fno, f.fmenu, f.fname, f.fprice, o.menu, o.opro" +
			" FROM `order` o" +
			" JOIN `food` f ON o.fno = f.fno" +
			" WHERE o.id=? ";
			
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			JSONArray reviews = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", 	  rs.getString(1));
				obj.put("fno", 	  rs.getString(2));
				obj.put("fmenu",  rs.getString(3));
				obj.put("fname",  rs.getString(4));
				obj.put("fprice", rs.getString(5));
				obj.put("menu",   rs.getString(6));
				obj.put("opro",   rs.getString(7));
				
				reviews.add(obj);
			}
			return reviews.toJSONString();
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	
}
