<%-- 
    Document   : header
    Created on : Jul 16, 2022, 11:39:55 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> 
        <title>JSP Page</title>
        <style>
            .container_choose{
                background-color: lightgrey;
                border-radius: 10px;
            }
            header{
                display: flex;
                justify-content: center;
            }
            .nav-link{
                margin-left: 20px;
                margin-right: 20px;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            
            .border{
                border-radius: 30px;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="container_choose">
                <nav class="nav justify-content-center">
                    <a class="nav-link border border-warning" style="color:orange " href="welcome">Home</a>
                    <c:forEach items="${sessionScope.account.roles}" var="r">
                        <c:forEach items="${r.features}" var="f">
                            <c:choose>
                                <c:when test="${f.fname eq 'CheckTimetable'}">
                                    <a class="nav-link border border-success" href="Schedule">Schedule</a>
                                </c:when>
                                <c:when test="${f.fname eq 'CheckGroup'}">
                                    <a class="nav-link border border-success" href="Filter">View Course and Group</a>
                                </c:when>
                                <c:when test="${f.fname eq 'TakeAttendance'}">
                                    <a class="nav-link border border-success" href="Choose">Take Attendance</a>
                                </c:when>
                                <c:when test="${f.fname eq 'CheckAttendanceReport'}">
                                    <a class="nav-link border border-success" href="Report">View Attendance Report</a>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </c:forEach>
                    <a class="nav-link border border-danger" style="color:red " href="logout">Logout</a>
                </nav>
            </div>
        </header>
    </body>
</html>
