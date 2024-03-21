<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Login</title>
</head>
<body>
	<%
	try {
		String uemail = request.getParameter("uemail");
		String upassword = request.getParameter("upassword");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advanced", "root", "");
		String query = "SELECT * FROM jspuser WHERE uemail='" + uemail + "' AND upassword='" + upassword + "'";
		Statement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
			session.setAttribute("usertype", rs.getString(4));
			session.setAttribute("uemail",uemail);
			response.sendRedirect("VIEW.jsp");
		}
	} catch (Exception e) {
		out.println(e);
	}
	%>

</body>
</html>