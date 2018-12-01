<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
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

<center>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h6> Please login here </h6>
			</div>

			<div class="login-form">
				<form action="_login.jsp">
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="username" name="id">
				</div>

				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" name="pw">
				</div>

				<input type="submit" value="LOGIN" class="btn btn-primary btn-large btn-block">
				<a class="login-link" href="Register.jsp"> 회원가입 </a>
				</form>	
			</div>
		</div>
	</div>
</center>
</body>
</html>