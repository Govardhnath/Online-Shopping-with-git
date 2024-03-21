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
	int uid = Integer.parseInt(request.getParameter("uid"));
	String uname = request.getParameter("uname");
	String uemail = request.getParameter("uemail");
	String upassword = request.getParameter("upassword");
	String usertype = request.getParameter("usertype");
	try {
		//'' varchar, date
		// 123
		String query = "update jspuser set  uname='" + uname + "', uemail='" + uemail + "', upassword='" + upassword + "' where uid=" + uid + ";";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advanced", "root", "");
		PreparedStatement ps = con.prepareStatement(query);
		
		int i = ps.executeUpdate();
		if (i != 0) {
			if (usertype.equals("admin")) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("uemail", uemail);
				response.sendRedirect("VIEW.jsp");
			} else {
				session.setAttribute("usertype", usertype);
				session.setAttribute("uemail", uemail);
				response.sendRedirect("VIEW.jsp");
			}
		}
			} catch (Exception e) {
		out.println(e);
			}
	%>
</body>
</html>