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
	// 세션 가져와서 이름 기억
	String name = session.getAttribute("userSession") + "";
	String code = request.getParameter("code");
%>

	<center>
		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<h6> Write here! </h6>
				</div>
				<div class="login-form">
					<form action="Board_insert.jsp">
					
						<div class="control-group">
							<input type="text" class="login-field" value="<%=name%>"
								placeholder="이름" id="write-name" name="name" readonly="readonly">
							<label class="login-field-icon fui-user" for="write-name"></label>
						</div>

						<div class="control-group">
							<input type="text" class="login-field" value="" placeholder="제목"
								id="write-title" name="title"> <label
								class="login-field-icon fui-user" for="write-title"></label>
						</div>

						<div class="control-group">

							<textarea rows="10" cols="32" class="login-field"
								placeholder="내용을 입력하세요!" id="write-contents" name="contents">
						</textarea>
							<label class="login-field-icon fui-user" for="write-contents"></label>
						</div>
						<input type="hidden" name="code" value=<%=code%>> <input
							type="submit" value="done!"
							class="btn btn-primary btn-large btn-block">
					</form>
				</div>
			</div>
		</div>

	</center>
</body>
</html>