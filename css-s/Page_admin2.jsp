<%@page import="java.sql.ResultSet"%>
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

	<div class="helloId">
		<%	// ���� �����ͼ� �̸� ����
		String name = session.getAttribute("userSession") + "";
		%>
		<a href="Main.jsp" style="float:left;"> HOME </a>
		<b><%=name%>�� &nbsp;</b>

		<%	if(name.equals("admin")) { %>
		<a href="Page_admin.jsp"> ������ </a> |	<%} %>		
		<%	if(name.equals("seller")) { %>
		<a href="Page_seller.jsp"> �Ǹ��� </a> |	<%} %>	
		<a href="_logout.jsp"> �α׾ƿ� </a>
		
	<h1 id="title"> WeMakethePrics </h1>
	
	<a href = 'Page_admin.jsp'> ����� ���� </a> |
	<a href = 'Page_admin2.jsp'> ȸ�� ��Ȳ </a>
	</div><br/>
	

<center>
	
	<table width='650' border='1'>
		<tr>
			<th width='10%'> No </th>
			<th width='10%'> ��� </th>
			<th width='20%'> ���̵� </th>
			<th width='20%'> �̸� </th>
			<th width='15%'> ��ȭ��ȣ </th>
			<th width='25%'> �ּ� </th></tr>
	<%
		Database db = new Database();
		db.connection();
				
		String sql = "SELECT * FROM people";
		ResultSet resultSet = db.select(sql);
			
		int i = 1;
	
			while (resultSet.next()) {
			%>	
			<tr>
				<td> <%=i %>
				<td> <%=resultSet.getString("tier") %></td>
				<td> <%=resultSet.getString("id") %></td>
				<td> <%=resultSet.getString("name") %> </td>
				<td> <%=resultSet.getString("phone") %> </td>
				<td> <%=resultSet.getString("address") %> </td>
				</tr>
		<%
		i++;
		}
		db.connectionClose();
	%>
	 		<tr>
	 			<td colspan="6" align="right">
				<a href="Main.jsp"> ���ư��� </a> </td>
	</table>
</center>
</body>
</html>