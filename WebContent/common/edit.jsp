<!-- 
최초작성자 : 박성준 (sjpttr927@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 	  0.1(시작 23/02/15) 
              0.5(기본작업 23/02/16) 
              0.7(추가 디자인 23/02/18)
              1.0(1차 완성 23/02/20)
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>



<div class="container">
<form action="editProc.jsp" method="post">
<h2> 회원 정보 수정 </h2>

아이디: <input type="text" 	 id="id" 		name="id" 		value="<%=request.getParameter("id")%>" readonly><br>
이름:	  <input type="text"  	 id="name" 		name="name" 	placeholder="<%=request.getParameter("name")%>" ><br>
패스워드:<input type="password" id="password" 	name="password" placeholder="<%=request.getParameter("password")%>" ><br>
메일:	  <input type="text" 	 id="mail" 		name="mail" 	placeholder="<%=request.getParameter("mail")%>" ><br>

<button type="submit">회원 정보 수정</button> <br>
</form>
<hr>





</div>

</body>
</html>