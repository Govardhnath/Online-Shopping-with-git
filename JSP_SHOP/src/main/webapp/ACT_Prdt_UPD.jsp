<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Action Product Update</title>
</head>
<body>
<%
try {
    int pid = Integer.parseInt(request.getParameter("pid"));
    String pname = request.getParameter("pname");
    int pqty = Integer.parseInt(request.getParameter("pqty"));
    int pprice = Integer.parseInt(request.getParameter("pprice"));
    String pcat = request.getParameter("pcat");
    String pimg = request.getParameter("pimg");
    
    

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advanced", "root", "");

    String query = "UPDATE jspprdt SET pname=?, pqty=?, pprice=?, pcat=?, pimg=? WHERE pid=?";
    PreparedStatement ps = con.prepareStatement(query);
    
    ps.setString(1, pname);
    ps.setInt(2, pqty);
    ps.setInt(3, pprice);
    ps.setString(4, pcat);
    ps.setString(5, pimg);
    ps.setInt(6, pid);

    int i = ps.executeUpdate();
    if (i != 0) {
        response.sendRedirect("Prd_View.jsp");
    }

} catch (Exception e) {
    out.println(e);
}
%>

</body>
</html>
