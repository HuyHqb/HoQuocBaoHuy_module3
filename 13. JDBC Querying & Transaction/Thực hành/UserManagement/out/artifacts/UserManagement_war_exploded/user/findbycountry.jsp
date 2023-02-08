<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 18/08/2021
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Find By Country</title>
    </head>
    <body>
        <h1>User Management</h1>
        <h2>
            <a href="users?action=users">List All Users</a>
        </h2>
        <center>
            <h2>Find By Country</h2>
        </center>
        <form method="post">
            <label for="country">Enter country: </label>
            <input type="text" name="country" id="country" placeholder="Enter country">
            <button type="submit">Find</button>
        </form>

        <c:set var="list" value="${requestScope.list}"/>
        <c:if test="${list != null}">
            <c:if test="${empty list}">
                <h4>Not found!</h4>
            </c:if>
            <c:if test="${not empty list}">
                <div align="center">
                    <table border="1" cellpadding="5">
                        <tr>
                            <td>Name</td>
                            <td>Mail</td>
                            <td>Country</td>
                        </tr>
                        <c:forEach var="user" items="${list}">
                            <tr>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>${user.country}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
        </c:if>

    </body>
</html>
