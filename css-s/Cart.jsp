<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./Style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
		
	<h1 id="title"> My Cart </h1>
	</div><br/>
<center>
<% 
	String code = request.getParameter("code");
	String item = request.getParameter("item");
	String count = request.getParameter("count");
	String price = request.getParameter("price");
	String id = session.getAttribute("userSession") + "";

%>
	<form action='_buy.jsp'>
	
	<table width='650' border='1'>
		<tr>
			<th width='10%'> ��ȣ </th>
			<th width='20%'> ��ǰ </th>
			<th width='35%'> ��ǰ�� </th>
			<th width='15%'> ���� </th>
			<th width='10%'> ���� </th>
			<th width='10%'> ���� </th></tr>
	<%
		Database db = new Database();
		db.connection();
		
		if (code != null){
		price = Integer.parseInt(request.getParameter("price"))*Integer.parseInt(count)+"";
		String sql2 = "INSERT INTO cart (id,item,price,itemcount,pkcode,code)"
					+"values ('"+id+"','"+item+"','"+price+"','"+count+"',SEQ.NEXTVAL,'"+code+"')";
		db.insert(sql2);
		}
		
		String sql = "SELECT * FROM cart WHERE id='"+id+"'";
		ResultSet resultSet = db.select(sql);
			
		int i = 1; int sum = 0;
	
			while (resultSet.next()) {
			%>	
			<tr>
				<td> <%=i %></td>
				<td> <img src="_getImage.jsp?code=<%=resultSet.getString("code") %>" width="100" height="100">	</td>
				<td> <%=resultSet.getString("item") %> </td>
				<td> <%=resultSet.getInt("price") %> </td>
				<td> <%=resultSet.getInt("itemcount") %> </td>
				<td> <a href = "_delete.jsp?pkcode=<%=resultSet.getInt("pkcode") %>"> ���� </a> </td></tr>
		<%
		i++;
		sum = sum + resultSet.getInt("price");
		}
		db.connectionClose();
	%>
	 		<tr>
	 			<td colspan="6" align="right">
	 			<b>�� ��</b> : <%=sum %>�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			<input type="submit" value="�����ϱ�">
				<a href="Main.jsp"> ���ư��� </a> </td>
	</table>
</form>
</center>
</body>
</html>