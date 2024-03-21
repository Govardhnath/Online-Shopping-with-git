<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
	String uname = request.getParameter("uname");
	String uemail = request.getParameter("uemail");
	String upassword = request.getParameter("upassword");
	Class.forName("com.mysql.cj.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advanced", "root", "");

	String query = "insert into jspuser(uname, uemail, upassword) values('" + uname + "', '" + uemail + "', '" + upassword + "');";
		
			PreparedStatement ps = con.prepareStatement(query);
		int i = ps.executeUpdate();
		if (i != 0) {
			response.sendRedirect("HOME.jsp");
		}
	} catch (Exception e) {
		out.println(e);
	}
	%>
</body>
</html>