<%-- 
    Document   : attendance
    Created on : Jun 21, 2022, 9:47:10 PM
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
        <jsp:useBean id="now" class="java.util.Date" />
        <fmt:formatDate var="time" value="${now}" pattern="HH:mm:ss" /> 
        <form method="POST" action="Attendance">
            <table class="sortable table" >
                <thead>
                    <tr>
                        <th>Index</th>
                        <th>Member</th>
                        <th>Code</th>
                        <th>Surname</th>
                        <th>Middle name</th>
                        <th>Given name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Comment</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                    <input type="text" value="${loop.index + 1}" name="indexes" hidden/>
                    <td>${s.studentCode}</td>
                    <td>${s.studentID}</td>
                    <input type="text" value="${s.studentID}" name="studentID${loop.index+1}" hidden/>
                    <td>${s.studentSurname}</td>
                    <td>${s.studentMiddlename}</td>
                    <td>${s.studentGivenname}</td>
                    <td>${s.studentEmail}</td>
                    <td>
                        <input type="radio" value="present" name="status${loop.index+1}"/>Present
                        <input type="radio" value="absent" checked name="status${loop.index+1}"/>Absent
                    </td>
                    <td>
                        <input type="text" name="comment${loop.index+1}"/>
                    </td>
                    <input type="text" value="${time}" name="recordtime${loop.index+1}" hidden/>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <input type="submit" value="Take"/>
        </form>
    </body>
</html>
