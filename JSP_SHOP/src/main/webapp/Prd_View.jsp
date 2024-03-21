<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
html, body {
	height: 100%;
	background-image:
		url("https://images.unsplash.com/photo-1513884923967-4b182ef167ab?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fHNob3BwaW5nfGVufDB8fDB8fHww")
			
}

body {
	margin: 0;
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #fff;
}

th {
	text-align: left;
}

thead {th { background-color:#55608f;
	
}

}
tbody {tr { &:hover {
			background-color : rgba(255, 255, 255, 0.3);
	
}

}
td {
	position: relative; &: hover { & : before { 
				 content : "";
	position: absolute;
	left: 0;
	right: 0;
	top: -9999px;
	bottom: -9999px;
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}
}
}
}
img{
width:150px;
height:100px;
}
tr, td{
background-color:black;
}
</style>
</head>

<body>
	<%
	String usertype = (String) session.getAttribute("usertype");
	%>

	<div class="container">
		<table>
			<thead>
				<tr>
					<th>PID</th>
					<th>PNAME</th>
					<th>PQNTY</th>
					<th>PPRICE</th>
					<th>PCATGRY</th>
					<th>PIMG</th>
					<th colspan="2">ACTIONS</th>
				</tr>
				<%
				try {
					String query = "select * from jspprdt";
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advanced", "root", "");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
					int id = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=id%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><img src="<%=rs.getString(6)%>"></td>
					<%
					if (usertype.equals("admin")) {
					%>
					<td><form action="View_UPD_Prdt.jsp">
					<input type="hidden" name="pid" value="<%=rs.getInt(1)%>" readonly>
					<button class="btn btn-success">UPDATE</button>
				</form></td>
					<td class="tha">
						<form action="Act_Prd_Del.jsp">
							<input type="hidden" name="pid" value="<%=rs.getInt(1)%>"
								readonly>
							<button type="submit" class="btn btn-danger">DELETE</button>
						</form>
					</td>
					<%
					} else {
					%>
					<td class="tha">
						<form action="actCart.jsp">
							<button type="submit" class="btn btn-warning">Add To
								Cart</button>
						</form>
					</td>

					<%
					}
					%>


				</tr>
				
				<%
				id++;
				}
				} catch (Exception e) {
				out.println(e);
				}
				%>

			</thead>

		</table>
		<form action="VIEW.jsp">
	<button class="button-52" role="button" style="height:50px;width:150px; position:relative; left:300px; top:50px; "><span style="font-size : 19px; width: 50px; height: 500px; position:relative; left:-10px; top:-5px;  "><b>PView</b></span></button>
	</form>
		
	</div>
</body>

</html>