<%@page import="java.sql.ResultSet"%>
<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%	// 1.로그인 폼에 사용자가 입력한 아이디/비밀번호
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 2.DB에서 조회한 아이디/비밀번호
		String dbId = "";
		String dbPw = "";
		
		Database db = new Database();
		db.connection();
		String sql = "SELECT id, password FROM people WHERE id='"+id+"'";
		ResultSet resultSet = db.select(sql);
		
			while (resultSet.next()) {
				dbId = resultSet.getString("ID");
				dbPw = resultSet.getString("PASSWORD");
			}
		
		db.connectionClose();
			
		// 3.회원이면 Session을 만들고, MAIN으로 이동하기
		if (id.equals(dbId) && pw.equals(dbPw)) {
			session.setAttribute("userSession", id);
			response.sendRedirect("Main.jsp");
		} else {
			out.println("<script> alert(\"회원 정보가 없습니다\"); history.back(); </script>");
		}
	%>
		
</body>
</html>