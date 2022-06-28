<%-- 
    Document   : report
    Created on : Jun 28, 2022, 11:20:18 PM
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

    </head>
    <body>
        <div class="container">
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-light-gray">
                            <th class="text-uppercase">Group</th>
                            <th class="text-uppercase">Course</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.groups}" var="g">
                        <form method="POST" action="Report">
                            <tr>
                                <td>
                                    ${g.groupName}
                                </td>
                                <td>
                                    ${g.courseID.courseName}
                                </td>
                                <td>
                                    <input type="hidden" name="group" value="${g.groupID}"/>
                                    <input type="submit" value="View Report"/>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <c:if test="${param.group ne null}">
            <table class="table table-bordered text-center">
                <thead >
                    <tr class="bg-light-gray">
                        <th class="text-uppercase">StudentID</th>
                        <th class="text-uppercase">StudentName</th>
                        <th class="text-uppercase">Absent(%)</th>
                            <c:forEach items="${requestScope.sessions}" var="se">
                            <th class="text-uppercase">
                                <fmt:formatDate value="${se.sessionDate}" pattern="dd/MM"/></br>
                                ${se.sessionNumber}
                            </th>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.students}" var="s">
                        <tr>
                            <td>
                                ${s.studentID}
                            </td>
                            <td>
                                ${s.studentSurname} ${s.studentMiddlename} ${s.studentGivenname}
                            </td>

                            <td>
                                <c:set var = "count" value = "0"/>
                                <c:forEach items="${requestScope.attendances}" var="a">
                                    <c:if test="${a.studentID.studentID eq s.studentID and a.status eq 'absent'}">
                                        <c:set var = "count" value = "${count + 1}"/>
                                    </c:if>
                                </c:forEach>
                                <fmt:formatNumber type = "percent" minFractionDigits = "0" value = "${(count/sessions.size())}" />
                            </td>
                            <c:forEach items="${requestScope.sessions}" var="se">
                                <c:set var = "flag" value = "false"/>
                                <c:forEach items="${requestScope.attendances}" var="a">
                                    <c:if test="${a.studentID.studentID eq s.studentID and a.sessionID.sessionID eq se.sessionID}">

                                        <c:set var = "flag" value = "true"/>
                                        <c:choose>
                                            <c:when test="${a.status eq 'present'}">
                                                <td style="color: green">P</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="color: red">A</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${not flag}">
                                    <td>-</td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
