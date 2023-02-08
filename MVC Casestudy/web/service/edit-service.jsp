<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Edit Service</title>
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
                    <h2 class="text-primary">Edit Service</h2>
                </div>
                <div class="bg-success text-white rounded">${requestScope.message}</div>
                <c:set var="service" value="${requestScope.service}"/>
                <form action="${pageContext.request.contextPath}/service?action=edit" method="post">
                    <input type="hidden" name="id" value="${service.id}">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input
                                type="text"
                                class="form-control"
                                id="name"
                                name="name"
                                placeholder="Enter name"
                                value="${service.name}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="area">Area</label>
                        <input
                                class="form-control"
                                type="number"
                                id="area"
                                name="area"
                                min="0"
                                placeholder="Enter Area"
                                value="${service.area}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="cost">Cost</label>
                        <input
                                type="number"
                                class="form-control"
                                id="cost"
                                name="cost"
                                min="0"
                                placeholder="Enter Cost"
                                value="${service.cost}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="maxPeople">Max Number Of People</label>
                        <input
                                type="number"
                                class="form-control"
                                id="maxPeople"
                                name="maxPeople"
                                min="0"
                                placeholder="Enter Max Number Of People"
                                value="${service.maxNumberOfPeople}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="hour"
                                   value="1" ${service.rentType.id == 1 ?"checked":""}>
                            <label class="custom-control-label" for="hour">Hour</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="day"
                                   value="2" ${service.rentType.id == 2 ?"checked":""}>
                            <label class="custom-control-label" for="day">Day</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="month"
                                   value="3" ${service.rentType.id == 3 ?"checked":""}>
                            <label class="custom-control-label" for="month">Month</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="year"
                                   value="4" ${service.rentType.id == 4 ?"checked":""}>
                            <label class="custom-control-label" for="year">Year</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="serviceType" id="room"
                                   value="1" ${service.serviceType.id == 1 ?"checked":""}>
                            <label class="custom-control-label" for="room">Room</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="serviceType" id="house"
                                   value="2" ${service.serviceType.id == 2 ?"checked":""}>
                            <label class="custom-control-label" for="house">House</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="serviceType" id="villa"
                                   value="3" ${service.serviceType.id == 3 ?"checked":""}>
                            <label class="custom-control-label" for="villa">Villa</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="standardRoom">Standard Room</label>
                        <input
                                type="text"
                                class="form-control"
                                id="standardRoom"
                                name="standardRoom"
                                placeholder="Enter Standard Room"
                                value="${service.standardRoom}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input
                                type="text"
                                class="form-control"
                                id="description"
                                name="description"
                                placeholder="Enter Description Of Other Convenience"
                                value="${service.descriptionConvenience}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="poolArea">Pool Area</label>
                        <input
                                type="number"
                                min="0"
                                class="form-control"
                                id="poolArea"
                                name="poolArea"
                                placeholder="Enter Pool Area"
                                value="${service.poolArea}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="numberOfFloors">Number Of Floors</label>
                        <input
                                type="number"
                                min="0"
                                class="form-control"
                                id="numberOfFloors"
                                name="numberOfFloors"
                                placeholder="Enter Number Of Floors"
                                value="${service.numberOfFloor}"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">
                            Edit
                        </button>
                    </div>
                </form>
                <form action="${pageContext.request.contextPath}/service?action=delete"
                      method="post">
                    <input type="hidden" name="id" value="${service.id}">
                    <a href="${pageContext.request.contextPath}/home">
                        <button class="btn btn-secondary" type="button">Back</button>
                    </a>
                    <button type="button" class="btn btn-secondary" data-toggle="modal"
                            data-target="#confirmDelete${service.id}">
                        Delete
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="confirmDelete${service.id}"
                         data-backdrop="static"
                         data-keyboard="false" tabindex="-1"
                         aria-labelledby="staticBackdropLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">
                                        Confirm Delete
                                        "${service.name}"?</h5>
                                    <button type="button" class="close"
                                            data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    If deleted, you cannot go back.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Back
                                    </button>
                                    <button type="submit" class="btn btn-primary">Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
