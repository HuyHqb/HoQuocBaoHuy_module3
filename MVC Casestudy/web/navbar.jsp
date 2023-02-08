<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<style>
    li:hover {
        background: #2f3038;
    }
</style>
<header class="navbar navbar-light bg-light">
    <a class="navbar-brand ml-3" href="${pageContext.request.contextPath}/home">
        <i class="bi bi-house-fill"></i>
        Home
    </a>
    <div class="ml-auto mr-5">
        ${sessionScope.username}
    </div>
    <form action="logout" METHOD="get">
        <button type="submit" class="btn btn-light">Log out <i class="fas fa-sign-out-alt ml-1"></i></button>
    </form>
</header>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#toggleMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-around" id="toggleMenu">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link px-4" href="${pageContext.request.contextPath}/employee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-4" href="${pageContext.request.contextPath}/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-4" href="${pageContext.request.contextPath}/service">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-4" href="${pageContext.request.contextPath}/contract">Contract</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-4" href="${pageContext.request.contextPath}/contract?action=contractDetail">Contract
                        Detail</a>
                </li>
            </ul>
        </div>
    </div>
</nav>