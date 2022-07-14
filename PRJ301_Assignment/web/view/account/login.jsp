<%-- 
    Document   : login
    Created on : Jul 15, 2022, 12:22:44 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function logout(){
                window.location.href = 'logout';
            }
        </script>
    </head>
    <body>
        <form action="login" method="POST">
            Username:<input type="text" name="user"/> <br/>
            Password: <input type="password" name ="pass" /> <br/>
            <input type="submit" value="Login"/>
            <input type="button" value="Logout" onclick="logout()"/>
        </form>
    </body>
</html>
