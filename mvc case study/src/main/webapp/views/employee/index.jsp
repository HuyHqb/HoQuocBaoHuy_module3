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
    <title>Employee</title>
    <link rel="stylesheet" href="/views/css/bootstrap.css">
    <script src="/views/js/bootstrap.js"></script>
</head>
<body>
<div class="container-fluid">
    <div>
        <c:import url="../shared/header.jsp"></c:import>
    </div>
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
            <h2>Employees</h2>
            <p style="color: green">${mess}</p>
            <table class="table table-striped">
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>birthday</th>
                    <th>Id Card</th>
                    <th>Salary</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Position</th>
                    <th>Education Degree</th>
                    <th>Division</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="employee" items="${listEmployee}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${employee.getName()}</td>
                        <td>${employee.getBirthday()}</td>
                        <td>${employee.getIdCard()}</td>
                        <td>${employee.getSalary()}</td>
                        <td>${employee.getPhoneNumber()}</td>
                        <td>${employee.getEmail()}</td>
                        <td>${employee.getAddress()}</td>
                        <td>${employee.getPosition().getType()}</td>
                        <td>${employee.getEducationDegree().getType()}</td>
                        <td>${employee.getDivision().getType()}</td>
                        <td>
                            <button type="button" class="btn " style="background-color: greenyellow">Edit</button>
                        </td>
                        <td>
                            <button type="button" onclick="deleteInfo('${employee.id}','${employee.name}')"
                                    class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                Delete
                            </button>
                        </td>

                    </tr>
                </c:forEach>
            </table>
            <div class="d-flex justify-content-between " style="color: green">
                <a href="/employee?action=create">
                    <button type="submit" class="btn btn-primary btn-block mb-4">Add new employee</button>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=delete" method="post">
                <div class="modal-body">
                    <input name="deleteId" id="deleteId" hidden>
                    <span>Bạn có muốn xoá </span><span style="color: #ff0000"
                                                       id="deleteName"></span><span> không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary " data-bs-target="noticeDeleteModal" data-bs-toggle="modal">Delete</button>
                </div>
            </form>
        </div>
    </div>



    <div style="height: 10%">
        <%--    <c:import url="../../footer.jsp"></c:import>--%>
    </div>
</div>
</body>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteName").innerText = name;
        document.getElementById("deleteId").value = id;
    }
</script>
</html>
