

<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String var=""; %>
<%
   Object obj=null;
   obj=session.getAttribute("msg1");
   if(obj != null)
       var=(String)obj; 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teacher-Master Page</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<style>
#left {
	height: 100%;
	width: 40%; //
	background-color: lightgray;
	float: left;
}

#right {
	height: 100%;
	width: 50%;
	float: right;
	text-align: center;
	border-radius: 8px;
}

table {
	background-color: #f7ee70;
	padding: 2px;
	border-radius: 4px;
}

input[type=text], input[type=number], input[type=email], select,
	textarea {
	height: 22px;
	width: 200px;
	font-size: 14px;
	font-family: verdana;
}

td {
	font-size: 12px;
	font-family: verdana;
}

tr {
	height: 50px;
}

.btn {
	float: right;
	margin-left: 20px;
	font-size: 18px;
	padding: 4px 10px;
	background-color: cyan;
	border-radius: 0px;
}
</style>
</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>
	<nav>
		<%@include file="nav.jsp"%>
	</nav>
	<main>
		<div style="margin: 20px;">
			<%--<h3><%= var %></h3>--%>
			<h2></h2>
			<div id="left">
				<h2></h2>
				<fieldset>
					<legend>Add New Teacher Details :-</legend>
					<form action="addteacher" method="POST">
						<table align='center'>
							<tr>
								<td>FirstName:</td>
								<td><input type="text" name="fname"
									placeholder="Firstname here.." required="" /></td>
								<td>LastName:</td>
								<td><input type="text" name="lname"
									placeholder="Lastname here.." required="" /></td>
							</tr>
							<tr>
								<td>Email :</td>
								<td><input type="email" name="email"
									placeholder="example@abc.com" required="" /></td>
								<td>Mobile:</td>
								<td><input type="text" name="mobile"
									placeholder="Mobile no. here.." required="" maxlength="10" /></td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td><input type="radio" name="gender" value="Male" />Male <input
									type="radio" name="gender" value="Female" />Female</td>
								<td>SelectCity:</td>
								<td><select name='city' style="width: 100%">
										<option value='select'>Select...</option>
										<option value='Delhi'>Delhi</option>
										<option value='Mumbai'>Mumbai</option>
										<option value='Bangalore'>Bangalore</option>
								</select></td>
							</tr>
							<tr>
								<td>Address:</td>
								<td colspan="3"><textarea name="address"
										placeholder="Address here..." required=""
										style="height: 100px; width: auto"></textarea></td>
							</tr>
							<tr>
								<td colspan="4"><input class="btn" type="reset"
									value="CANCEL" /> <input class="btn" type="submit"
									value="SUBMIT" /></td>
							</tr>
						</table>
					</form>
				</fieldset>
			</div>
			<div id="right">
				<h2 style="margin: 0px">Existing Teacher Details:-</h2>
				<table border="1" align="center" width="100%">
					<tr>
						<td style="background-color: lightgray">ID</td>
						<td style="background-color: lightgray">FNAME</td>
						<td style="background-color: lightgray">LNAME</td>
						<td style="background-color: lightgray">EMAIL</td>
						<td style="background-color: lightgray">MOBILE</td>
						<td style="background-color: lightgray">ADDRESS</td>
						<td style="background-color: lightgray">GENDER</td>
						<td style="background-color: lightgray">CITY</td>
						<td style="background-color: lightgray">Edit</td>
						<td style="background-color: lightgray">Delete</td>
					</tr>
					<% 
                            Connection con=DBConnection.dbCon();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from teachermaster");
                            while(rs.next()){
                        %>
					<tr>
						<td><%= rs.getInt(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
						<td><%= rs.getString(8) %></td>
						<td><a style="width: 40px"
							href='EditTeacherMaster.jsp?tid=<%= rs.getInt(1)%>'><img
								src='images/update.jpg' height='40' width='40' /></a></td>
						<td><a style="width: 40px"
							href='deleteteacher?tid=<%= rs.getInt(1)%>'><img
								src='images/delete.jpg' height='40' width='40' /></a></td>
					</tr>
					<%
                            }
                            con.close();
                        %>
				</table>
				<%
                        
                    %>
			</div>
		</div>
	</main>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>

