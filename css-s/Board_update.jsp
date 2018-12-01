<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body style="padding-top: 20%">

	<%
		String code = request.getParameter("code");
		Database db = new Database();
		db.connection();
		
		// num title contents name dates
		String sql = "UPDATE board SET " 
		+ "title='"+request.getParameter("title")+"',"
		+ "contents='"+request.getParameter("contents")+"',"
		+ "name='"+request.getParameter("name")+"',"
		+ "dates='"+request.getParameter("dates")+"'"
		+ "WHERE num='"+request.getParameter("num")+"'";
		
		db.update(sql);
		db.connectionClose();
		response.sendRedirect("Board.jsp?code="+code);
	%>

</body>
</html>