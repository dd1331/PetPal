<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./Style_login.css" type="text/css">
<link rel="stylesheet" href="./Style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="helloId">
	<h1 id="title"> WeMakethePrics </h1>
	</div><br/>
<%
	// ���� �����ͼ� �̸� ���
	String name = session.getAttribute("userSession") + "";
	String code = request.getParameter("code");
%>

<body>
	<center>
		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<h6> Modify! </h6>
				</div>
				<div class="login-form">
					<form action="Board_update.jsp">
					<input type="hidden" name="code" value="<%=code %>">
						�� ��ȣ
						<div class="control-group">
							<input type="text" class="login-field"
								value="<%=request.getParameter("num")%>" readonly="readonly"
								name="num">
						</div>
						�� ����
						<div class="control-group">
							<input type="text" class="login-field"
								value="<%=request.getParameter("title")%>" name="title">
						</div>
						�� ����
						<div class="control-group">
							<input type="text" class="login-field"
								value="<%=request.getParameter("contents")%>" name="contents">
						</div>
						�� ��
						<div class="control-group">
							<input type="text" class="login-field"
								value="<%=request.getParameter("name")%>" name="name">
						</div>
						�� ¥
						<div class="control-group">
							<input type="text" class="login-field"
								value="<%=request.getParameter("dates")%>" name="dates"
								readonly="readonly">
						</div>

						<input type="submit" value="done!"
							class="btn btn-primary btn-large btn-block">
					</form>
				</div>
			</div>
		</div>
	</center>
</body>

</html>