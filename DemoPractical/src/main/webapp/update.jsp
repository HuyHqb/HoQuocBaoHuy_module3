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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/employee">Employee</a>
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
                            <td><label for="fullName">Employee's name: </label></td>
                            <td><input type="text" id="fullName" name="fullName" value="${employee.fullName}"></td>
                        </tr>

                        <tr>
                            <td><label for="birthday">Employee's birthday: </label></td>
                            <td><input type="date" id="birthday" name="birthday" value="${employee.birthday}"></td>
                        </tr>


                        <tr>
                            <td><label for="address">Employee's address: </label></td>
                            <td><input type="text" id="address" name="address" value="${employee.address}">
                        </tr>

                        <tr>
                            <td><label for="startDay">Start day: </label></td>
                            <td><input type="date" id="startDay" name="startDay" value="${employee.startDay}"></td>
                        </tr>

                        <tr>
                            <td><label for="endDay">Start day: </label></td>
                            <td><input type="date" id="endDay" name="endDay" value="${employee.endDay}"></td>
                        </tr>

                        <tr>
                            <td><label for="salary">Employee's salary: </label></td>
                            <td><input type="text" id="salary" name="salary" value="${employee.salary}">
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
