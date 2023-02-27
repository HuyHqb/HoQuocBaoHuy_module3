<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/21/2022
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service</title>
    <link rel="stylesheet" href="/views/css/bootstrap.css">
    <script src="/views/js/bootstrap.js"></script>
</head>
<body>
<div class="container-fluid">
    <div>
        <c:import url="../shared/header.jsp"></c:import>
    </div>
    <div class="row  " style="height: 10%">
        <c:import url="../shared/navbar.jsp"></c:import>
    </div>
    <div class="row  " style="height: 70% ">
        <div class=" col-md-2">
            <ul class="list-group vh-100 overflow-scroll" style="border: 1px solid #7952b3">
                <li class="list-group-item" aria-current="true">An active item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A fourth item</li>
                <li class="list-group-item">And a fifth one</li>
                <li class="list-group-item" aria-current="true">An active item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A fourth item</li>
                <li class="list-group-item">And a fifth one</li>
                <li class="list-group-item" aria-current="true">An active item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A fourth item</li>
                <li class="list-group-item">And a fifth one</li>
                <li class="list-group-item" aria-current="true">An active item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A fourth item</li>
                <li class="list-group-item">And a fifth one</li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>Service</h2>
            <table class="table table-striped">
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Price</th>
                    <th>Person</th>
                    <th>rent Type</th>
                    <th>service type Id</th>
                    <th>standard</th>
                    <th>other service description</th>
                    <th>Pool area</th>
                    <th>floor</th>
                    <th>Free service</th>
                </tr>
                <c:forEach var="service" items="${listService}">
                    <tr>
                        <td>${service.getId()}</td>
                        <td>${service.getName()}</td>
                        <td>${service.getArea()}</td>
                        <td>${service.getRentPrice()}</td>
                        <td>${service.getMaxPerson()}</td>
                        <td>${service.getRentType().getType()}</td>
                        <td>${service.getServiceType().getType()}</td>
                        <td>${service.getStandard()}</td>
                        <td>${service.getOtherServiceDescription()}</td>
                        <td>${service.getPoolArea()}</td>
                        <td>${service.getFloor()}</td>
                        <td>${service.getFreeService()}</td>
                        <td>
                            <button type="button" class="btn btn-danger">Edit</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/student?action=delete" method="post">
                <div class="modal-body">
                    <input name="deleteId" id="deleteId">
                    <span>Bạn có muốn xoá </span><span style="color: #ff0000"
                                                       id="deleteName"></span><span> không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div style="height: 10%">
    <%--    <c:import url="../../footer.jsp"></c:import>--%>
</div>
</div>
</body>
</html>
