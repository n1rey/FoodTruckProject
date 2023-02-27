<%@ page import="jdbc.notiDAO" %><%--
  Created by IntelliJ IDEA.
  User: qz678
  Date: 2023-02-22
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>   
<%
  request.setCharacterEncoding("UTF-8");
  String ntitle = request.getParameter("ntitle");
  String ncontent = request.getParameter("ncontent");

  if (notiDAO.insert(ntitle, ncontent) == 1) {
%>

<!-- Modal -->
<div class="modal fade" id="successNotiInsert" tabindex="-1" aria-labelledby="successNotiInsertLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="successNotiInsertLabel">공지 등록 성공</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/common/notice.jsp?page=1'"></button>
      </div>
      <div class="modal-body">
        공지 등록에 성공하였습니다.<br>
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
    $("#successNotiInsert").modal("show");
  });
</script>
<%
}else {
%>
<!-- Modal -->
<div class="modal fade" id="failNotiInsert" tabindex="-1" aria-labelledby="failNotiInsertLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="failNotiInsertLabel">공지 등록 실패</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='/common/notice.jsp?page=1'"></button>
      </div>
      <div class="modal-body">
        공지 등록에 실패하였습니다.<br>
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
    $("#failNotiInsert").modal("show");
  });
</script>
<%
  }
%>
<%@ include file="/footer.jsp" %>   