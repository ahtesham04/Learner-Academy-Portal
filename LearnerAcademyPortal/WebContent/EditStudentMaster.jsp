
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%! String var=""; %>
<%
   Object obj=null;
   obj=session.getAttribute("msg1");
   if(obj != null)
       var=(String)obj; 
%>
--%>
<%!
String fn,ln,db,em,ad,gn,ftnm,mtnm,ct;
long ph=0;
%>
<%
int sid=Integer.parseInt(request.getParameter("sid"));
Connection con=DBConnection.dbCon();
PreparedStatement ps=con.prepareStatement("select * from  studentmaster where sid=?");
ps.setInt(1, sid);
ResultSet rs=ps.executeQuery();
if(rs.next()){
    fn=rs.getString(2);
    ln=rs.getString(3);
    db=rs.getString(4);
    gn=rs.getString(5);
    ph=rs.getLong(6);
    em=rs.getString(7);
    ad=rs.getString(8);
    ftnm=rs.getString(9);
    mtnm=rs.getString(10);
}

con.close();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student-Master Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <style>
            input[type=text],input[type=number],input[type=email],select,textarea{
                height: 24px;
                width: 240px;
                font-size: 14px;
                font-family: verdana;
            }
            .btn{
               float: right;
               margin-left: 20px;
               font-size: 18px;
               padding: 4px 10px;
               background-color: cyan;
               border-radius: 0px;
            }
            table{
                background-color:#f7ee70;
                padding: 20px;
                border-radius: 4px;
            }
            td{
                font-size: 16px;
                font-family: verdana;
            }
            tr{
                height: 50px;
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
        <main class='maincontainer'>
            <div class="center">
                <fieldset>
                    <legend style="color:whitesmoke">Add Updated Class Details :-</legend>
                    <form action="editstudent" method="POST">
                     <table>
                         <tr>
                             <td>Student ID:</td><td><input style="background-color: lightgray" type="text" name="sid" value="<%= sid %>" readonly="" /></td>  
                         </tr>
                         <tr>
                             <td>First Name:</td><td><input type="text" name="fname" value="<%= fn%>" required=""/></td>
                            <td>Last Name:</td><td><input type="text" name="lname" value="<%= ln%>" required=""/></td>
                        </tr>
                        <tr>
                            <td>Father Name:</td><td><input type="text" name="fatname" value="<%= ftnm %>" required=""/></td>
                            <td>Mother Name:</td><td><input type="text" name="motname" value="<%= mtnm %>" required=""/></td>
                        </tr>
                        <tr>
                            <td>D.O.B :</td><td><input type="date" name="dob" required=""/></td>
                            <td>Gender:</td><td><input type="radio" name="gender" value="Male"/>Male <input type="radio" name="gender" value="Female"/>Female</td>
                        </tr>
                        <tr>
                            <td>Mobile:</td><td><input type="number" name="mobile" required="" /></td>
                            <td>Email :</td><td><input type="email" name="email" value="<%= em %>" required=""/></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td>
                                <textarea name="address" required="" style="height: 100px;width:auto"><%= ad%></textarea>
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
                                <input class="btn" type="submit" value="UPDATE"/> 
                            </td>
                        </tr>
                    </table>
                    </form>
                </fieldset>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>

