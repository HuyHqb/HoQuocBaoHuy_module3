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
    <title>Furama Resort</title>
    <link rel="stylesheet" href="/views/css/bootstrap.css">
    <script src="/views/js/bootstrap.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="header" style="height: 10%">
        <div>
            <a class="navbar-brand"><img src="https://www.furama.com/images/LOGOFurama_4C_Normal.png" alt=""
                                         style="width: 20%"></a>
            <span style="color: green;padding-left: 85%" >Ho Quoc Bao Huy</span>
        </div>
    </div>
    <div class="row  " style="height: 10%">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/home.jsp">FURAMA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/facility">FACILITIES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/customer">CUSTOMERS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/employee">EMPLOYEES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/contract">CONTRACTS</a>
                        </li>

                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
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
            <h1>This is homepage</h1>
        </div>
    </div>

    <div style="height: 10%">

    </div>
</div>
</body>
</html>
