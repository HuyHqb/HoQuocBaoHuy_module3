<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
        body {
            background-image: url("https://img.freepik.com/free-vector/elegant-white-background-with-shiny-lines_1017-17580.jpg?w=2000");
            background-size: 100%;
            background-color: #cccccc;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/employee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<div class="container bg-white mt-5">
    <div class="row mt-3">
        <div class="col-12">
            <a class="btn btn-secondary" href="/employee" role="button">Back to Employee page</a>
        </div>
    </div>
    <div class="row mt-3" style="padding-left: 20px">
        <div class="col-6">
            <div class="row">
                <p style="color: red">
                    <c:if test="${message != null}">
                        <span style="color: greenyellow">${message}</span>
                    </c:if>
                </p>
            </div>
            <div class="row bg-white">
                <form action="/employee?action=update&id=${employee.id}" method="post">
                    <table>
                        <tr>
                            <th colspan="2" style="text-align: center; color: red">UPDATE FORM</th>
                        </tr>

                        <tr>
                            <td><label for="fn">Employee's name: </label></td>
                            <td><input type="text" id="fn" name="name" value="${employee.name}"></td>
                        </tr>

                        <tr>
                            <td><label for="datepicker">Employee's birthday: </label></td>
                            <td><input id="datepicker" name="birthday" value="${employee.birthday}"></td>
                        </tr>


                        <tr>
                            <td><label for="idc">Employee's ID card: </label></td>
                            <td><input type="text" id="idc" name="idCard" value="${employee.idCard}">
                        </tr>

                        <tr>
                            <td><label for="iddc">Employee's salary: </label></td>
                            <td><input type="text" id="iddc" name="salary" value="${employee.salary}">
                        </tr>

                        <tr>
                            <td><label for="pn">Customer's phone number: </label></td>
                            <td><input type="text" id="pn" name="phone" value="${employee.phone}"></td>
                        </tr>

                        <tr>
                            <td><label for="e">Customer's email: </label></td>
                            <td><input type="text" id="e" name="email" value="${employee.email}"></td>
                        </tr>

                        <tr>
                            <td><label for="addr">Customer's address: </label></td>
                            <td><input type="text" id="addr" name="address" value="${employee.address}"></td>
                        </tr>

                        <tr>
                            <td><span>Position of employee:</span></td>
                            <td>
                                <select name="position">
                                    <c:forEach var="index" items="${positionList}">
                                        <c:if test="${employee.position.id==index.id}">
                                            <option value="${index.id}">${index.name}</option>
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach var="index" items="${positionList}">
                                        <c:if test="${employee.position.id != index.id}">
                                            <option value="${index.id}">${index.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Education degree of employee:</span></td>
                            <td>
                                <select name="education">
                                    <c:forEach var="edu" items="${educationDegreeList}">
                                        <c:if test="${employee.educationDegree.id==edu.id}">
                                            <option value="${edu.id}">${edu.name}</option>
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach var="edu" items="${educationDegreeList}">
                                        <c:if test="${employee.educationDegree.id != edu.id}">
                                            <option value="${edu.id}">${edu.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Division of employee:</span></td>
                            <td>
                                <select name="division">
                                    <c:forEach var="division" items="${divisionList}">
                                        <c:if test="${employee.division.id==division.id}">
                                            <option value="${division.id}">${division.name}</option>
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach var="division" items="${divisionList}">
                                        <c:if test="${employee.division.id != division.id}">
                                            <option value="${division.id}">${division.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span>User name of employee:</span></td>
                            <td>
                                <select name="username">
                                    <c:forEach var="user" items="${userList}">
                                        <c:if test="${employee.user.username == user.username}">
                                            <option value="${user.username}">${user.username}</option>
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach var="user" items="${userList}">
                                        <c:if test="${employee.user.username != user.username}">
                                            <option value="${user.username}">${user.username}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="text-align: left"><input type="submit" value="Update"></td>

                        </tr>

                    </table>
                </form>
            </div>
        </div>
        <div class="col-6">
        </div>

    </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
