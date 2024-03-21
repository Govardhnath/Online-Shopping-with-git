<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<style>
table, th, tr, td {
	border: 2px solid #633959;
	color: white;
}
body {
	background-image:
		url("https://cdn.pixabay.com/photo/2017/03/25/17/56/color-2174049_640.png");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	height: auto;
	width: auto;
}
    .button-49,
.button-49:after {
  width: 150px;
  height: 76px;
  line-height: 78px;
  font-size: 20px;
  font-family: 'Bebas Neue', sans-serif;
  background: linear-gradient(45deg, transparent 5%, #FF013C 5%);
  border: 0;
  color: #fff;
  letter-spacing: 3px;
  box-shadow: 6px 0px 0px #00E6F6;
  outline: transparent;
  position: relative;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-49:after {
  --slice-0: inset(50% 50% 50% 50%);
  --slice-1: inset(80% -6px 0 0);
  --slice-2: inset(50% -6px 30% 0);
  --slice-3: inset(10% -6px 85% 0);
  --slice-4: inset(40% -6px 43% 0);
  --slice-5: inset(80% -6px 5% 0);
  
  content: 'ALTERNATE TEXT';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(45deg, transparent 3%, #00E6F6 3%, #00E6F6 5%, #FF013C 5%);
  text-shadow: -3px -3px 0px #F8F005, 3px 3px 0px #00E6F6;
  clip-path: var(--slice-0);
}

.button-49:hover:after {
  animation: 1s glitch;
  animation-timing-function: steps(2, end);
}

@keyframes glitch {
  0% {
    clip-path: var(--slice-1);
    transform: translate(-20px, -10px);
  }
  10% {
    clip-path: var(--slice-3);
    transform: translate(10px, 10px);
  }
  20% {
    clip-path: var(--slice-1);
    transform: translate(-10px, 10px);
  }
  30% {
    clip-path: var(--slice-3);
    transform: translate(0px, 5px);
  }
  40% {
    clip-path: var(--slice-2);
    transform: translate(-5px, 0px);
  }
  50% {
    clip-path: var(--slice-3);
    transform: translate(5px, 0px);
  }
  60% {
    clip-path: var(--slice-4);
    transform: translate(5px, 10px);
  }
  70% {
    clip-path: var(--slice-2);
    transform: translate(-10px, 10px);
  }
  80% {
    clip-path: var(--slice-5);
    transform: translate(20px, -10px);
  }
  90% {
    clip-path: var(--slice-1);
    transform: translate(-10px, 0px);
  }
  100% {
    clip-path: var(--slice-1);
    transform: translate(0);
  }
}

@media (min-width: 768px) {
  .button-49,
  .button-49:after {
    width: 200px;
    height: 86px;
    line-height: 88px;
  }
}
.button-89 {
  --b: 3px;   /* border thickness */
  --s: .45em; /* size of the corner */
  --color: #373B44;
  
  padding: calc(.5em + var(--s)) calc(.9em + var(--s));
  color: var(--color);
  --_p: var(--s);
  background:
    conic-gradient(from 90deg at var(--b) var(--b),#0000 90deg,var(--color) 0)
    var(--_p) var(--_p)/calc(100% - var(--b) - 2*var(--_p)) calc(100% - var(--b) - 2*var(--_p));
  transition: .3s linear, color 0s, background-color 0s;
  outline: var(--b) solid #0000;
  outline-offset: .6em;
  font-size: 16px;

  border: 0;

  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-89:hover,
.button-89:focus-visible{
  --_p: 0px;
  outline-color: var(--color);
  outline-offset: .05em;
}

.button-89:active {
  background: var(--color);
  color: #fff;
}
 .button-52 {
  font-size: 16px;
  font-weight: 200;
  letter-spacing: 1px;
  padding: 13px 20px 13px;
  outline: 0;
  border: 1px solid black;
  cursor: pointer;
  position: relative;
  background-color: rgba(0, 0, 0, 0);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-52:after {
  content: "";
  background-color: #ffe54c;
  width: 100%;
  z-index: -1;
  position: absolute;
  height: 100%;
  top: 7px;
  left: 7px;
  transition: 0.2s;
}

.button-52:hover:after {
  top: 0px;
  left: 0px;
}

@media (min-width: 768px) {
  .button-52 {
    padding: 13px 50px 13px;
  }
}

	</style>

</head>
<body align="center">
	<%
	String uemail = (String) session.getAttribute("uemail");
	String usertype = (String) session.getAttribute("usertype");
	//out.println(lemail + " " + usertype);
	%>
	<table class="table table-sm table-dark" align="center">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>EMAIL</th>
			<th>PASSWORD</th>
			<th colspan="2">ACTIONS</th>
		</tr>
		<%
		if (usertype.equals("admin")) {
			try {
				String query = "select * from jspuser where uid<>1";
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
			<td><form action="USVIEW_UPD.jsp">
					<input type="hidden" name="uid" value="<%=rs.getInt(1)%>" readonly>
					<button class="btn btn-success">UPDATE</button>
				</form></td> <td><form action="UACTION_DEL.jsp">
			<input type="hidden" name="uid" value="<%=rs.getInt(1)%>" readonly>
			<button class="btn btn-danger">DELETE</button>
			</form>
			</td>
		</tr>
		<%
		id++;
		}
		} catch (Exception e) {
		out.println(e);
		}
		} else {
		try {
		String query = "select * from jspuser where uemail='" + uemail + "'";
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
			<td><form action="USVIEW_UPD.jsp">
					<input type="hidden" name="uid" value="<%=rs.getInt(1)%>" readonly>
					<button class="btn btn-success">UPDATE</button>
				</form></td>
			<td><td><form action="UACTION_DEL.jsp">
			<input type="hidden" name="uid" value="<%=rs.getInt(1)%>" readonly>
			<button class="btn btn-danger">DELETE</button>
			</form>
			</td>

		</tr>
		<%
		id++;
		}
		} catch (Exception e) {
		out.println(e);
		}
		}
		%>
	</table>
	
	<form action="HOME.jsp">
	 <button class="button-49" role="button" style="height:50px;width:150px; margin-left:0px; position:relative; left:-500px; top:200px;"><span style="font-size : 20px; width: 100%; height: 100px; position:relative; left:10px; top:-15px;  "><b>LOG OUT</b></span></button>
	
	</form>
	<% if (usertype.equals("admin")) { %> 
	<form action="Prdt_Insert.jsp">
	<button class="button-52" role="button" style="height:50px;width:150px; position:relative; left:-100px; top:0px; "><span style="font-size : 19px; width: 50px; height: 500px; position:relative; left:-10px; top:-5px;  "><b>PInsert</b></span></button>
	</form>
	<%} %>
	<form action="Prd_View.jsp">
	<button class="button-52" role="button" style="height:50px;width:150px; position:relative; left:300px; top:-50px; "><span style="font-size : 19px; width: 50px; height: 500px; position:relative; left:-10px; top:-5px;  "><b>PView</b></span></button>
	</form>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>