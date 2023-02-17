<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
          0.5(기본작업 23/02/) 
          0.7(추가 디자인 23/02/)
          1.0(1차 완성 23/02/)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드 트럭 등록</title>
</head>
<body>
<%@ include file = "/header.jsp" %>

	<form action="foodAddCheck.jsp" method="get" enctype="multipart/form-data">
		이름 <input type="text" name="fname"><br>
		사진 <input type="file" name="fphoto"><br>
		위치 <input type="text" name="flocation"><br>
		영업 시간 <input type="text" name="ftime"><br>
		메뉴 <input type="text" name="fmenu"><br>
		메뉴 <input type="text" name="fmenu"><br>
		메뉴 <input type="text" name="fmenu"><br>
		가격 <input type="text" name="fprice"><br>
		<input type="submit" value="등록">
	</form>
</body>
</html>