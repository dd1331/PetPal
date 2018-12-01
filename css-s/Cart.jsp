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
		<%	// 세션 가져와서 이름 띄우기
		String name = session.getAttribute("userSession") + "";
		%>
		<a href="Main.jsp" style="float:left;"> HOME </a>
		<b><%=name%>님 &nbsp;</b>

			<%	if(name.equals("admin")) { %>
		<a href="Page_admin.jsp"> 관리자 </a> |	<%} %>		
		<%	if(name.equals("seller")) { %>
		<a href="Page_seller.jsp"> 판매자 </a> |	<%} %>	
		<a href="_logout.jsp"> 로그아웃 </a>
		
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
			<th width='10%'> 번호 </th>
			<th width='20%'> 상품 </th>
			<th width='35%'> 상품명 </th>
			<th width='15%'> 가격 </th>
			<th width='10%'> 개수 </th>
			<th width='10%'> 삭제 </th></tr>
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
				<td> <a href = "_delete.jsp?pkcode=<%=resultSet.getInt("pkcode") %>"> 삭제 </a> </td></tr>
		<%
		i++;
		sum = sum + resultSet.getInt("price");
		}
		db.connectionClose();
	%>
	 		<tr>
	 			<td colspan="6" align="right">
	 			<b>합 계</b> : <%=sum %>원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			<input type="submit" value="구입하기">
				<a href="Main.jsp"> 돌아가기 </a> </td>
	</table>
</form>
</center>
</body>
</html>