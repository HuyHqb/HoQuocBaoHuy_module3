<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Contract</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="../navbar.jsp"/>
        <div class="bg-light border">
            <div class="container p-5">
                <div class="text-center">
                    <h2 class="text-primary">Add New Contract</h2>
                </div>
                <div class="mb-2 bg-success text-white rounded">${requestScope.message}</div>
                <c:set var="contract" value="${requestScope.contract}"/>
                <form action="${pageContext.request.contextPath}/contract?action=addContract" method="post">
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate"
                               value="${contract.startDateForInput}">
                    </div>
                    <div class="form-group">
                        <label for="endDate">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate"
                               value="${contract.endDateForInput}">
                    </div>
                    <div class="form-group">
                        <label for="deposit">Deposit</label>
                        <input class="form-control" type="text" id="deposit" name="deposit" value="${contract.deposit}">
                    </div>
                    <div class="form-group">
                        <label for="totalMoney">Total Money</label>
                        <input class="form-control" type="text" id="totalMoney" name="totalMoney"
                               value="${contract.totalMoney}">
                    </div>
                    <div class="form-group">
                        <label for="employeeId">Employee ID</label>
                        <input class="form-control ${null != requestScope.errorNullEmployee ? "is-invalid":""}"
                               type="text" id="employeeId" name="employeeId" value="${contract.employee.id}">
                        <div class="invalid-feedback">
                            ${requestScope.errorNullEmployee}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="customerId">Customer ID</label>
                        <input class="form-control ${null != requestScope.errorNullCustomer ? "is-invalid":""}"
                               type="text" id="customerId" name="customerId" value="${contract.customer.id}">
                        <div class="invalid-feedback">
                            ${requestScope.errorNullCustomer}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="serviceId">Service</label>
                        <select class="custom-select" name="serviceId" id="serviceId">
                            <c:forEach var="service" items="${requestScope.listServices}">
                                <option value="${service.id}" ${service.id == contract.service.id ? "selected":""}>${service.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">
                            Save
                        </button>
                    </div>
                </form>
                <a href="#">
                    <button class="btn btn-secondary">Back</button>
                </a>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                crossorigin="anonymous"></script>
    </body>
</html>
