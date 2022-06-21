<%-- 
    Document   : schedule
    Created on : Jun 21, 2022, 12:01:47 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <div class="timetable-img text-center">
                <img src="img/content/timetable.png" alt="">
            </div>
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-light-gray">
                            <th rowspan="2" class="text-uppercase text-center">Time
                            </th>
                            <th class="text-uppercase text-center">Monday</th>
                            <th class="text-uppercase text-center">Tuesday</th>
                            <th class="text-uppercase text-center">Wednesday</th>
                            <th class="text-uppercase text-center">Thursday</th>
                            <th class="text-uppercase text-center">Friday</th>
                            <th class="text-uppercase text-center">Saturday</th>
                            <th class="text-uppercase text-center">Sunday</th>

                        </tr>
                        <tr>
                            <c:forEach items="${requestScope.datesinweek}" var="d">
                                <th class="text-uppercase text-center">${d}</th>
                                </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.timeslots}" var="t">     
                            <tr>   
                                <td class="align-middle">${t.timeslotID}</td>
                                <c:forEach items="${requestScope.datesinweek}" var="d" >
                                    <c:set var = "flag" value = "false"/>
                                    <c:forEach items="${requestScope.sessions}" var="se">

                                        <c:if test="${(se.timeslotID.timeslotID eq t.timeslotID) and (se.sessionDate eq d)}">
                                            <c:set var = "flag" value = "true"/>
                                            <td>
                                                <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${se.groupID.courseID.courseName}</span>
                                                <div class="font-size13 text-light-gray">at ${se.roomID.roomID}</div>
                                                <div class="margin-10px-top font-size14">${se.timeslotID.start}-${se.timeslotID.end}</div>
                                            </td>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${not flag}">
                                        <td></td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
