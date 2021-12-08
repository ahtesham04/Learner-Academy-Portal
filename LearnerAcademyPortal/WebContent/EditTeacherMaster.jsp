
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
String fn,ln,em,ph,ad,gn,ct;
%>
<%
int teacherid=Integer.parseInt(request.getParameter("tid"));
Connection con=DBConnection.dbCon();
PreparedStatement ps=con.prepareStatement("select * from  teachermaster where tid=?");
ps.setInt(1, teacherid);
ResultSet rs=ps.executeQuery();
if(rs.next()){
    fn=rs.getString(2);
    ln=rs.getString(3);
    em=rs.getString(4);
    ph=rs.getString(5);
    ad=rs.getString(6);
    gn=rs.getString(7);
    ct=rs.getString(8);
}

con.close();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class-Master Page</title>
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
                    <form action="editteacher" method="POST">
                     <table>
                         <tr>
                             <td>Teacher ID:</td><td><input style="background-color: lightgray" type="text" name="tid" value="<%= teacherid %>" readonly="" /></td>  
                         </tr>
                         <tr>
                             <td>FirstName:</td><td><input type="text" name="fname" value="<%= fn%>" placeholder="Firstname here.." required=""/></td>
                             <td>LastName:</td><td><input type="text" name="lname" value="<%= ln%>" placeholder="Lastname here.." required=""/></td>
                         </tr>
                         <tr>
                             <td>Email :</td><td><input type="email" name="email" value="<%= em%>" placeholder="example@abc.com" required=""/></td>
                             <td>Mobile:</td><td><input type="text" name="mobile" value="<%= ph%>" placeholder="Mobile no. here.." required="" maxlength="10"/></td>
                         </tr>
                         <tr>
                             <td>Gender:</td><td><input type="radio" name="gender" value="Male"/>Male <input type="radio" name="gender" value="Female"/>Female</td>
                             <td>SelectCity:</td>
                             <td><select name='city' style="width: 100%">
                                     <option value='select'>Select...</option>
                                     <option value='Delhi'>Delhi</option>
                                     <option value='Mumbai'>Mumbai</option>
                                     <option value='Bangalore'>Bangalore</option>
                                 </select>
                             </td>
                         </tr>
                         <tr>
                             <td>Address:</td>
                             <td colspan="3">
                                 <textarea name="address" placeholder="Address here..." required="" style="height: 100px;width:100%"><%= ad %></textarea>
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
        </main>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>

