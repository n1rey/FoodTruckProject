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
<%@ include file="header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- 리뷰목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">아이디</th>
        <th scope="col">별점</th>
        <th scope="col">내용</th>
        <th scope="col">날짜</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>
<!-- 리뷰등록 -->
<div class="container">
	<div class="mb-3">
		<label class="form-check-label" for="inlineCheckbox1">별점</label>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point">
		  <label>1</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point">
		  <label>2</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point">
		  <label>3</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point">
		  <label>4</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="point">
		  <label>5</label>
		</div>
	</div>
	<div class="mb-3">
	<input type="text" class="form-control" name="rcontent" id="summernote" required> 
	</div>
	<div class="mb-3">
		<div class="row">
			<div class="col">
				<button type="button" class="form-control btn btn-outline-secondary" onclick="registerFunction();">등록하기</button>
			</div>
			<div class="col">
				<button type="submit" class="form-control btn btn-outline-secondary">취소하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 함수 -->
<script>

</script>


</body>
</html>