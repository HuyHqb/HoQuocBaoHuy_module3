<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 16/08/2021
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Edit Product</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-light bg-light justify-content-between">
            <a class="navbar-brand">Edit Product</a>
        </nav>
        <div class="container">
            <form action="${pageContext.request.contextPath}/productAction?action=edit" method="post">
                <c:set var="product" value="${requestScope.editProduct}"/>
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" name="id" id="id" class="form-control" value="${product.id}" readonly>
                </div>
                <div class="form-group">
                    <label for="name">Name Product</label>
                    <input type="text" name="name" id="name" class="form-control" value="${product.name}">
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" name="price" id="price" class="form-control" value="${product.price}">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" id="description" name="description" class="form-control" value="${product.description}">
                </div>
                <div class="form-group">
                    <label for="manufacturer">Manufacturer</label>
                    <input type="text" id="manufacturer" name="manufacturer" class="form-control" value="${product.manufacturer}">
                </div>
                <a href="${pageContext.request.contextPath}/productAction">
                    <button type="button" class="btn btn-secondary">Back</button>
                </a>
                <button type="submit" class="btn btn-primary">Edit</button>
            </form>
        </div>
    </body>
</html>
