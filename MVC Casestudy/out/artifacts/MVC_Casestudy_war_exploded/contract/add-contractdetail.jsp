<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Contract Detail</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="../navbar.jsp"/>

        <div class="container-fluid p-5">
            <header class="text-center">
                <h2 class="text-primary">Add Contract Detail</h2>
            </header>
            <div class="row py-5 mx-auto">
                <div class="col col-1"></div>
                <div class="col col-2">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <div class="table-responsive">
                                <table id="listContracts" class="table table-bordered table-hover">
                                    <thead class="text-center">
                                    <th>Contract ID</th>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="contract" items="${requestScope.listContracts}">
                                        <tr class="tableRow" id="${contract.id}">
                                            <td class="text-center">${contract.id}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <button class="btn btn-secondary mx-auto" type="button" id="showHiddenRows">Choose
                                    Again
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col col-6">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <div class="table-responsive">
                                <table id="listAttachServices" class="table table-bordered table-hover">
                                    <thead class="text-center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Unit</th>
                                    <th>Status</th>
                                    </thead>
                                    <tbody>
                                    <c:set var="j" value="0"/>
                                    <c:forEach var="service" items="${requestScope.listAttachServices}">
                                        <tr id="${service.id}">
                                            <td class="text-center">${j = j + 1}</td>
                                            <td>${service.name}</td>
                                            <td class="text-center">${service.unit}</td>
                                            <td>${service.status}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col col-2">
                    <div class="card rounded shadow border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <form action="${pageContext.request.contextPath}/contract?action=addContractDetail"
                                  method="post">
                                <input type="hidden" id="idContract" name="idContract">
                                <input type="hidden" id="idAttachService" name="idAttachService">
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <input class="form-group" type="text" name="quantity" id="quantity">
                                </div>
                                <button class="btn btn-success" type="submit">Confirm</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col col-1"></div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                $('#listContracts tr').click(function () {
                    $('#idContract').val($(this).attr('id'));
                });

                $('#listAttachServices tr').click(function () {
                    $('#idAttachService').val($(this).attr('id'));
                });
            });

            $('tr.tableRow').click(function () {
                $('tr.tableRow').not(this).hide();

            });

            $("#showHiddenRows").click(function () {
                $("#listContracts tr:hidden").show();
            });

            $("#listAttachServices tr").click(function () {
                $("#listAttachServices tr").removeClass("btn-warning");
                $(this).toggleClass("btn-warning");
            });
        </script>
    </body>
</html>
