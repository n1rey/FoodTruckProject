<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/header.jsp" %> 
<%
	request.setCharacterEncoding("UTF-8");
	
	String fname = request.getParameter("fname");
	String fphoto = request.getParameter("fphoto");
	String flocation = request.getParameter("flocation");
	String ftime = request.getParameter("ftime");
	String fmenu = request.getParameter("fmenu");
	String fprice = request.getParameter("fprice");
	
// 	if((foodDAO.inserttemp(fname, fphoto, flocation, ftime, fmenu, fprice) == 1) ? true : false) {
		
// 	}
	
%>
<%=fname %>
<%=fprice %>
<%=fmenu %>
</body>
</html>