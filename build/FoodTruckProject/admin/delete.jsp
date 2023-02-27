
<!-- 
	최초작성자 : 김형준(bright32123@gmail.com)
	최초작성일 : 2023/02/20
	버전 기록   : 0.1(시작 23/02/20) 
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>    
<%@ include file="/header.jsp" %>
<%request.setCharacterEncoding("utf-8"); %>
<%
String id = request.getParameter("id");

if (userDAO.delete(id) == 1) {
	session.invalidate();
	%>
	<!-- Modal -->
	<div class="modal fade" id="successUserDelete" tabindex="-1" aria-labelledby="successUserDeleteLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="successUserDeleteLabel">회원 탈퇴 성공</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/main.jsp'"></button>
				</div>
				<div class="modal-body">
					성공적으로 탈퇴되었습니다.<br>
				</div>
				<div class="modal-footer">
					<button onclick="location.href='/main.jsp'" class="btn btn-primary">메인으로</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
 			$("#successUserDelete").modal("show");
		});
	</script>
	<%
		}else {
	%>
	<!-- Modal -->
	<div class="modal fade" id="failUserDelete" tabindex="-1" aria-labelledby="failUserDeleteLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="failUserDeleteLabel">회원 탈퇴 실패</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/main.jsp'"></button>
				</div>
				<div class="modal-body">
					회원 탈퇴에 실패하였습니다.<br>
					다시 시도해주세요.
				</div>
				<div class="modal-footer">
					<button onclick="location.href='/main.jsp'" class="btn btn-primary">메인으로</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#failUserDelete").modal("show");
		});
	</script>
	<%
		}
	%>
<%@ include file="/footer.jsp" %>   