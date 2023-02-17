<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>    
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
String mail = request.getParameter("mail");



if (userDAO.delete(id) == 1) {
	// response.sendRedirect("#"); // 처리 후 보낼 장소.
	out.print("success");
}else {
	out.print("fail");
}

%>