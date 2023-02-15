<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   String sid = (String) session.getAttribute("id"); 
%> 
<%@ include file="header.jsp"%>
<tr>
 	<div class="container 12">
      	<div class="grid_9">
      		<div class="">
      		<h3>공지사항 관리</h3>
      		<table>
      		<tr>
      		<th>이름</th><td align="left" style="padding-bottom:10px;">
      		<input type="text" name="name" id="name" size="30"></td>
      		<th>비밀번호</th><td align="left">
      		<input type="text" name="pw" id="pw" size="30"></td></tr>
      		<tr>
      		<input type="text" name="email1" id="email1">
      			<select name="email2" id="email2">
      				<option value="">선택
      				<option value="naver.com">naver.com
      				<option value="gmail.com">gmail.com
      				<option value="daum.net">daum.net
      				<option value="직접익렵">직접입력
      			</select>
      		</td></tr>
      		</table>
      		</div>
      	</div>
      </div>



    
   
 