<!-- 
최초작성자 : 강남욱 (redsky6301@naver.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
              0.5(기본작업 23/02/16) 
             
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 체크</title>
</head>
<body>
성공 !!
<%
	String name = request.getParameter("name");
	String mail = request.getParameter("mail");
	
	
	session.setAttribute("sid", mail);
	
	String sid = (String)session.getAttribute("sid");
	
%>

	[ <%= sid%> ] 님 로그인 성공하였습니다.


</body>
</html>