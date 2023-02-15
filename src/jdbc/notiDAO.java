package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class notiDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection con;
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource dsc = (DataSource) envctx.lookup("jdbc/foodtruck");
			con = dsc.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

public void userInsert(userDTO dto) {
	getCon();
	try {
		String sql = "insert into user(?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getMname());
		pstmt.setString(3, dto.getMail());
		pstmt.executeLargeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
   }
	public ArrayList<userDTO> getAllList(){
	ArrayList<userDTO> list = new ArrayList<>();
	getCon();
	try {
		String sql = "select * from MEMBER_PRAC";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			userDTO dto = new userDTO();
			dto.setId(rs.getString(1));
			dto.setMname(rs.getString(2));
			dto.setMail(rs.getString(3));
			list.add(dto);
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}
}

	
