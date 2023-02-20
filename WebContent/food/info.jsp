<!--  
최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
최초작성일 : 2023/2/15

버전 기록 : 0.1(시작 23/02/16)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제보 목록과 제보하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<% 
	//sid = (String) session.getAttribute("id");
	sid = "min";//임시
%>
<!-- 제보목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">위치</th>
        <th scope="col">내용</th>
        <th scope="col">작성일</th>
        <th scope="col"></th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<!-- 제보하기 -->
<div class="container">
	<input id="id" type="hidden" value="<%=sid %>"><!-- 로그인 연결 안되어있어서 DB에 있는 아이디 값으로 임시로 지정할것 -->
	<div class="mb-3">
		<label for="exampleInputEmail1" class="form-label">[위치]</label>
		<input type="text" class="form-control" name="ilocation" id="ilocation" required> 
	</div>
	<div class="mb-3">
		<label for="exampleInputEmail1" class="form-label">[내용]</label>
		<input type="text" class="form-control" name="icontent" id="icontent" required> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="addInfo()">제보하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function addInfo() {
		
		$.ajax({
			type:"post",
			url: "infoAdd.jsp",
			data : {id:document.getElementById('id').value,
					ilocation:document.getElementById('ilocation').value,
					icontent:document.getElementById('icontent').value
				},
      
			dataType:"text",
			
			success:function(data) {
				var ilocation = document.getElementById('ilocation');
				var icontent = document.getElementById('icontent');
				ilocation.value = "";
				icontent.value = "";
				
				infoListFunction();
			}
		});
	}
	
	function delInfo(ino) {
 		$.ajax({
 			type:"post",
 			url: "infoDel.jsp",
 			data : {ino:ino},
 			dataType:"text",
 			
 			success:function(data) {
 				infoListFunction();
 			}
 		});
 	}
	
	function pageMovetoEdit(ino, ilocation, icontent) {
		window.location.href = 'infoEdit.jsp?ino='+ino+'&ilocation='+ilocation+'&icontent='+icontent;
 	}
	
	function infoListFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'infoAll.jsp',
 			success:function(data){
 				var infos = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < infos.length; i++){
 					
 					str += "<tr><td>" + infos[i].ino + "</td>";
 					str += "<td>" + infos[i].ilocation + "</td>";
 					str += "<td>" + infos[i].icontent + "</td>";
 					str += "<td>" + infos[i].iregtime + "</td>";
 					str += "<td><div class='row'><div class='col'><button type='button' class='form-control btn btn-outline-secondary' onclick='pageMovetoEdit(\"" + infos[i].ino + "\",\"" + infos[i].ilocation + "\",\"" + infos[i].icontent + "\")'>수정</button></div>";
 					str += "<div class='col'><button type='button' class='form-control btn btn-outline-secondary' onclick='delInfo(\"" + infos[i].ino + "\")'>삭제</button></div></div></td></tr>";
 				    
 				    
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		infoListFunction();
 	}
	
</script>
</body>
</html>