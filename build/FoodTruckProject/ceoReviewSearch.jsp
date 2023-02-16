<%@ page import="jdbc.reviewDAO" %><%--
  Created by IntelliJ IDEA.
  User: qz678
  Date: 2023-02-16
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int fno = Integer.parseInt(request.getParameter("fno"));
  int pg = Integer.parseInt(request.getParameter("page"));

  out.print(reviewDAO.getCeoReviewList(fno, pg));
%>
