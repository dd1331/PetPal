<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert</title>
</head>
<body>

	<%
		Database db = new Database();
		db.connection();
		String code = request.getParameter("code");
		
		if (request.getParameter("name") != null) {
			String reqName = request.getParameter("name");
			String reqTitle = request.getParameter("title");
			String reqContents = request.getParameter("contents");
			Calendar cal = Calendar.getInstance();
				SimpleDateFormat cal_format = new SimpleDateFormat("yyyy-MM-dd");
			String reqDate = cal_format.format(cal.getTime());
		
			String sql = "INSERT into BOARD (num, title, contents, name, dates, code)"
					+"values (SEQ.NEXTVAL,'"+reqTitle+"','"+reqContents+"', '"+reqName+"','"+reqDate+"','"+code+"')";
			db.insert(sql);
		}
		db.connectionClose();
		response.sendRedirect("Board.jsp?code="+code);
	%>

</body>
</html>