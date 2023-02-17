<!-- 
최초작성자 : 변예린 (n1rey009@gmail.com)
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17) 
          0.5(기본작업 23/02/17) 
          0.7(추가 디자인 23/02/)
          1.0(1차 완성 23/02/)
 -->

<%@page import="util.FileUtil"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/header.jsp" %> 
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리
	
	byte[] fbu = null;			//파일 자체
	
	String fname = "";
	String fphoto = "";
	String flocation = "";	
	String ftime = "";	
	String time1 = "";
	String time2 = "";
	String time3 = "";
	String time4 = "";
	String fmenu = "";	
	String fprice = ""; 
	String fno = ""; 
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator(); //for문과 while문 돌릴 수 있도록 순서화시킴
	
	while(iter.hasNext()){
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName(); //키값 속성 추출
			String value = item.getString("UTF-8");
			if(name.equals("fname")) fname = value;
			else if(name.equals("flocation")) flocation = value;
			else if(name.equals("time1")) time1 = value;
			else if(name.equals("time2")) time2 = value;
			else if(name.equals("time3")) time3 = value;
			else if(name.equals("time4")) time4 = value;
			else if(name.equals("fmenu")) fmenu = value;
			else if(name.equals("fprice")) fprice = value;
			else if(name.equals("fno")) fno = value;
			ftime = time1 + time2 + "&" + time3 + time4;
			fphoto = item.getName();
			fbu = item.get();
			String root = application.getRealPath(java.io.File.separator);
		}
		
	
 	if((foodDAO.deletefood(fno) == 1) ? true : false) {
		%>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">푸드 트럭 삭제 성공</h1>
		        <button type="button" onclick="location.href=''" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        푸드 트럭 삭제에 성공했습니다. <br>
		        메인 페이지로 이동합니다.
		      </div>
		      <div class="modal-footer">
			        <button onclick="location.href=''" class="btn btn-primary">메인으로 이동</button>

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
		
 	} else {
			%>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">푸드 트럭 삭제 실패</h1>
			        <button type="button" onclick="location.href='foodAdd.jsp'" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
				        푸드 트럭 삭제에 실패했습니다. <br> 
				        다시 시도해 주세요.
			      </div>
			      <div class="modal-footer">
			        <button onclick="location.href='foodAdd.jsp'" class="btn btn-primary">이전 페이지로 이동</button>

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

</body>
</html>