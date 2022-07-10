<%-- 
    Document   : schedule
    Created on : Jun 21, 2022, 12:01:47 AM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> 
        <link href="css/schedule/schedule.css" rel="stylesheet" type="text/css"/>
        <script src="js/changeschedule.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div>Student: A</div>
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead class="thead-light">
                        <tr>
                            <th rowspan="2" class="text-uppercase align-middle th-heigh-width">Time
                                <form id="year" method="POST">
                                    <jsp:useBean id="now" class="java.util.Date" />
                                    <fmt:formatDate var="year" value="${now}" pattern="yyyy" />
                                    <select onchange="document.getElementById('year').submit();" name="year">
                                        <c:forEach items="${requestScope.years}" var="y">
                                            <option value="${y}"
                                                    <c:choose>
                                                        <c:when test="${param.year eq null && year eq y}">
                                                            selected
                                                        </c:when>
                                                        <c:when test="${param.year eq y}">
                                                            selected
                                                        </c:when>
                                                    </c:choose>
                                                    >${y}</option>
                                        </c:forEach>
                                    </select>
                                </form>
                                <form id="timepaging" method="POST">
                                    <select onchange="document.getElementById('timepaging').submit();" name="period">
                                        <c:forEach items="${requestScope.weekinayear}" var="w">
                                            <option value="${w.key}"
                                                    <c:if test="${param.period eq w.key or requestScope.firstkey eq w.key}">
                                                        selected
                                                    </c:if>
                                                    ><fmt:formatDate value="${w.value[0]}" pattern="dd/MM"/>
                                                - 
                                                <fmt:formatDate value="${w.value[1]}" pattern="dd/MM"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <fmt:formatDate var="year" value="${weekinayear[(1).intValue()][0]}" pattern="yyyy"/>
                                    <input type="hidden" value="${year}" name="year" />
                                </form>
                            </th>
                            <th class="text-uppercase th-heigh-width">Monday</th>
                            <th class="text-uppercase th-heigh-width">Tuesday</th>
                            <th class="text-uppercase th-heigh-width">Wednesday</th>
                            <th class="text-uppercase th-heigh-width">Thursday</th>
                            <th class="text-uppercase th-heigh-width">Friday</th>
                            <th class="text-uppercase th-heigh-width">Saturday</th>
                            <th class="text-uppercase th-heigh-width">Sunday</th>

                        </tr>
                        <tr>
                            <c:forEach items="${requestScope.datesinweek}" var="d">
                                <th class="align-middle"><fmt:formatDate value="${d}" pattern="dd/MM"/></th>
                                </c:forEach>
                        </tr>
                    </thead>
                    <tbody >
                        <c:forEach items="${requestScope.timeslots}" var="t">     
                            <tr>   
                                <td class="align-middle">${t.timeslotID}</td>
                                <c:forEach items="${requestScope.datesinweek}" var="d" >
                                    <c:set var = "flag" value = "false"/>
                                    <c:forEach items="${requestScope.sessions}" var="se">

                                        <c:if test="${(se.timeslotID.timeslotID eq t.timeslotID) and (se.sessionDate eq d)}">
                                            <c:set var = "flag" value = "true"/>
                                            <td>
                                                <span class="xs-font-size13 course-color">${se.groupID.courseID.courseName}</span>
                                                <div>at 
                                                    <span class="room-color">${se.roomID.roomID}</span>
                                                </div>
                                                <div>${se.timeslotID.start}-${se.timeslotID.end}</div>
                                                <div>by ${se.instructorID.instructorName}</div> 
                                                
                                            </td>
                                            <div class="modal-container">
                                                    <div class="my-modal">
                                                        <div>Date: ${se.sessionDate} </div>
                                                        <div>Slot: ${se.timeslotID.start} - ${se.timeslotID.end} </div>
                                                        <div>Room: ${se.roomID.roomID} </div>
                                                        <div>Group: ${se.groupID.groupID} </div>
                                                        <div>Instructor: ${se.instructorID.instructorID} </div>
                                                        <div>Course: ${se.groupID.courseID.courseID} </div>
                                                        <div>Course session number: ${se.sessionNumber} </div>
                                                    </div>
                                                </div>
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
