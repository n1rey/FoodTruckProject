<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String point = request.getParameter("point");
	String rcontent = request.getParameter("rcontent");
	
	out.print(reviewDAO.insert(id, point, rcontent));  

%>