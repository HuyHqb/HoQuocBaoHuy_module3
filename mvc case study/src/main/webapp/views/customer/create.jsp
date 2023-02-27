<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h2>Create new customer</h2>
            <a href="/customer"> Back to list customer</a>
            <p style="color: green">${mess}</p>
            <form method="post">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline">
                            <input type="text" id="name" class="form-control" name="name" />
                            <label class="form-label" for="name">Full name</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-outline">
                            <input type="date" id="birthday" class="form-control" name="birthday" />
                            <label class="form-label" for="birthday">Birthday</label>
                        </div>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline">
                            <input type="text" id="idCard" class="form-control" name="idCard"/>
                            <label class="form-label" for="idCard">ID Card</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-outline">
                            <input type="text" id="phoneNumber" class="form-control" name="phoneNumber"/>
                            <label class="form-label" for="phoneNumber">Phone number</label>
                        </div>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline">
                            <label class="form-label" for="gender">Gender: </label>
                            <select name="gender" id="gender">
                                <option value="1">Male</option>
                                <option value="0">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-outline">
                            <label class="form-label" >Customer Type </label>
                            <select name="customerTypeId" >
                                <option value="0">Chose Your type: </option>
                                <c:forEach var="customerType" items="${listCustomerType}">
                                    <option value="${customerType.id}">${customerType.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>


                <!-- Text input -->
                <div class="form-outline mb-4">
                    <input type="text" id="email" class="form-control" name="email" />
                    <label class="form-label" for="email">Email</label>
                </div>

                <!-- Text input -->
                <div class="form-outline mb-4">
                    <input type="text" id="address" class="form-control" name="address" />
                    <label class="form-label" for="address">Address</label>
                </div>
                <!-- Submit button -->
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary btn-block mb-4">Save</button>
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
