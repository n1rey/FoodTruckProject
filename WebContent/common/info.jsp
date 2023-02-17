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
<title>프로필</title>
</head>
<body>


<%
sid ="1";                     // sid 나중에 받아오도록 변경해야한다.

String id = sid;

userDTO userDTO = userDAO.info(id);


id = userDTO.getId();
String name = userDTO.getMname();
String mail = userDTO.getMail();
String password = userDTO.getPassword();
%>

<div class="container">
<form action="edit.jsp" method="post">
<h2>ID:<%=id %></h2>

아이디: <input type="text" 	 id="id" 		name="id" 		value="<%=id%>" ><br>
이름:	  <input type="text"  	 id="name" 		name="name" 	value="<%=name%>" ><br>
패스워드:<input type="password" id="password" 	name="password" value="<%=password%>" ><br>
메일:	  <input type="text" 	 id="mail" 		name="mail" 	value="<%=mail%>" ><br>


<input type="submit" value="회원 정보 수정"> <br>
<input type="submit" formaction="delete.jsp" value="탈퇴" >

</form>
<hr>
<div><h3>리뷰 관련 정보 표시구역</h3></div>

<a href="#">리뷰보기</a> <br>
<a href="#">주문내역</a> <br>
<a href="#">문의하기</a> <br>



</div>

</body>
</html>