<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   String sid = (String) session.getAttribute("id"); 
%> 
<%@ include file="header.jsp"%>
<tr>
<br><br><br>
 	<div class="container 12">
      	<div class="grid_9">
      		<h1>공지사항 등록</h1>
      		<br><br><br>
      		<table>
      		<h2>제목</h2>
      		<input type="text" name="ntitle" id="ntitle"  style="width:500px; height:50px;"></td>
      		<h2>내용</h2>
      		<input type="text" name="ncontent" id="ncontent" style="width:500px; height:500px;"></td>
      		</tr>
      		</table>
      		<input type="submit" value="등록" onClick="if(!confirm('등록하시겠습니까?')){return false;}"/>
      		<input type="submit" value="취소" onClick="if(!confirm('취소하시겠습니까?')){return false;}"/>
      		
      		</div>
      	</div>
      </div>
</body>
      