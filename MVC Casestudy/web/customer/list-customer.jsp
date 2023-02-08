<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>List Customer</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.1/datatables.min.css">

    </head>
    <body>
        <jsp:include page="../navbar.jsp"/>

        <div class="container-fluid py-5">
            <nav>
                <a href="${pageContext.request.contextPath}/customer?action=create">
                    <button class="btn btn-success">Add New Customer</button>
                </a>
            </nav>
            <header class="text-center">
                <h2 class="text-primary">List Customer</h2>
            </header>
            <div class="row py-5">
                <div class="col mx-auto">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <div class="mb-2 bg-success text-white rounded">${requestScope.message}</div>
                            <div class="table-responsive">
                                <table id="list" class="table table-bordered table-hover">
                                    <thead class="text-center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Gender</th>
                                    <th>Birthday</th>
                                    <th>ID Card</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                    </thead>
                                    <tbody>
                                    <c:set var="listCustomer" value="${requestScope.listCustomer}"/>
                                    <c:if test="${empty listCustomer}">
                                        <tr>
                                            <td colspan="11">List is empty</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${not empty listCustomer}">
                                        <c:set var="i" value="0"/>
                                        <c:forEach var="customer" items="${listCustomer}">
                                            <tr class="${(customer.id == requestScope.newCustomerId) ? 'table-success':''}">
                                                <td>${i = i + 1}</td>
                                                <td>${customer.name}</td>
                                                <td>${customer.customerType.name}</td>
                                                <td>${customer.gender}</td>
                                                <td>${customer.birthday}</td>
                                                <td>${customer.idCard}</td>
                                                <td>${customer.phone}</td>
                                                <td>${customer.email}</td>
                                                <td>${customer.address}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/customer"
                                                          method="post">
                                                        <input type="hidden" name="action" value="showEditForm">
                                                        <input type="hidden" name="id" value="${customer.id}">
                                                        <button type="submit" class="btn btn-primary">Edit</button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/customer"
                                                          method="post">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="id" value="${customer.id}">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-toggle="modal"
                                                                data-target="#confirmDelete${customer.id}">Remove
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="confirmDelete${customer.id}"
                                                             data-backdrop="static"
                                                             data-keyboard="false" tabindex="-1"
                                                             aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title"
                                                                            id="staticBackdropLabel">
                                                                            Confirm Delete "${customer.name}"?</h5>
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
