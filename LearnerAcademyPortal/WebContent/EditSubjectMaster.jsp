
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
int subjectid=Integer.parseInt(request.getParameter("sid"));
Connection con=DBConnection.dbCon();
PreparedStatement ps=con.prepareStatement("select * from  subjectmaster where sub_id=?");
ps.setInt(1, subjectid);
ResultSet rs=ps.executeQuery();
if(rs.next()){
    subjectname=rs.getString(2);
}

con.close();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject-Master Page</title>
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
                    <form action="editsubject" method="post">
                        <table>
                            <tr>
                                <td style="width:180px">Subject ID :</td>
                                <td><input style="background-color: lightgray" type="text" name="subid" value='<%= subjectid %>' readonly="" /></td>
                            </tr>
                            <tr>
                                <td style="width:180px">Enter updated class name:</td>
                                <td><input type="text" name="subname" value='<%= subjectname %>' required=""/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input class='btn' type="submit" value='UPDATE'/></td>
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

