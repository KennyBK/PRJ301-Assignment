<%-- 
    Document   : action_confirm
    Created on : Jul 16, 2022, 12:18:33 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var count = 3;
            function redirect()
            {
                count--;
                document.getElementById('timer').innerHTML = count;
                if (count <= 0)
                    window.location.href = 'Choose';
            }
            setInterval(redirect, 1000);
        </script>
    </head>
    <body>
        <h1>${requestScope.action} Attendance Successfully!</h1>
        <b>Redirect to Choose page after <span id="timer">3</span> seconds</b>
    </body>
</html>
