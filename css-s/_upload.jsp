<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.Database"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		// submit���� input file��  ��θ� �޾ƿ� ���� ����(fakepath ����)
		// �׷��� oreilly�� cos ���̺귯�� http://www.servlets.com/cos/  �� cos-26Dec2008.zip�� �ٿ�ް�
		// ŽĹ\lib ������ �����Ͽ� �ӽ������� �� ������ ���ε� �Ѵ�.

		String savePath = "D:\\temp";
		int sizeLimit = 5 * 1024 * 1024;

		MultipartRequest mr = new MultipartRequest(request, savePath, sizeLimit, "euc-kr",
				new DefaultFileRenamePolicy());

		File file = mr.getFile("upload");
		String path = file.getPath();
		// ������� �ӽ÷� temp ������ �����ؼ� path�� ��θ� �޾Ƶ�
	%>


	<%
		Database db = new Database();
		db.connection();
		String sql ="INSERT INTO item (item, price, image, code) values "
				+"('"+mr.getParameter("item")+"','"+mr.getParameter("price")+"'"
				+",empty_blob(),'"+mr.getParameter("code")+"')";
		
		db.insert(sql);
		// �̹����� ���� ���ε�

		ResultSet resultSet = db.select("SELECT image FROM item where code='"+Integer.parseInt(mr.getParameter("code"))+"' FOR UPDATE");
		while (resultSet.next()) {
			Blob blob = resultSet.getBlob(1);
			OutputStream os = blob.setBinaryStream(1);
			FileInputStream fis = null;
			fis = new FileInputStream(path);
			byte[] data = new byte[1];
			int i;
			while ((i = fis.read(data)) != -1) {
				os.write(data, 0, i);
			}
			fis.close();
			os.close();
			break;
		}
		db.connectionClose();
		response.sendRedirect("Main.jsp");
	%>


</body>
</html>