<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jdbc.reviewDAO" %>
<%
  int fno = Integer.parseInt(request.getParameter("fno"));
  int pg = Integer.parseInt(request.getParameter("page"));

  out.print(reviewDAO.getCeoReviewList(fno, pg));
%>
