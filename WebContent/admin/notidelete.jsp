<!--
최초작성자 : 김형준(bright32123@gmail.com)
최초작성일 : 2023/02/20
버전 기록   : 0.1(시작 23/02/20)

-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%@ include file = "/header.jsp" %> 
<%request.setCharacterEncoding("utf-8"); %>
<%
	String nno = request.getParameter("nno");

	if (notiDAO.delete(nno) == 1) {
%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static" data-bs-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">공지 삭제 성공</h1>
		        <button type="button" onclick="location.href='/common/notice.jsp?page=1'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        공지 삭제에 성공했습니다. <br>
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
				$("#exampleModal1").modal("show");
			});
		</script>
<%
}else {
%>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">공지 삭제 실패</h1>
			        <button type="button" onclick="location.href='/common/notice.jsp?page=1'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
				        공지 삭제에 실패했습니다. <br> 
				        다시 시도해 주세요.
			      </div>
			      <div class="modal-footer">
			        <button onclick="location.href='/common/notice.jsp?page=1'" class="btn btn-primary">공지 관리 페이지로 이동</button>

			      </div>
			    </div>
			  </div>
			</div>

			<script>
				$(function() {
					$("#exampleModal2").modal("show");
				});
			</script>	
<%
	}

%>
<%@ include file="/footer.jsp" %>  