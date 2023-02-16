<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	String mail = request.getParameter("mail");
	String name = request.getParameter("name");
	


	int result = userDAO.insert(id, password, mail, name );
	
	if (result == 1) {
		out.print("등록 성공");
	} else {
		out.print("등록 실패");
	}

%>