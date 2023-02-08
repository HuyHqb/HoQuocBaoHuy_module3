<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>List Product</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <style>
            th{
                text-align: center;
            }
            .table td{
                vertical-align: middle; !important;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light justify-content-between">
            <a class="navbar-brand">List Products</a>
            <form class="form-inline" action="${pageContext.request.contextPath}/productAction" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" name="valueSearch" value="${requestScope.search}">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </nav>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Manufacturer</th>
                <th colspan="3">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="i" value="0"/>
            <c:forEach var="list" items="${requestScope.listProduct}">
                <tr>
                    <td>${i = i+1}</td>
                    <td>${list.name}</td>
                    <td>${list.price}</td>
                    <td>${list.description}</td>
                    <td>${list.manufacturer}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/productAction?action=view&id=${list.id}">
                            <button type="button" class="btn btn-primary">View</button>
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/productAction?action=edit&id=${list.id}">
                            <button type="button" class="btn btn-primary">Edit</button>
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/productAction?action=delete&id=${list.id}">
                            <button type="button" class="btn btn-primary">Remove</button>
                        </a>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete">Remove</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/productAction?action=create">
            <button type="button" class="btn btn-success">Add new Product</button>
        </a>

        <!-- Modal -->
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Are you sure to delete?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
                        <button type="button">Delete</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>
    </body>
</html>