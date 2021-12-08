
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
String subjectname;
%>
<%
int clssubid=Integer.parseInt(request.getParameter("cls_sub_id"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class-Subject-Master Page</title>
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
                    <form action="editclasssubject" method='POST'>
                        <table>
                            <tr>
                                <td style="width:180px">Sub_Teacher_ID</td>
                                <td><input style="background-color: lightgray" type='text' name='cls_sub_id' value='<%= clssubid %>' readonly=""/></td>
                            </tr>
                            <tr>
                                <td style="width:180px">Select class:</td>
                                <td>
                                    <select name='classname'>
                                    <option value='select'>Select...</option> 
                                    <% 
                                    Connection con1=DBConnection.dbCon();
                                    Statement st1=con1.createStatement();
                                    ResultSet rs1=st1.executeQuery("select * from classmaster");
                                    while(rs1.next()){
                                    %>
                                    <option value='<%= rs1.getInt(1) %>'><%= rs1.getString(2) %></option> 
                                    <%
                                    }
                                    con1.close();
                                    %>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Select Subject:</td>
                                <td>
                                    <select name='subjectname'>
                                        <option value='select'>Select...</option> 
                                        <% 
                                        Connection con2=DBConnection.dbCon();
                                        Statement st2=con2.createStatement();
                                        ResultSet rs2=st2.executeQuery("select * from subjectmaster");
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
                                <td colspan="2"><input class='btn' type="submit" value='Update'/></td>
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

