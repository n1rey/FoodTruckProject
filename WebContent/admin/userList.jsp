<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.notiDAO" %>
<%@ page import="jdbc.userDAO" %>
<%@ page import="jdbc.userDTO" %>
<% 
   String id = (String) session.getAttribute("id");
	if(id == null || !id.equals("admin")){
	/* response.sendRedirect("login.jsp"); */
}
	List<userDTO> userList = (List<userDTO>)request.getAttribute("userList");
	
%> 
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
 <head>
 <style>
 table{border-style : ridge;}
 td{border-style : ridge;}
 </style>
 </head>
 <body>
 <%@ include file="/header.jsp" %>
<tr>
<br><br><br>
 	<div class="container 12">
      	<div class="grid_9">
      		<h3>회원 관리</h3>
      		<br><br><br>
      		<table>
      		<tr height="50">
      		<td width="150" align="center">가입날짜</td>
      		<td width="150" align="center">아이디</td>
      		<td width="150" align="center">이름</td>
      		<td width="150" align="center">이메일</td>
      		</tr>
      		</table>
      		<br>
      		<% 
      		for(int i=0; i<userList.size(); i++ ){
      			
      		}
      		%>
      		<table>
      		<tr height="50">
      		<td width="150" align="center"></td>
      		<td width="150" align="center"></td>
      		<td width="150" align="center"></td>
      		<td width="150" align="center"></td>
      		
      		<tr>
      		</table>
      		</div>
      	</div>
      </div>
</body>
      

