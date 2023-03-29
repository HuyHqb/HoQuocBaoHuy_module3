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
    <style>
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
            <a class="btn btn-secondary" href="/employee" role="button">Back to list employee</a>
        </div>
    </div>
    <div class="row mt-3" style="padding-left: 20px">
        <div class="col-6">
            <div class="row">
                <p style="color: green">${mess}</p>
            </div>
            <div class="row bg-white">
                <form action="/employee?action=create" method="post">
                    <table>
                        <tr>
                            <th colspan="2" style="text-align: center; color: red">CREATE FORM</th>
                        </tr>

                        <tr>
                            <td><label for="fn">Employee Id: </label></td>
                            <td><input type="text" id="fn" name="employeeId" disabled></td>
                        </tr>

                        <tr>
                            <td><label for="datepicker">Full name: </label></td>
                            <td><input id="datepicker" name="fullName"></td>
                        </tr>


                        <tr>
                            <td><label for="birthday">birthday: </label></td>
                            <td><input type="date" id="birthday" name="birthday">
                        </tr>

                        <tr>
                            <td><label for="pn">address: </label></td>
                            <td><input type="text" id="pn" name="address"></td>
                        </tr>

                        <tr>
                            <td><label for="startDay">start day: </label></td>
                            <td><input type="date" id="startDay" name="startDay">
                        </tr>

                        <tr>
                            <td><label for="endDay">end day: </label></td>
                            <td><input type="date" id="endDay" name="endDay">
                        </tr>

                        <tr>
                            <td><label for="salary">Salary</label></td>
                            <td><input type="number" id="salary" name="salary">
                        </tr>

                        <tr>
                            <td><span>JOB</span></td>
                            <td>
                                <select name="jobId">
                                    <c:forEach var="index" items="${jobList}">
                                        <option value="${index.jobId}">${index.jobName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><a class="btn btn-secondary" href="/employee" role="button">Hủy</a></td>
                            <td  style="text-align: left"><input class="btn btn-secondary" type="submit" value="Tạo mới"></td>
                        </tr>

                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
