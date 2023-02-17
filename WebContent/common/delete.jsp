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
<title>회원탈퇴</title>
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
<form action="deleteProc.jsp" method="post">
<h2>ID:<%=id %></h2>

아이디: <input type="text" 	 id="id" 		name="id" 		value="<%=id%>" ><br>
이름:	  <input type="text"  	 id="name" 		name="name" 	value="<%=name%>" ><br>
패스워드:<input type="password" id="password" 	name="password" value="<%=password%>" ><br>
메일:	  <input type="text" 	 id="mail" 		name="mail" 	value="<%=mail%>" ><br>

<hr>
<div>
 <textarea rows="5" cols="30">경고 문구. 회원 탈퇴</textarea>
</div>
<hr>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  회원 탈퇴
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경고</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말 회원 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">회원 탈퇴</button>
      </div>
    </div>
  </div>
</div>

</form>
</div>

</body>
</html>