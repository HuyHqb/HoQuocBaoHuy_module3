<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Product</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="bg-light border">
            <div class="container p-5">
                <div class="text-center">
                    <h2 class="text-primary">Add New Product</h2>
                </div>
                <form action="${pageContext.request.contextPath}/product?action=create" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input
                                type="text"
                                class="form-control ${requestScope.errorName == null ? "":"is-invalid"}"
                                id="name"
                                name="name"
                                placeholder="Enter Product Name"
                                value="${requestScope.name}"
                        />
                        <div class="invalid-feedback">${requestScope.errorName}</div>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <input
                                class="form-control ${requestScope.errorPrice == null ? "":"is-invalid"}"
                                type="text"
                                id="price"
                                name="price"
                                value="${requestScope.price}"
                        />
                        <div class="invalid-feedback">${requestScope.errorPrice}</div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input
                                type="text"
                                class="form-control ${requestScope.errorQuantity == null ? "":"is-invalid"}"
                                id="quantity"
                                name="quantity"
                                placeholder="Enter Quantity"
                                value="${requestScope.quantity}"
                        />
                        <div class="invalid-feedback">${requestScope.errorQuantity}</div>
                    </div>
                    <div class="form-group">
                        <label for="color">Color</label>
                        <select class="custom-select" id="color" name="color">
                            <optgroup label="Select Type">
                                <option value="1" ${requestScope.colorId == 1 ? "selected":""}>Red</option>
                                <option value="2" ${requestScope.colorId == 2 ? "selected":""}>Green</option>
                                <option value="3" ${requestScope.colorId == 3 ? "selected":""}>Black</option>
                                <option value="4" ${requestScope.colorId == 4 ? "selected":""}>White</option>
                                <option value="5" ${requestScope.colorId == 5 ? "selected":""}>Yellow</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input
                                type="text"
                                class="form-control"
                                id="description"
                                name="description"
                                placeholder="Enter Description"
                                value="${requestScope.description}"
                        />
                    </div>
                    <div class="form-group">
                        <label for="categoryId">Category</label>
                        <select class="custom-select" id="categoryId" name="categoryId">
                            <optgroup label="Choose Position">
                            <c:forEach var="category" items="${requestScope.listCategories}">
                                <option value="${category.id}" ${requestScope.categoryId == category.id ? "selected":""}>${category.name}</option>
                            </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">
                            Save
                        </button>
                    </div>
                </form>
                <a href="${pageContext.request.contextPath}/product">
                    <button class="btn btn-secondary">Back</button>
                </a>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                crossorigin="anonymous"></script>
    </body>
</html>
