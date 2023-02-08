<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Customer List</title>
    </head>
    <body>
        <h1>Customers</h1>
        <p>
            <a href="${pageContext.request.contextPath}/customers?action=create">Create new customer</a>
        </p>
        <table style="border: 1px solid black">
            <tr>
                <td>Name</td>
                <td>Email</td>
                <td>Address</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            <c:forEach items='${requestScope.customers}' var="customer">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/customers?action=view&id=${customer.id}">${customer.name}</a></td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td><a href="${pageContext.request.contextPath}/customers?action=edit&id=${customer.id}">edit</a></td>
                    <td><a href="${pageContext.request.contextPath}/customers?action=delete&id=${customer.id}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>