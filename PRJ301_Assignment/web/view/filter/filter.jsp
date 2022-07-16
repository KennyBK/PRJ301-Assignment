<%-- 
    Document   : filter
    Created on : Jun 21, 2022, 9:46:51 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> 
    </head>
    <body>
        <jsp:include page="../landing/header.jsp"></jsp:include>
        <br/>
            <div class="container">
                <table >
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Group</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td valign='top'>
                                <div id="ctl00_mainContent_divCourse">
                                    <table class="table">
                                    <c:forEach items="${requestScope.courses}" var="c">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${param.course eq c.courseID}">
                                                        <b>${c.courseName}</b> (${c.courseID})
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a target="_self" href="?course=${c.courseID}">${c.courseName}</a> (${c.courseID})
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </td>
                        <td valign='top'>
                            <div id="ctl00_mainContent_divGroup">
                                <table class="table">
                                    <c:forEach items="${requestScope.groups}" var="g">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${param.group eq g.groupID}">
                                                        <b>${g.groupName}</b>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a target="_self" href="?course=${param.course}&group=${g.groupID}">${g.groupName}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <c:if test="${students.size() gt 0}">
            <div class="container">
                <div id="ctl00_mainContent_divStudents">
                    <table class="sortable table" id="id">
                        <thead>
                            <tr>
                                <th>Index</th>
                                <th>Member</th>
                                <th>Code</th>
                                <th>Surname</th>
                                <th>Middle name</th>
                                <th>Given name</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${s.studentCode}</td>
                                    <td>${s.studentID}</td>
                                    <td>${s.studentSurname}</td>
                                    <td>${s.studentMiddlename}</td>
                                    <td>${s.studentGivenname}</td>
                                    <td>${s.studentEmail}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </body>
</html>
