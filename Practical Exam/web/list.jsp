<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>List Products</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.1/datatables.min.css">

    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid py-5">
            <nav>
                <a href="${pageContext.request.contextPath}/product?action=create">
                    <button class="btn btn-success">Add New Product</button>
                </a>
            </nav>
            <header class="text-center">
                <h2 class="text-primary">List Product</h2>
            </header>
            <div class="row py-5">
                <div class="col mx-auto">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">

                            <span class="font-italic bg-success">${requestScope.message}</span>
                            <div class="table-responsive">
                                <table id="list" class="table table-bordered table-hover">
                                    <thead class="text-center">
                                    <th>ID</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Color</th>
                                    <th>Category</th>
                                    <th class="no-sort">Edit</th>
                                    <th class="no-sort">Delete</th>
                                    </thead>
                                    <tbody>
                                    <c:set var="i" value="0"/>
                                    <c:set var="listProduct" value="${requestScope.listProducts}"/>
                                    <c:if test="${not empty listProduct}">
                                        <c:forEach var="product" items="${listProduct}">
                                            <tr class="${(product.id == requestScope.newProductId) ? 'table-success':''}">
                                                <td class="text-center">${i = i + 1}</td>
                                                <td>${product.name}</td>
                                                <td>${product.price}</td>
                                                <td>${product.quantity}</td>
                                                <td>${product.color}</td>
                                                <td>${product.category.name}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/product"
                                                          method="post">
                                                        <input type="hidden" name="action" value="showEditForm">
                                                        <input type="hidden" name="id" value="${product.id}">
                                                        <button type="submit" class="btn btn-primary">Edit</button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/product"
                                                          method="post">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="id" value="${product.id}">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-toggle="modal"
                                                                data-target="#confirmDelete${product.id}">Remove
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="confirmDelete${product.id}"
                                                             data-backdrop="static"
                                                             data-keyboard="false" tabindex="-1"
                                                             aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title"
                                                                            id="staticBackdropLabel">
                                                                            Confirm Delete "${product.name}"?</h5>
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        If deleted, you cannot go back.
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Back
                                                                        </button>
                                                                        <button type="submit" class="btn btn-primary">
                                                                            Delete
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listProduct}">
                                        <tr>
                                            <td colspan="7">List is empty now</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                crossorigin="anonymous"></script>

        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.1/datatables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#list').DataTable({
                    "columnDefs": [{
                        "targets": 'no-sort',
                        "orderable": false,
                    }]
                });
            });
        </script>
    </body>
</html>
