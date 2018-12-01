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
		<b> <%=name%>님 &nbsp; </b>

		<% if(name.equals("admin")) { %>
		<a href="Page_admin.jsp"> 관리자 </a> |	<%} %>		
		<% if(name.equals("seller")) { %>
		<a href="Page_seller.jsp"> 판매자 </a> |	<%} %>	
		<a href="_logout.jsp"> 로그아웃 </a>
		
	<h1 id="title"> WeMakethePrics </h1>
	</div><br/>

	
	<%
		Database db = new Database();
		db.connection();
		String sql = "SELECT * FROM item";
		ResultSet resultSet = db.select(sql);
		
			while(resultSet.next()) {
				int code = resultSet.getInt("code");
				String item = resultSet.getString("item");
				String price = resultSet.getString("price");
			%>
			<div class="box">
				<div class="image-box">
					<a href="Board.jsp?code=<%=code %>">
					<img src="_getImage.jsp?code=<%=code %>" width="300" height="300">
					</a>
				</div>

	<div class="box-underimage">
		<div class="box-itemname">
			 <%=item %>
		</div>
				 <div class="box-itemprice">
				 	<%=price %>원
				 </div>
				
				
				
				<form action="Cart.jsp" class="content-box">
					<input type="hidden" name="code" value="<%=code%>">
					<input type="hidden" name="item" value="<%=item%>">
					<input type="hidden" name="price" value="<%=price%>">
					<!-- 구매 <input type="checkbox" name="checked"> -->
					수량 <select name="count">
							<option> 1 </option>
							<option> 2 </option>
							<option> 3 </option>
						</select>
<!-- 					<input type="submit" value="구입하기" onclick="form.action='Cart.jsp';"> -->
					<input class="btn_submit" type="submit" value="구매하기">
				</form>
					</div>
			</div>		
			<%	}
			db.connectionClose();	%>	



</body>
</html>