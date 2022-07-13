<%-- 
    Document   : choose
    Created on : Jun 26, 2022, 11:48:19 PM
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
                                    ${se.timeslotID.start} - ${se.timeslotID.end} ${se.sessionDate}
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
                                    <td>
                                        <a href="Attendance?group=${se.groupID.groupID}&session=${se.sessionID}"> Take </a>
                                    </td>
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
