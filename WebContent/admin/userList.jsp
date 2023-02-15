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
      		<h3>회원 관리</h3>
      		<br><br><br>
      		<table>
      		<tr height="50">
      		<td width="150" align="center">가입날짜</td>
      		<td width="150" align="center">아이디</td>
      		<td width="150" align="center">이름</td>
      		<td width="150" align="center">이메일</td>
      		</tr>
      		</table>
      		<br>
      		<table>
      		<tr height="50">
      		<td width="150" align="center"></td>
      		<td width="150" align="center"></td>
      		<td width="150" align="center"></td>
      		<td width="150" align="center"></td>
      		
      		<tr>
      		</table>
      		</div>
      	</div>
      </div>
</body>
      

