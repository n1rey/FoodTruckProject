
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
String name = request.getParameter("name");
String mail = request.getParameter("mail");
String password = request.getParameter("password");



if (userDAO.edit( id, password, name, mail) == 1) {
	%>
	<!-- Modal -->
	<div class="modal fade" id="successUserEdit" tabindex="-1" aria-labelledby="successUserEditLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="successUserEditLabel">회원 정보 수정 성공</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/main.jsp'"></button>
				</div>
				<div class="modal-body">
					성공적으로 정보가 수정되었습니다.<br>
				</div>
				<div class="modal-footer">
					<button onclick="location.href='/main.jsp'" class="btn btn-primary">메인으로</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#successUserEdit").modal("show");
		});
	</script>
	<%
	}else {
	%>
	<!-- Modal -->
	<div class="modal fade" id="failUserEdit" tabindex="-1" aria-labelledby="failUserEditLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="failUserEditLabel">회원 정보 수정 실패</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/main.jsp'"></button>
				</div>
				<div class="modal-body">
					정보 수정에 실패하였습니다.<br>
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
			$("#failUserEdit").modal("show");
		});
	</script>
	<%
		}
	%>
<%@ include file="/footer.jsp" %>