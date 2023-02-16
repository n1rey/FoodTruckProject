/**
 * 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
 * 최초작성일 : 2023/02/15
 * 
 * 버전 기록 : 0.1(시작 23/02/16)
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
	
}
