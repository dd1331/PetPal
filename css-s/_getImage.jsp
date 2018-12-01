<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.Database"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String code = request.getParameter("code");
	
		Database db = new Database();
		db.connection();
		String sql = "SELECT image FROM item WHERE code = '"+code+"'";
		ResultSet resultSet = db.select(sql); 

// 꺼내오기		
		Blob image = null;
		byte[ ] imgData = null ;

	try {
		while (resultSet.next()) {
			image = resultSet.getBlob(1);
			imgData = image.getBytes(1,(int)image.length());
		}
// display the image
		response.setContentType("image/gif");
		out.clear();
		out=pageContext.pushBody();
		OutputStream os = response.getOutputStream();
		os.write(imgData);
		os.flush();
		os.close();

	} catch (Exception e) {
		e.printStackTrace();
		return;

	} finally {
	try {
		resultSet.close();
		db.connectionClose();
			} catch (SQLException e) {
			e.printStackTrace();
			}
}
%>

</body>
</html>