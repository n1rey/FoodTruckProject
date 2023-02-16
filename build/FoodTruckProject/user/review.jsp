<!--  
최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
최초작성일 : 2023/2/15

버전 기록 : 0.1(시작 23/02/15)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록과 리뷰 등록</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<% 
	sid = (String) session.getAttribute("id");
%>
<!-- 리뷰목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">아이디</th>
        <th scope="col">내용</th>
        <th scope="col">별점</th>
        <th scope="col">작성일</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<!-- 리뷰등록 -->
<div class="container">
	<input id="id" type="hidden" value="<%=sid%>"><!-- 로그인 연결 안되어있어서 DB에 있는 아이디 값으로 임시로 지정할것 -->
	<div class="mb-3">
		<label class="form-check-label" for="inlineCheckbox1">[별점]</label>
		<div></div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="1">
		  <label>1</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="2">
		  <label>2</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="3">
		  <label>3</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="4">
		  <label>4</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point" value="5">
		  <label>5</label>
		</div>
	</div>
	<div class="mb-3">
	<label for="exampleInputEmail1" class="form-label">[내용]</label>
	<input type="text" class="form-control" name="rcontent" id="rcontent" required> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="addReview()">등록하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 함수 -->
<script>
	function addReview() {
		var rates = document.getElementsByName('point');
		var rate_value;
		for(var i = 0; i < rates.length; i++){
		    if(rates[i].checked){
		        rate_value = rates[i].value;
		    }
		}
		$.ajax({
			type:"post",
			url: "reviewadd.jsp",
			data : {id:document.getElementById('id').value,
				    point:rate_value,
				    rcontent:document.getElementById('rcontent').value
				},
      
			dataType:"text",
			
			success:function(data) {
				alert("data");
				listFunction();
			}
		});
	}

	function listFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'reviewall.jsp',
 			success:function(data){
 				var reviews = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < reviews.length; i++){
 					
 					str += "<tr><td>" + reviews[i].id + "</td>";
 					str += "<td>" + reviews[i].rcontent + "</td>";
 					str += "<td>" + reviews[i].point + "점</td>";
 					str += "<td>" + reviews[i].rregtime + "</td></tr>";
 				    
 				    
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
	
	window.onload = function() {
		listFunction();
 	}
	
</script>
</body>
</html>