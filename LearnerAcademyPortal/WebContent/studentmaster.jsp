
<%@page import="java.sql.PreparedStatement"%>
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
        <title>Student-Master Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <style>
            #left
		{
                    height:100%;
                    width:30%;
                    float:left;
		}
            #right
		{
                    height:100%;
                    width:62%;
                    float:right;
                    text-align: center;
                    border-radius: 8px;
		}
            table{
                background-color:#f7ee70;
                padding: 2px;
                border-radius: 4px;
            }
            input[type=text],input[type=number],input[type=email],input[type=date],select,textarea{
                height: 20px;
                width: 160px;
                font-size: 12px;
                font-family: verdana;
            }
            td{
                font-size: 10px;
                font-family: verdana;
            }
            tr{
            height: 50px;
            }
            .btn{
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
            <div style="margin: 10px;">
                <%--<h3><%= var %></h3>--%>
                <h2></h2>
                <div id="left">
                    <h2></h2>
                    <fieldset>
                        <legend>Add New Student Details :-</legend>
                    <form action="addstudent" method="POST">
                    <table>
                        <tr>
                            <td>First Name:</td><td><input type="text" name="fname" placeholder="Firstname here.." required=""/></td>
                            <td>Last Name:</td><td><input type="text" name="lname" placeholder="Lastname here.." required=""/></td>
                        </tr>
                        <tr>
                            <td>Father Name:</td><td><input type="text" name="fatname" placeholder="Father name here.." required=""/></td>
                            <td>Mother Name:</td><td><input type="text" name="motname" placeholder="Mother name here.." required=""/></td>
                        </tr>
                        <tr>
                            <td>D.O.B :</td><td><input type="date" name="dob" required=""/></td>
                            <td>Gender:</td><td><input type="radio" name="gender" value="Male"/>Male <input type="radio" name="gender" value="Female"/>Female</td>
                        </tr>
                        <tr>
                            <td>Mobile:</td><td><input type="number" name="mobile" placeholder="Mobile no. here.." required="" /></td>
                            <td>Email :</td><td><input type="email" name="email" placeholder="example@abc.com" required=""/></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td>
                                <textarea name="address" placeholder="Address here..." required="" style="height: 100px;width:auto"></textarea>
                            </td>
                            <td>Select Class:</td>
                            <td><select name='classnm' style="width: 100%">
                                    <option value='select'>Select...</option> 
                                        <% 
                                        Connection con2=DBConnection.dbCon();
                                        Statement st2=con2.createStatement();
                                        ResultSet rs2=st2.executeQuery("select * from classmaster");
                                        while(rs2.next()){
                                        %>
                                        <option value='<%= rs2.getInt(1) %>'><%= rs2.getString(2) %></option> 
                                        <%
                                        }
                                        con2.close();
                                        %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <input class="btn" type="reset" value="CANCEL"/>
                                <input class="btn" type="submit" value="SUBMIT"/> 
                            </td>
                        </tr>
                    </table>
                    </form>
                    </fieldset>
                </div>
                <div id="right">
                    <h2 style="margin:0px">Existing Student Details:-</h2>
                    <table border="1" width="100%">
                        <tr>
                            <td style="background-color: lightgray">ID</td>
                            <td style="background-color: lightgray">First Name</td>
                            <td style="background-color: lightgray">Last Name</td>
                            <td style="background-color: lightgray">Class</td>
                            <td style="background-color: lightgray">Father Name</td>
                            <td style="background-color: lightgray">Mother Name</td>
                            <td style="background-color: lightgray">D.O.B</td>
                            <td style="background-color: lightgray">Gender</td>
                            <td style="background-color: lightgray">Mobile</td>
                            <td style="background-color: lightgray">Email</td>
                            <td style="background-color: lightgray">Address</td>
                            <td style="background-color: lightgray">Edit</td>
                            <td style="background-color: lightgray">Delete</td>
                        </tr>
                        <% 
                            Connection con=DBConnection.dbCon();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from studentmaster");
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <%
                                Connection con1=DBConnection.dbCon();
                                PreparedStatement pst=con1.prepareStatement("select name from classmaster where cid=?");
                                pst.setInt(1,rs.getInt(11));
                                ResultSet rs1=pst.executeQuery();
                                rs1.next();
                            %>
                            <td><%= rs1.getString(1)%></td>
                            <%
                                rs1.close();
                                con1.close();
                            %>
                            <td><%= rs.getString(9) %></td> 
                            <td><%= rs.getString(10) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                            <td><a style="width:40px" href='EditStudentMaster.jsp?sid=<%= rs.getInt(1)%>'><img src='images/update.jpg' height='40' width='40' /></a></td>
                            <td><a style="width: 40px" href='deletestudent?sid=<%= rs.getInt(1)%>'><img src='images/delete.jpg' height='40' width='40' /></a></td>
                        </tr>
                        <%
                            }
                            con.close();
                        %>
                    </table>
              
                </div>
            </div>
        </main>
        <footer>
             <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>

