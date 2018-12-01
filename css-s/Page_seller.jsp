<%@page import="java.io.FileFilter"%>
<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./Style.css" type="text/css">
<link rel="stylesheet" href="./Style_login.css" type="text/css">
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
	</div><br/>
	
	<%
		int maxCode = 0;
		Database db = new Database();
		db.connection();
		String sql = "SELECT MAX(code) FROM item";
		ResultSet resultSet = db.select(sql);
		
			if (resultSet.next()){
				maxCode = resultSet.getInt(1);
			}
		db.connectionClose();
	%>
	<center>
		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<h6> Item Upload! </h6>
				</div>
				<div class="login-form">
					<form action="_upload.jsp" method = "post" enctype = "multipart/form-data">
						<div class="control-group">
							<input type="text" name="item" class="login-field" value=""
								placeholder="상품이름"> 
						</div>
						
						<div class="control-group">
							<input type="test" name="price" class="login-field" value=""
								placeholder="상품가격">
						</div>
												
						<div class="control-group">
							<input type="file" name="upload" class="login-field"
							>
						</div>
						
						<div class="control-group">
							<input type="text" name="code" class="login-field" value="<%=maxCode +1%>" readonly="readonly">
						</div>
						
						<input type="submit" value="Upload!"
							class="btn btn-primary btn-large btn-block">

						<a class="login-link" href="Main.jsp"> 돌아가기 </a>

					</form>
				</div>
			</div>
		</div>
	</center>
</body>
</html>