<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Product Insert</title>
</head>
<body>
<%
try{
	String pname= request.getParameter("pname");
	int pqty = Integer.parseInt(request.getParameter("pqty"));
	int pprice = Integer.parseInt(request.getParameter("pprice"));
	String pcat= request.getParameter("pcat");
	String pimg= request.getParameter("pimg");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advanced","root","");
	String query = "INSERT INTO jspprdt (pname, pqty, pprice, pcat, pimg) VALUES ('" + pname + "', " + pqty + ", " + pprice + ", '" + pcat + "', '" + pimg + "')";
    PreparedStatement ps= con.prepareStatement(query);
    int i=ps.executeUpdate();
    if(i!=0){
    	response.sendRedirect("Prd_View.jsp");
    }

}catch(Exception e){
	out.println(e);
}
%>

</body>
</html>