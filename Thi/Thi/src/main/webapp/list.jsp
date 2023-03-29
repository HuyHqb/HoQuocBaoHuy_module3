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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/employee">Phòng trọ</a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<div class="container bg-white mt-5">
    <div class="row">
        <div class="col-4 mt-3">
            <a class="btn btn-secondary" href="/employee?action=create" role="button">Create new </a>
        </div>
    </div>
    <div class="row">
        <div class="col-3 mt-3"></div>
        <div class="col-6 mt-3">
            <form action="/employee?action=search" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Nhập mã phòng trọ" aria-label="Recipient's username"
                           aria-describedby="button-addon2" name="maPhongTro">
                    <input type="text" class="form-control" placeholder="Nhập tên người thuê trọ" aria-label="Recipient's username"
                           aria-describedby="button-addon2" name="tenNguoiThue">
                    <input type="text" class="form-control" placeholder="Nhập số điện thoại" aria-label="Recipient's username"
                           aria-describedby="button-addon2" name="soDienThoai">

                    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Tìm kiếm</button>
                </div>

            </form>
        </div>
        <div class="col-3 mt-3"></div>
    </div>
    <%--    Bảng danh sách--%>
    <div class="row mt-3">
        <div class="col-lg-12">
            <table id="tableStudent" class="table table-striped table-bordered" style="background-color: white ;width:100%; font-size: small">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã phòng trọ</th>
                    <th>Tên người thuê trọ</th>
                    <th>Số điện toại</th>
                    <th>Ngày bắt đầu thuê</th>
                    <th>Hình thức thanh toán</th>
                    <th>Ghi chú</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="phong" items="${phongTroList}" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.count}"/></td>
                        <td><c:out value="PT-00${phong.maPhongTro}"/></td>
                        <td><c:out value="${phong.tenNguoiThue}"/></td>
                        <td><c:out value="${phong.soDienThoai}"/></td>
                        <td><c:out value="${phong.ngayBatDau}"/></td>
                        <td>
                            <c:if test="${phong.hinhThucThanhToan.id == 1}">
                                Theo tháng
                            </c:if>
                            <c:if test="${phong.hinhThucThanhToan.id == 2}">
                                Theo quý
                            </c:if><c:if test="${phong.hinhThucThanhToan.id == 3}">
                                Theo năm
                            </c:if>
                        </td>
                        <td><c:out value="${phong.ghiChu}"/></td>
                        <td><a class="btn btn-danger" role="button"
                               data-bs-toggle="modal" data-bs-target="#exampleModal"
                               onclick="setIdDeleteToForm('${phong.maPhongTro}','${phong.tenNguoiThue}')">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-4 mt-3">
            <a class="btn btn-secondary" href="/home" role="button">Back to home</a>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=delete" method="post">
                <div class="modal-body">
                    <%--                    <input type="hidden" name="action" value="delete" />--%>
                    <input type="hidden" name="deleteId" id="idDelete"/>
                    <span>Bạn có muốn xoá thông tin thuê trọ PT-00</span><span style="color: #ff0000" id="nameDelete"></span><span> hay không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    function setIdDeleteToForm(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = id;
    }
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        } );
    } );
</script>
</body>
</html>
