<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Service</title>
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
                    <h2 class="text-primary">Add New Service</h2>
                </div>
                <div class="bg-success text-white">${requestScope.message}</div>
                <form action="${pageContext.request.contextPath}/service?action=create" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input
                                type="text"
                                class="form-control"
                                id="name"
                                name="name"
                                placeholder="Enter name"
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
                                required
                        />
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="hour" value="1">
                            <label class="custom-control-label" for="hour">Hour</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="day" value="2">
                            <label class="custom-control-label" for="day">Day</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="month" value="3">
                            <label class="custom-control-label" for="month">Month</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="rentType" id="year" value="4">
                            <label class="custom-control-label" for="year">Year</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="serviceType" id="room" value="1">
                            <label class="custom-control-label" for="room">Room</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="serviceType" id="house" value="2">
                            <label class="custom-control-label" for="house">House</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input class="custom-control-input" type="radio" name="serviceType" id="villa" value="3">
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
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="poolArea">Pool Area</label>
                        <input
                                type="number"
                                class="form-control"
                                id="poolArea"
                                name="poolArea"
                                min="0"
                                placeholder="Enter Pool Area"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <label for="numberOfFloors">Number Of Floors</label>
                        <input
                                type="number"
                                class="form-control"
                                id="numberOfFloors"
                                name="numberOfFloors"
                                min="0"
                                placeholder="Enter Number Of Floors"
                                required
                        />
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">
                            Save
                        </button>
                    </div>
                </form>
                <a href="${pageContext.request.contextPath}/service">
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
