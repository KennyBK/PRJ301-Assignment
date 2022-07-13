<%-- 
    Document   : edit
    Created on : Jul 13, 2022, 12:54:56 AM
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
        <form method="POST" action="Edit">
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
                    <c:forEach items="${requestScope.attendances}" var="a" varStatus="loop">
                        <tr id="${a.studentID.studentID}">
                            <td>${loop.index + 1}</td>
                            <td>${a.studentID.studentCode}</td>
                            <td>${a.studentID.studentID}</td>
                            <td>${a.studentID.studentSurname}</td>
                            <td>${a.studentID.studentMiddlename}</td>
                            <td>${a.studentID.studentGivenname}</td>
                            <td>${a.studentID.studentEmail}</td>
                            <td>

                                <input type="radio" value="present"
                                       <c:if test="${a.status eq 'present'}">
                                           checked
                                       </c:if>
                                       <c:if test="${a.status eq 'absent'}">
                                           onclick="isUpdate('${a.studentID.studentID}', this)"
                                       </c:if>
                                       />Present

                                <input type="radio" value="absent" 
                                       <c:if test="${a.status eq 'absent'}">
                                           checked
                                       </c:if>
                                       <c:if test="${a.status eq 'present'}">
                                           onclick="isUpdate('${a.studentID.studentID}', this)"
                                       </c:if>
                                       />Absent
                            </td>
                            <td>
                                <input type="text"  value="${a.commment}" onclick="isUpdate('${a.studentID.studentID}', this)"/>
                            </td>
                            <td hidden>
                                <input type="text" value="19:00:00" />
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <input type="submit" value="Edit"/>
        </form>
        <script>

            function isUpdateStatus(studentID, e, updatedrow) {
                var radiod = updatedrow.children[7];
                var radio1 = radiod.children[0];
                radio1.setAttribute("name", "status_" + studentID);
                var radio2 = radiod.children[1];
                radio2.setAttribute("name", "status_" + studentID);
                if (e.type == 'radio') {
                    radio1.removeAttribute("checked");
                    radio2.removeAttribute("checked");
                    e.setAttribute("checked", "checked");
                }
                e.removeAttribute("onclick");
            }

            function isUpdateComment(studentID, updatedrow) {
                var comment = updatedrow.children[8].children[0];
                comment.setAttribute("name", "comment_" + studentID);
                comment.removeAttribute("onclick");
            }

            function isUpdate(studentID, e) {
                var updatedrow = document.getElementById(studentID);
                isUpdateStatus(studentID, e, updatedrow);
                isUpdateComment(studentID, updatedrow);


                var recordtimed = updatedrow.children[9];
                var recordtime = recordtimed.children[0];
                recordtime.setAttribute("name", "recordtime_" + studentID);
                var sid = document.getElementById()(studentID + "_input");
                if (sid == null) {
                    updatedrow.innerHTML += "<input type=\"text\" value=" + studentID + " name=\"studentID\" id=\""+studentID+"_input\" hidden/>";
                }
            }
        </script>
    </body>
</html>
