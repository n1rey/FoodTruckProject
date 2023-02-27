
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
	String nno = request.getParameter("nno");
	String ntitle = request.getParameter("ntitle");
	String ncontent = request.getParameter("ncontent");



if (notiDAO.edit(nno, ntitle, ncontent) == 1) {
	%>

<!-- Modal -->
<div class="modal fade" id="successNotiEdit" tabindex="-1" aria-labelledby="successNotiEditLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="successNotiEditLabel">공지 수정 성공</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/common/notice.jsp?page=1'"></button>
			</div>
			<div class="modal-body">
				공지 수정에 성공하였습니다.<br>
				공지 페이지로 이동합니다.
			</div>
			<div class="modal-footer">
				<button onclick="location.href='/common/notice.jsp?page=1'" class="btn btn-primary">이동</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#successNotiEdit").modal("show");
	});
</script>
<%
}else {
%>
<!-- Modal -->
<div class="modal fade" id="failNotiEdit" tabindex="-1" aria-labelledby="failNotiEditLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="failNotiEditLabel">공지 수정 실패</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/common/notice.jsp?page=1'"></button>
			</div>
			<div class="modal-body">
				공지 수정에 실패하였습니다.<br>
				공지 페이지로 이동합니다.
			</div>
			<div class="modal-footer">
				<button onclick="location.href='/common/notice.jsp?page=1'" class="btn btn-primary">이동</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#failNotiEdit").modal("show");
	});
</script>
<%
	}
%>
<%@ include file="/footer.jsp" %>   