<%-- 
    Document   : welcome
    Created on : Jul 16, 2022, 10:00:54 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Welcome</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> 
        <style>
            body{
                background-color: white;
            }

            .container{
                position: fixed;
                top: 0;
                left: 0;
                background-color: orange;
                width: 100vw;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                pointer-events: none;
            }


            .choose{
                position: fixed;
                top: 40%;
                right: 9%;
            }

            .w3-jumbo{
                text-transform: uppercase;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="box text-center ">
                <div class="w3-jumbo" >welcome 
                    <c:if test="${sessionScope.account.roles[0].rname eq 'Student'}">
                        <b style="color: white">${requestScope.student.studentSurname} ${requestScope.student.studentMiddlename} ${requestScope.student.studentGivenname}</b>
                    </c:if>
                    <c:if test="${sessionScope.account.roles[0].rname eq 'Instructor'}">
                        <b style="color: white">${requestScope.instructor.instructorName}</b>
                    </c:if>
                </div>
                <p class="w3-padding-large w3-margin-top ">FPT Attendance</p>
            </div>
        </div>

        <div class="choose">
            <nav class="nav flex-column">
                <c:forEach items="${sessionScope.account.roles}" var="r">
                    <c:forEach items="${r.features}" var="f">
                        <c:choose>
                            <c:when test="${f.fname eq 'CheckTimetable'}">
                                <a class="nav-link" href="Schedule">Schedule</a>
                            </c:when>
                            <c:when test="${f.fname eq 'CheckGroup'}">
                                <a class="nav-link" href="Filter">View Course and Group</a>
                            </c:when>
                            <c:when test="${f.fname eq 'TakeAttendance'}">
                                <a class="nav-link" href="Choose">Take Attendance</a>
                            </c:when>
                            <c:when test="${f.fname eq 'CheckAttendanceReport'}">
                                <a class="nav-link" href="Report">View Attendance Report</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </c:forEach>
                <a class="nav-link" style="color:red " href="logout">Logout</a>
            </nav>
        </div>

    </body>
</html>

