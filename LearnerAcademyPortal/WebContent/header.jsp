

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    </head>
    <body>
        <div style="width:25%;">
            <h1 style="color:white;text-align:center;margin:0px">Learner's Academy !!!</h1>
        </div>
        <div style="width:60%;">
            <h3 style="color:white;text-align:center;margin:0px;">Welcome :<span style="color:orange;"><% out.println(session.getAttribute("username")); %></span></h3>
        </div>
    </body>
</html>
