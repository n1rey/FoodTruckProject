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
        <th scope="row">수량(최대10개)</th>
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
 					var fmenu = infos[i].fmenu.replace("[","").replace("]","");
 					var fprice = infos[i].fprice.replace("[","").replace("]","");
 					var menu = fmenu.split(",");
 					var price = fprice.split(",");
 					var keys1 = Object.keys(menu);
 					for (var i=0; i<keys1.length; i++) {
 				    	var key = keys1[i];
 						str += "<tr><td>" + menu[key] + "</td>";
 						str += "<td>" + price[key] + "</td>";
 						str += "<td><input type='number' id='cnt"+[i]+"' min='0' max='10' value='0'></td></tr>";
 				    }
 					str += "<tr><td><input type='submit' class='form-control btn btn-outline-secondary' value='포장하기'></form></td></tr>";
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