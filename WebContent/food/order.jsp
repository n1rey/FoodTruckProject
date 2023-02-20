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
<% 
	String fno = request.getParameter("fno");
	//sid = (String) session.getAttribute("id");
	sid = "min";//임시
%>

<!-- 메뉴, 가격 목록 -->
<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="row">메뉴</th>
        <th scope="row">가격</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>



<!-- 수량 선택, 담기 -->
<input id="fno" type="hidden" value="<%=fno %>">





<!-- 함수 -->
<script>
	function menuListFunction() {
			
		$.ajax({
 			type:'post',
 			url:'oneStoreInfoAll.jsp?fno='+document.getElementById('fno').value,
 			success:function(data){
 				var infos = JSON.parse(data.trim());
 				var str = "";
 				
 				for(var i = 0; i < infos.length; i++){
 					
 					var json = JSON.parse(infos[i].fmenu);
 					var keys = Object.keys(json);
 					for (var i=0; i<keys.length; i++) {
 				    	var key = keys[i];
 						str += "<tr><td>" + key + "</td>";
 						str += "<td>" + json[key] + " 원</td></tr>";
 				    }
 				    
 				} 
 				$("#ajaxTable").html(str);
 			}
 		});
	}
	
	window.onload = function() {
		menuListFunction();
		}

</script>
</body>
</html>