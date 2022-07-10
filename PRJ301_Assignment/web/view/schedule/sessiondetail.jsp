<%-- 
    Document   : sessiondetail
    Created on : Jun 29, 2022, 6:44:28 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> 

    </head>
    <body>
        <div class="container">
            <div>Date: ${requestScope.session.sessionDate} </div>
            <div>Slot: ${requestScope.session.timeslotID.start} - ${requestScope.session.timeslotID.end} </div>
            <div>Room: ${requestScope.session.roomID.roomID} </div>
            <div>Group: ${requestScope.session.groupID.groupID} </div>
            <div>Instructor: ${requestScope.session.instructorID.instructorID} </div>
            <div>Course: ${requestScope.session.groupID.courseID.courseID} </div>
            <div>Course session number: ${requestScope.session.sessionNumber} </div>
        </div>
    </body>
</html>
