<%-- 
    Document   : choose
    Created on : Jun 26, 2022, 11:48:19 PM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/CompareTime" prefix="my"%>
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
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-light-gray">
                            <th class="text-uppercase">Time</th>
                            <th class="text-uppercase">Room</th>
                            <th class="text-uppercase">Group</th>
                            <th class="text-uppercase">Course</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.sessions}" var="se" varStatus="loop">
                            <tr>
                                <td>
                                    <fmt:formatDate type="time" value="${se.timeslotID.start}" pattern="HH:mm"/> - <fmt:formatDate type="time" value="${se.timeslotID.end}" pattern="HH:mm"/> <fmt:formatDate value="${se.sessionDate}" pattern="dd/MM/yyyy"/>
                                </td>
                                <td>
                                    ${se.roomID.roomID}
                                </td>
                                <td>
                                    ${se.groupID.groupName}
                                </td>
                                <td>
                                    ${se.groupID.courseID.courseName} (${se.groupID.courseID.courseID})
                                </td>
                                <c:if test="${not requestScope.check[loop.index]}">
                                    <my:CompareTime start="${se.timeslotID.start}" end="${se.timeslotID.end}"/>
                                    <c:if test="${pageScope.check}">
                                        <td>
                                            <a href="Attendance?group=${se.groupID.groupID}&session=${se.sessionID}"> Take </a>

                                        </td>
                                    </c:if>
                                    <c:if test="${not pageScope.check}">
                                        <td>
                                            Closing
                                        </td>
                                    </c:if>
                                </c:if>
                                <c:if test="${requestScope.check[loop.index]}">
                                    <td>
                                        <a href="View?session=${se.sessionID}"> View </a>
                                    </td>
                                    <td>
                                        <a href="Edit?session=${se.sessionID}"> Edit </a>
                                    </td>
                                </c:if>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
