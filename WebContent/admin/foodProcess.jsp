<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="page_error_page.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Talk</title>
</head>
<body>
<%@ include file = "/header.jsp" %>
<%	
	if(!sid.equals("admin")){
	%>
	<!-- Modal -->
		<div class="modal fade" id="exampleModal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">관리자 전용 메뉴 </h1>
		        <button type="button" onclick="location.href='/user/login.jsp'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       관리자만 사용 가능한 메뉴입니다. <br>
		       로그인 페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
		        <button type="button" onclick="location.href='/user/login.jsp'" class="btn btn-primary">이동</button>
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
	} else {
		session.setAttribute("id", sid);
	}
%>
<style>
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body {
  display: flex;
  align-items: center;
  padding-top: 30px;
  padding-bottom: 30px;
  background-color: #f5f5f5;
    font-family: 'NanumSquareNeo-Variable';
}
</style>
	<div class="container bg-warning shadow mx-auto p-5 w-75">
	<!-- container 화면 전체를 차지하지 않는 고정 크기 컨테이너, 
				      브라우저의 크기에 반응하여  자동으로 크기가 변동됨
		 bg-warning bg는 배경 warning은 노란색		      
		 shadow		입체감 있게 그림자 효과 추가
		 mx-auto	m 바깥여백 x 가로로 auto 화면 가운데 정렬
		 p			padding 안쪽 여백
		 w			전체 너비
    -->
    <script>
	 	function addUser(id) {
	 		$.ajax({
	 			type:"post",
	 			url: "useradd.jsp",
	 			data : {id:id
	 				   
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
					searchFunction();
	 			}
	 		});
	 	}
 		
	 	function delUser(id) {
	 		$.ajax({
	 			type:"post",
	 			url: "userdel.jsp",
	 			data : {id:id
	 				
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
	 				searchFunction();
	 			}
	 		});
	 	}
	 	
	 	function searchFunction(){
	 		$.ajax({
				type : 'post',
				url  : 'tempall.jsp',
				success : function(data){
					var users = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < users.length; i++) {
						str += "<tr><td>" + users[i].id + "</td>";
	 					str += "<td><small>&nbsp;(" + users[i].name + ")</small></td>";		
	 					
 						str += "<td><div onclick='delUser(\"" + users[i].id + "\")'><span class='btn btn-danger'>Reject</span></div></td>";
 						str += "<td><div onclick='addUser(\"" + users[i].id + "\")'><span class='btn btn-primary'>Accept</span></div></td>";
	 					
	 					str += "</tr>";
	 					str += "<tr><td colspan=4 height=40><hr></td></tr>";
					} $("#ajaxTable").html(str);
					
				}
			});	
	 	}
	 	
	 	window.onload = function(){
			searchFunction();
		}
 	</script>
		<center><h2>가입 신청자 목록</h2></center>
		<div>
			<div class="input-group justify-content-center" >
			
			</div>
			<hr>
			<table align="center" width="400">
				<thead>
				</thead>
				<tbody id="ajaxTable">
				
				</tbody>	
			</table>
		</div>
	</div>

<%@ include file = "/footer.jsp" %>  	
</body>
</html>