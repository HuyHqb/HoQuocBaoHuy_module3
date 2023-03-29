<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<style>
    li:hover {
        background: #2f3038;
    }
</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#toggleMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-around" id="toggleMenu">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link px-4" href="${pageContext.request.contextPath}/product">Product Management</a>
                </li>

            </ul>
        </div>
    </div>
</nav>