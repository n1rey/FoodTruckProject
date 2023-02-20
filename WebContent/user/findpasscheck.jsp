<!-- 
최초작성자 : 강남욱 (redsky6301@naver.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
              0.5(기본작업 23/02/16) 
             
 -->
<%@page import="jdbc.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp" %>
<%
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String mail = request.getParameter("mail");
	
	String password = userDAO.findpass(id,name,mail);
	
	if(password != null) {
		%>	
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">패스워드 찾기 성공</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		  	찾는 password : <%=password%>
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='login.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">로그인페이지</button>
		      
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal").modal("show");
			});
		</script>
<% 
	
	}else {
		%>
				<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">패스워드 찾기 실패</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		입력된 정보가 틀렸습니다. 로그인페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
		      <button onclick="location.href='login.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">로그인페이지</button>
		      
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>
		<% 
	}

%>

<%@include file="/footer.jsp" %>
</body>
</html>