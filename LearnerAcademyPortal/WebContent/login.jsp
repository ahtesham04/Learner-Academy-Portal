
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<a href="WEB-INF/web.xml"></a>
<%! String var=""; %>
<%
   Object obj=null;
   obj=session.getAttribute("errmsg");
   if(obj != null)
       var=(String)obj; 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LearnerAcademy: Admin Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <section class="container">
            <div class="login"> 
                <h1>Admin Login !!!</h1>
                <form action="adminlogin" method="POST">
                    <h4 style="color:red"><%= var %></h4>
                    <p><input type="text" name="uname" placeholder="Username or Email" required=""/></p>
                    <p><input type="password" name="pass" placeholder="Password" required=""></p>
                    <p class="submit"><input type="submit" name="commit" value="Login"></p>
                </form>
               
            </div>
        </section>
    </body>
</html>
