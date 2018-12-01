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
		
	<h1 id="title"> WeMakethePrics </h1>
	
	<a href = 'Page_admin.jsp'> 매출액 보기 </a> |
	<a href = 'Page_admin2.jsp'> 회원 현황 </a>
	</div><br/>
	

<center>
	
	<table width='650' border='1'>
		<tr>
			<th width='10%'> No </th>
			<th width='20%'> 구매자 </th>
			<th width='10%'> 상 품 </th>
			<th width='40%'> 상품명 </th>
			<th width='10%'> 개 수 </th>
			<th width='10%'> 가 격 </th></tr>
	<%
		Database db = new Database();
		db.connection();
				
		String sql = "SELECT * FROM people_buy";
		ResultSet resultSet = db.select(sql);
			
		int i = 1; int sum = 0;
	
			while (resultSet.next()) {
			%>	
			<tr>
				<td> <%=i %>
				<td> <%=resultSet.getString("id") %></td>
				<td> <img src="_getImage.jsp?code=<%=resultSet.getString("code") %>" width="50" height="50">	</td>
				<td> <%=resultSet.getString("item") %> </td>
				<td> <%=resultSet.getInt("itemcount") %> </td>
				<td> <%=resultSet.getInt("price") %> </td>
				</tr>
		<%
		i++;
		sum = sum + resultSet.getInt("price");
		}
		db.connectionClose();
	%>
	 		<tr>
	 			<td colspan="6" align="right">
	 			<b>총 매출액</b> : <%=sum %>원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			<b>순 매출액</b> : <%=sum*0.9 %>원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="Main.jsp"> 돌아가기 </a> </td>
	</table>
</center>
</body>
</html>