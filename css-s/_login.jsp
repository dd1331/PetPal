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

	<%	// 1.�α��� ���� ����ڰ� �Է��� ���̵�/��й�ȣ
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 2.DB���� ��ȸ�� ���̵�/��й�ȣ
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
			
		// 3.ȸ���̸� Session�� �����, MAIN���� �̵��ϱ�
		if (id.equals(dbId) && pw.equals(dbPw)) {
			session.setAttribute("userSession", id);
			response.sendRedirect("Main.jsp");
		} else {
			out.println("<script> alert(\"ȸ�� ������ �����ϴ�\"); history.back(); </script>");
		}
	%>
		
</body>
</html>