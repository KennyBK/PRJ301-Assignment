<%-- 
    Document   : edit
    Created on : Jul 12, 2022, 12:29:16 AM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <h1>
            Single activity Attendance
        </h1>
        <div>
            Attendance for <b>${requestScope.attendances[0].sessionID.groupID.courseID.courseID}</b> 
            with lecturer <b>${requestScope.attendances[0].sessionID.instructorID.instructorID}</b>
            at slot <b>${requestScope.attendances[0].sessionID.timeslotID.timeslotID}</b>
            on <b><fmt:formatDate value="${requestScope.attendances[0].sessionID.sessionDate}" pattern="dd/MM/yyyy"/></b>, 
            <b>${requestScope.attendances[0].sessionID.semester}</b>,
            in room <b>${requestScope.attendances[0].sessionID.roomID.roomID}</b>
        </div>
        <table class="sortable table" >
            <thead>
                <tr>
                    <th>No</th>
                    <th>Group</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Comment</th>
                    <th>Taker</th>
                    <th>Record Time</th> 
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.attendances}" var="a" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${a.sessionID.groupID.groupName}</td>
                        <td>${a.studentID.studentID}</td>
                        <td>${a.studentID.studentSurname} ${a.studentID.studentMiddlename} ${a.studentID.studentGivenname}</td>
                        <td>${a.studentID.studentEmail}</td>
                        <td <c:if test="${a.status eq 'absent'}">
                                style="color: red"
                            </c:if>
                            <c:if test="${a.status eq 'present'}">
                                style="color: green"
                            </c:if>
                                >
                            ${a.status}
                        </td>
                        <td>${a.commment}</td>
                        <td>${a.sessionID.instructorID.instructorID}</td>
                        <td>${a.recordtime}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>
