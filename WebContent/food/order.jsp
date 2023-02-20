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
<title>주문하기</title>
</head>
<body>
<%@ include file="../header.jsp"%>

<!-- 메뉴+가격 목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">메뉴</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<!-- 수량 선택 -->

<!-- 함수 -->
<script>
	function menuListFunction() {
			
			$.ajax({
				type:'post',
				url:'orderMenuList.jsp',
				success:function(data){
					var menus = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < menus.length; i++){
						
						str += "<tr><td>" + menus[i].menuList + "</td></tr>";
					    
					    
					} $("#ajaxTable").html(str);
				}
			});
		}
	
	window.onload = function() {
		menuListFunction();
		}

</script>
</body>
</html>