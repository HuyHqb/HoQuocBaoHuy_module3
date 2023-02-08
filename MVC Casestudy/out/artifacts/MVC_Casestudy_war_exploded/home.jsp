<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Using Service</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.1/datatables.min.css">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid py-5">
            <header class="text-center">
                <h1>List Using Service</h1>
            </header>
            <div class="row py-5">
                <div class="col mx-auto">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <div class="table-responsive">
                                <table id="list" class="table table-bordered table-hover">
                                    <thead class="text-center">
                                    <th></th>
                                    <th>ID Customer</th>
                                    <th>Customer</th>
                                    <th>Contract ID</th>
                                    <th>Service</th>
                                    <th>Attach Service</th>
                                    </thead>
                                    <tbody>
                                    <c:set var="listContractDetail" value="${requestScope.listContractDetail}"/>
                                    <c:if test="${empty listContractDetail}">
                                        <tr>
                                            <td colspan="5">List is empty</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${not empty listContractDetail}">
                                        <c:set var="i" value="0"/>
                                        <c:forEach var="contractDetail" items="${listContractDetail}">
                                            <tr>
                                                <td>${i = i + 1}</td>
                                                <td>${contractDetail.contract.customer.id}</td>
                                                <td>${contractDetail.contract.customer.name}</td>
                                                <td>${contractDetail.contract.id}</td>
                                                <c:if test="${contractDetail.contract.service!=null}">
                                                    <td onclick="document.location='service?action=edit&id=${contractDetail.contract.service.id}';">${contractDetail.contract.service.name}</td>
                                                </c:if>
                                                <c:if test="${contractDetail.contract.service==null}">
                                                    <td>None</td>
                                                </c:if>
                                                <td>${contractDetail.attachService.name}</td>
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
