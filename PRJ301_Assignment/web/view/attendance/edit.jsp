<%-- 
    Document   : edit
    Created on : Jul 13, 2022, 12:54:56 AM
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

                                <input type="radio" value="present" name="status_${a.studentID.studentID}"
                                       <c:if test="${a.status eq 'present'}">
                                           checked
                                       </c:if>
                                       <c:if test="${a.status eq 'absent'}">
                                           onblur="isUpdate('${a.studentID.studentID}', this)"
                                       </c:if>
                                       />Present

                                <input type="radio" value="absent" name="status_${a.studentID.studentID}" 
                                       <c:if test="${a.status eq 'absent'}">
                                           checked
                                       </c:if>
                                       <c:if test="${a.status eq 'present'}">
                                           onblur="isUpdate('${a.studentID.studentID}', this)"
                                       </c:if>
                                       />Absent

                            </td>
                            <td>
                                <input type="text"  value="${a.commment}" name="comment_${a.studentID.studentID}" onclick="isUpdate('${a.studentID.studentID}', this)"/>
                            </td>
                            <td hidden>
                                <input type="text" value="${time}" name="recordtime_${a.studentID.studentID}"/>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <input type="submit" value="Edit"/>
        </form>
        <script>
            function isUpdateStatus(e, inputs) {
                var radio1 = inputs[0];
                var radio2 = inputs[1];
                if (e.type === 'radio') {
                    radio1.removeAttribute("checked");
                    radio2.removeAttribute("checked");
                    e.setAttribute("checked", "checked");
                }
                radio1.removeAttribute("onblur");
                radio2.removeAttribute("onblur");
            }

            function isUpdateComment(inputs) {
                var comment = inputs[2];

                comment.removeAttribute("onclick");

            }
            function isUpdate(studentID, e) {

                var updatedrow = document.getElementById(studentID);
                var inputs = document.querySelectorAll("#" + studentID + " input");
//                var inputs = updatedrow.getElementsByTagName("input");
//                console.log(inputs);
//                for (var i = 0; i < inputs.length; i++) {
//                    console.log(inputs[i]);
//                    inputs[i].removeAttribute("onblur");
//                    console.log(inputs[i]);
//                }
                isUpdateComment(inputs);
                isUpdateStatus(e, inputs);

                updatedrow.innerHTML += "<input type=\"text\" value=" + studentID + " name=\"studentID\" hidden/>";
            }
        </script>
    </body>
</html>
