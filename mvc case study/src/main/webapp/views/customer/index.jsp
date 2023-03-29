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
    <title>List Customers</title>
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
    <div class="row  " style="height: 70% " >
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
            <h2>List Customers</h2>
            <p style="color: green">${mess}</p>
            <table class="table table-striped" >
                <tr>
                    <th>STT</th>
                    <th>Name</th>
                    <th>Birthday</th>
                    <th>Gender</th>
                    <th>Id Card</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Customer type</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="customer" items="${listCustomer}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${customer.getName()}</td>
                        <td>${customer.getBirthday()}</td>
                        <c:if test="${customer.getGender()==1}">
                            <td>Nam</td>
                        </c:if>
                        <c:if test="${customer.getGender()==0}">
                            <td>Nữ</td>
                        </c:if>
                        <td>${customer.getIdCard()}</td>
                        <td>${customer.getPhoneNumber()}</td>
                        <td>${customer.getEmail()}</td>
                        <td>${customer.getAddress()}</td>
                        <td>${customer.getCustomerType().getType()}</td>
                        <td>
                            <button type="button" class="btn" style="background: chartreuse">Edit</button>
                        </td>
                        <td>
                            <button type="button" onclick="deleteInfo('${customer.id}','${customer.name}')"  class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="d-flex justify-content-between " style="color: green">
                <a href="/customer?action=create">
                    <button type="submit" class="btn btn-primary btn-block mb-4" >Add new customer</button>
                </a>
            </div>
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
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <input name="deleteId" id="deleteId" hidden>
                    <span>Bạn có muốn xoá </span><span style="color: #ff0000" id ="deleteName"></span><span> không?</span>
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
<script>
    function deleteInfo(id,name) {
        document.getElementById("deleteName").innerText=name;
        document.getElementById("deleteId").value=id;
    }
</script>
</html>
