<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17) 
          0.5(기본작업 23/02/17) 
          0.7(추가 디자인 23/02/20)
          1.0(1차 완성 23/02/20)
 -->
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드 트럭 승인 관리</title>
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
	<div class="container shadow mx-auto p-5 w-75">
    
    <script>
	 	function addFood(fno) {
	 		$.ajax({
	 			type:"post",
	 			url: "foodAdd.jsp",
	 			data : {fno:fno
	 				   
	 			},
	 			dataType:"text",
	 			
	 			success:function(data) {
					searchFunction();
	 			}
	 		});
	 	}
 		
	 	function delFood(fno) {
	 		$.ajax({
	 			type:"post",
	 			url: "foodDel.jsp",
	 			data : {fno:fno
	 				
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
				url  : 'foodAll.jsp',
				success : function(data){
					var foods = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < foods.length; i++) {
						str += "<tr><td>" + foods[i].fno + "&nbsp;</td>";
	 					str += "<td><a href='foodProDetail.jsp?fno="+ foods[i].fno +"'><small>(" + foods[i].fname + ")</small></a></td>";		
	 					str += "<td><small>&nbsp;(" + foods[i].flocation + ")</small></td>";		
	 					
 						str += "<td><div onclick='delFood(\"" + foods[i].fno + "\")'><span class='btn btn-danger'>Reject</span></div></td>";
 						str += "<td><div onclick='addFood(\"" + foods[i].fno + "\")'><span class='btn btn-primary'>Accept</span></div></td>";
	 					
	 					str += "</tr>";
	 					str += "<tr><td colspan=5 height=40><hr></td></tr>";
					} $("#ajaxTable").html(str);
					
				}
			});	
	 	}
	 	
	 	window.onload = function(){
			searchFunction();
		}
 	</script>
		<center><h2>푸드 트럭 승인 신청 목록</h2></center>
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

</body>
</html>