<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.Database"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="./Style.css" type="text/css">
		<title> Main </title>
				<%
		String code = request.getParameter("code");
		%>
	</head>

<body>
	<div class="helloId">
		<%	// ���� �����ͼ� �̸� ����
		String session_name = session.getAttribute("userSession") + "";
		%>
				<a href="Main.jsp" style="float:left;"> HOME </a>
		
		<b><%=session_name%>�� &nbsp;</b>

				<%	if(session_name.equals("admin")) { %>
		<a href="Page_admin.jsp"> ������ </a> |	<%} %>		
		<%	if(session_name.equals("seller")) { %>
		<a href="Page_seller.jsp"> �Ǹ��� </a> |	<%} %>	
		<a href="_logout.jsp"> �α׾ƿ� </a>
		<img src="_getImage.jsp?code=<%=code %>" width="150" height="150" style="float: left">
	
	<h1 id="title">Free Board</h1>
	<a href = 'Board_insertFrom.jsp?code=<%=code %>'> �۾��� </a> |
	<a href = 'Main.jsp'> ó������ </a>
	</div><br/>

<center>
	<br/>

	<table width='700' border='1'>
		<tr height="30px">
			<th width='7%'> ��ȣ </th>
			<th width='20%'> �� ���� </th>
			<th width='43%'> �� ���� </th>
			<th width='15%'> �̸� </th>
			<th width='15%'> ��¥ </th> </tr>
			
	<%
		Database db = new Database();
		db.connection();
		
		String sql = "SELECT * FROM board WHERE code='"+code+"'";
		ResultSet resultSet = db.select(sql);
		
		//�� �Խñ� �� ī��Ʈ ����
		int count = 0;
		int no = 1;

			while (resultSet.next()) {
				String title = resultSet.getString("title");
					title = title.replace(" ", "&nbsp;");
				String contents = resultSet.getString("contents");
					contents = contents.replace(" ", "&nbsp;");
				String name = resultSet.getString("name");
					name = name.replace(" ", "&nbsp;");
				String dates = resultSet.getString("dates");
				int num = resultSet.getInt("num");
				count++;
	%>
	
	<tr>
		<td> <%=no %> </td>
		<td> <%=title %> </td>
		<td>
			<a href ='Board_contents.jsp?code=<%=code %>&num=<%=num%>&title=<%=title%>&contents=<%=contents%>&name=<%=name%>&dates=<%=dates%>'> <%=contents %> </a> </td>
		<td> <%=name %> </td>
		<td> <%=dates %> </td> </tr>
	<% 
			no++;
			}
			db.connectionClose();
	%>
	
	</table>
	
	
	<div id="count">
		<br/>
	 	<b> �Խñ� �� : </b> <%=count %>
	</div>
	 	 
</center>
</body>
</html>