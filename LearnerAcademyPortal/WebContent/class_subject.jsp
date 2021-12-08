

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
        <title>Class-Subject-Master Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <style>
            #left{
                height:100%;
                width:40%;
                float:left;
                //padding: 20px;
            }
            #right{
                height:100%;
                width:50%;
                //background-color:lightgray;
                float:right;
                text-align: center;
                border-radius: 8px;
                //margin:10px;
                //padding: 20px;
            }
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
        <main>
            <div style="margin:20px;">
               <%--<h3><%= var %></h3>--%>
                <div id="left">
                    <h2></h2>
                    <fieldset>
                        <legend>Add assigned subject details :-</legend>
                    <form action="addclasssubject"><table align='center' >
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
                            <td style="width:180px">Select Subject:</td>
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
                            <td colspan="2"><input class="btn" type="submit" value='ASSIGN'/></td>
                        </tr>
                    </table>
                    </form>
                    </fieldset>
                </div>
                <div id="right">
                    <h2 style="margin:0px">Existing Assigned Class-Subject details:-</h2>
                    <table border="1" align="center" width="100%">
                        <tr>
                            <td style="background-color: lightgray">ID</td>
                            <td style="background-color: lightgray">Class Name</td>
                            <td style="background-color: lightgray">Subject Name</td>
                            <td style="background-color: lightgray">Edit</td>
                            <td style="background-color: lightgray">Delete</td>
                        </tr>
                        <% 
                            Connection con=DBConnection.dbCon();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from class_subject_master");
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <% 
                            Connection con4=DBConnection.dbCon();
                            PreparedStatement st4=con4.prepareStatement("select name from classmaster where cid=?");
                            st4.setInt(1, rs.getInt(2));
                            ResultSet rs4=st4.executeQuery();
                            rs4.next();
                            %>
                            <td><%= rs4.getString(1) %></td>
                            
                            <% 
                            Connection con5=DBConnection.dbCon();
                            PreparedStatement st5=con5.prepareStatement("select sname from subjectmaster where sub_id=?");
                            st5.setInt(1, rs.getInt(3));
                            ResultSet rs5=st5.executeQuery();
                            rs5.next();
                            %>
                            <td><%= rs5.getString(1) %></td>
                            <td><a href='EditClassSubject.jsp?cls_sub_id=<%= rs.getInt(1)%>'><img src='images/update.jpg' height='40' width='40' /></a></td>
                            <td><a href='deleteclasssubject?cls_sub_id=<%= rs.getInt(1)%>'><img src='images/delete.jpg' height='40' width='40' /></a></td>
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

