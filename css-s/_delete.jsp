<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String pkcode = request.getParameter("pkcode");
		Database db = new Database();
		db.connection();
		
		String sql = "DELETE FROM cart WHERE pkcode='"+pkcode+"'";
		db.delete(sql);
		db.connectionClose();

		response.sendRedirect("Cart.jsp");	
	%>
	

</body>
</html>