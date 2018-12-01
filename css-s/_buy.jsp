<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./Style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = session.getAttribute("userSession") + "";

		Database db = new Database();
		db.connection();
		
		// 세션 id의 Cartdb 데이터를 구입내역으로 옮김
		String sql = "INSERT INTO people_buy (id,item,price,itemcount,pkcode,code) "
				+ "SELECT id,item,price,itemcount,pkcode,code FROM cart "
				+ "WHERE id='"+name+"'";
		db.delete(sql);
		
		// Cart db에서 세션id의 데이터 삭제
		String sql2 = "DELETE FROM cart WHERE id='"+name+"'";
		db.delete(sql2);
		
		db.connectionClose();

		response.sendRedirect("Cart.jsp");	
	%>
	

</body>
</html>