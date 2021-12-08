

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
        <title>Subject-Master Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <style>
            #left
            {
                height:100%;
                width:40%;
                //background-color:lightgray;
                float:left;
                border-radius: 8px;
            }

            #right
            {
                height:100%;
                width:50%;
                //background-color:lightgray;
                float:right;
                text-align: center;
                border-radius: 8px;
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
                        <legend>Add New Subject Details :-</legend>
                    <form action="addsubject">
                        <table align='center' >
                        <tr>
                            <td style="width:180px">Enter subject name:</td>
                            <td><input type="text" name="subjectname" placeholder="Enter subject name here" required=""/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="btn" type="submit" value='ADD'/></td>
                        </tr>
                        </table>
                    </form>
                    </fieldset>
                </div>
                <div id="right">
                    <h2 style="margin:0px">Existing Subject Details:-</h2>
                    <table border="1" align="center" width="100%">
                        <tr>
                            <td style="background-color: lightgray">ID</td>
                            <td style="background-color: lightgray">NAME</td>
                            <td style="background-color: lightgray">Edit</td>
                            <td style="background-color: lightgray">Delete</td>
                        </tr>
                        <% 
                            Connection con=DBConnection.dbCon();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from subjectmaster");
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><a href='EditSubjectMaster.jsp?sid=<%= rs.getInt(1)%>'><img src='images/update.jpg' height='40' width='40' /></a></td>
                            <td><a href='deletesubject?sid=<%= rs.getInt(1)%>'><img src='images/delete.jpg' height='40' width='40' /></a></td>
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

