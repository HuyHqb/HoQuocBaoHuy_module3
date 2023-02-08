<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>List Service</title>
        <meta charset="utf-8"/>
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.1/datatables.min.css">
    </head>
    <body>
        <jsp:include page="../navbar.jsp"/>

        <div class="container-fluid py-5">
            <nav>
                <a href="${pageContext.request.contextPath}/service?action=create">
                    <button class="btn btn-success">Add New Service</button>
                </a>
            </nav>
            <header class="text-center">
                <h2 class="text-primary">List Service</h2>
            </header>
            <div class="row py-5">
                <div class="col mx-auto">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <div class="mb-2 bg-success text-white rounded">${requestScope.message}</div>
                            <div class="table-responsive">
                                <table
                                        id="list"
                                        class="table table-bordered table-hover"
                                >
                                    <thead class="text-center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Area</th>
                                    <th>Cost</th>
                                    <th>Max People</th>
                                    <th>Rent Type</th>
                                    <th>Service Type</th>
                                    <th>Standard Room</th>
                                    <th>Description</th>
                                    <th>Pool Area</th>
                                    <th>Number of Floors</th>
                                    </thead>
                                    <tbody>
                                    <c:set var="listService" value="${requestScope.listService}"/>
                                    <c:if test="${empty listService}">
                                        <tr>
                                            <td colspan="13">List is empty</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${not empty listService}">
                                        <c:set var="i" value="0"/>
                                        <c:forEach var="service" items="${listService}">
                                            <tr class="${(service.id == requestScope.newServiceId) ? 'table-success':''}">
                                                <td>${i = i + 1}</td>
                                                <td>${service.name}</td>
                                                <td>${service.area}</td>
                                                <td>${service.cost}</td>
                                                <td>${service.maxNumberOfPeople}</td>
                                                <td>${service.rentType.name}</td>
                                                <td>${service.serviceType.name}</td>
                                                <td>${service.standardRoom}</td>
                                                <td>${service.descriptionConvenience}</td>
                                                <td>${service.poolArea}</td>
                                                <td>${service.numberOfFloor}</td>
<%--                                                <td>--%>
<%--                                                    <form action="${pageContext.request.contextPath}/service"--%>
<%--                                                          method="post">--%>
<%--                                                        <input type="hidden" name="action" value="showEditForm">--%>
<%--                                                        <input type="hidden" name="id" value="${service.id}">--%>
<%--                                                        <button type="submit" class="btn btn-primary">Edit</button>--%>
<%--                                                    </form>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <form action="${pageContext.request.contextPath}/service"--%>
<%--                                                          method="post">--%>
<%--                                                        <input type="hidden" name="action" value="delete">--%>
<%--                                                        <input type="hidden" name="id" value="${service.id}">--%>
<%--                                                        <button type="submit" class="btn btn-secondary">Remove</button>--%>
<%--                                                    </form>--%>
<%--                                                </td>--%>
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
