

<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <title>Report-Master-Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <style>
            #left
            {
                height:100%;
                width:34%;
                //background-color:lightgray;
                float:left;
                padding: 20px;
                border-radius: 8px;
            }

            #right
            {
                height:100%;
                width:60%;
                //background-color:lightgray;
                float:right;
                text-align: center;
                border-radius: 8px;
                //margin:10px;
                padding: 20px;
            }      
            input[type=text],input[type=number],input[type=email],select,textarea{
                height: 24px;
                width: 180px;
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
                padding: 2px;
                border-radius: 4px;
            }
            td{
                font-size: 12px;
                font-family: verdana;
            }
            tr{
                height: 40px;
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
        <main style="">
            <div style="margin: 10px 0px">
                <form action="reportmaster.jsp">
                        <table align='center'>
                        <tr>
                            <td style="width:140px">Select class:</td>
                            <td>
                                <select name='classnm'>
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
                            <td colspan="2"><input class="btn" type="submit" value='SEARCH'/></td>
                        </tr>
                        </table>
                </form>
            </div>
            <%
              String cid1=null;
              cid1=request.getParameter("classnm");
              int cid=0;
              if(cid1 != null){
                  if(cid1.equals("select")){}
                  else{
                  cid=Integer.parseInt(cid1);
            %>
            <div style="margin:10px;display:inline-block;width: 100%">
                <%--<h3><%= var %></h3>--%>
                <div id="left">
                   <h2 style="margin:0px">Existing Class Details:-</h2>
                    <table border="1" align="center" width="100%">
                        <tr>
                            <td style="background-color: lightgray;font-weight: bolder">Subject</td>
                            <td style="background-color: lightgray;font-weight: bolder">Teacher Name</td>
                        </tr>
                        <% 
                            Connection con1=DBConnection.dbCon();
                            PreparedStatement pst1=con1.prepareStatement("select sub_id from class_subject_master where cid=?");
                            pst1.setInt(1, cid);
                            ResultSet rs1=pst1.executeQuery();
                            while(rs1.next()){
                                PreparedStatement pst2=con1.prepareStatement("select sname from subjectmaster where sub_id=?");
                                pst2.setInt(1, rs1.getInt(1));
                                ResultSet rss2=pst2.executeQuery();
                                rss2.next();
                        %>
                        <tr>
                            <td><%= rss2.getString(1) %></td>
                       
                        <%
                            try{
                            PreparedStatement pst3=con1.prepareStatement("select firstname,lastname from teachermaster where tid=(select tid from class_sub_teacher_master where sub_id=? and cid=?)");
                            pst3.setInt(1, rs1.getInt(1));
                            pst3.setInt(2, cid);
                            ResultSet rss3=pst3.executeQuery();
                            rss3.next();
                        %>
                        
                            <td><%= rss3.getString(1)+" "+rss3.getString(2)%></td>
                        </tr>
                        <%
                            }catch(Exception e){}
                            }
                        %>
                    </table>
                </div>
                <div id="right">
                    <h2 style="margin:0px">Student Details:-</h2>
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
                        </tr>
                        <% 
                            Connection con=DBConnection.dbCon();
                            PreparedStatement pst=con.prepareStatement("select * from studentmaster where cid=?");
                            pst.setInt(1, cid);
                            ResultSet rs=pst.executeQuery();
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <%
                                Connection con3=DBConnection.dbCon();
                                PreparedStatement pst3=con3.prepareStatement("select name from classmaster where cid=?");
                                pst3.setInt(1,cid);
                                ResultSet rs3=pst3.executeQuery();
                                rs3.next();
                            %>
                            <td><%= rs3.getString(1)%></td>
                            <%
                                rs3.close();
                                con3.close();
                            %>
                            <td><%= rs.getString(9) %></td> 
                            <td><%= rs.getString(10) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                        </tr>
                        <%
                            }
                            con.close();
                        %>
                    </table>
                </div>
            </div>
            <%
                  }
              }
            %>
        </main>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>
