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
<title>제보수정하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String ino = request.getParameter("ino");
	String ilocation = request.getParameter("ilocation");
	String icontent = request.getParameter("icontent");

%>
<!-- 제보 수정하기 -->
<div class="container">
	<input id="ino" type="hidden" value="<%=ino%>"><!-- 로그인 연결 안되어있어서 DB에 있는 아이디 값으로 임시로 지정할것 -->
	<div class="mb-3">
		<label for="exampleInputEmail1" class="form-label">[위치]</label>
		<input type="text" class="form-control" name="ilocation" id="ilocation" required value="<%=ilocation%>"> 
	</div>
	<div class="mb-3">
		<label for="exampleInputEmail1" class="form-label">[내용]</label>
		<input type="text" class="form-control" name="icontent" id="icontent" required value="<%=icontent%>"> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="editInfo()">제보 수정하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary" onclick="location.href='info.jsp'">취소하기</button>
			</div>
		</div>
	</div>
</div>
<script>
	function editInfo() {
		
		$.ajax({
			type:"post",
			url: "infoEditProc.jsp",
			data : {ino:document.getElementById('ino').value,
					ilocation:document.getElementById('ilocation').value,
					icontent:document.getElementById('icontent').value
				},
	  
			dataType:"text",
			
			success:function(data) {
				window.location.href = 'info.jsp';
			}
		});
	}
</script>
</body>
</html>