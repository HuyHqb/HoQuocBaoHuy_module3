<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
              crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    </head>
    <body>
        <header class="navbar navbar-dark bg-dark text-light">
            <div class="container text-center">
                <h2 class="mx-auto m-2">
                    Furama Resort Management
                </h2>
            </div>
        </header>
        <div class="mw-100 d-flex align-items-center justify-content-center" style="height: 80vh">
            <div class="w-25">
                <div class="card rounded shadow border-0">
                    <div class="card-body p-4 bg-white rounded">
                        <div class="text-center mb-5">
                            <i class="fas fa-user fa-7x"></i>
                        </div>
                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" class="form-control"
                                       value="${requestScope.user}">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control"
                                       value="${requestScope.pass}">
                            </div>
                            <div class="text-danger">
                                ${requestScope.error}
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" name="checkRemember"
                                       id="checkRemember"
                                       value="${true}">
                                <label for="checkRemember" class="custom-control-label">Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-primary mt-4">Login</button>
                        </form>
                    </div>
                </div>
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
