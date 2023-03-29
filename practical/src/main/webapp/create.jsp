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
  <style>
    body {
      background-image: url("https://img.freepik.com/free-vector/elegant-white-background-with-shiny-lines_1017-17580.jpg?w=2000");
      background-size: 100%;
      background-color: #cccccc;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/home">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/phongTro">PhongTro</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>

    </div>
  </div>
</nav>
<div class="container bg-white mt-5">
  <div class="row mt-3">
    <div class="col-12">
      <a class="btn btn-secondary" href="/phongTro" role="button">Quay lại danh sách phòng trọ</a>
    </div>
  </div>
  <div class="row mt-3" style="padding-left: 20px">
    <div class="col-6">
      <div class="row">
        <p style="color: red">
          <c:if test="${message != null}">
            <span style="color: greenyellow">${message}</span>
          </c:if>
        </p>
      </div>
      <div class="row bg-white">
        <form action="/phongTro?action=create" method="post">
          <table>
            <tr>
              <th colspan="2" style="text-align: center; color: red">CREATE FORM</th>
            </tr>

            <tr>
              <td><label for="fn">Mã phòng trọ: </label></td>
              <td><input type="text" id="fn" name="maPhongTro" disabled></td>
            </tr>

            <tr>
              <td><label for="datepicker">Tên người thuê trọ: </label></td>
              <td><input id="datepicker" name="tenNguoiThue"></td>
            </tr>


            <tr>
              <td><label for="iddc">Số điện thoại: </label></td>
              <td><input type="text" id="iddc" name="soDienThoai">
            </tr>

            <tr>
              <td><label for="pn">Ngày bắt đầu thuê: </label></td>
              <td><input type="date" id="pn" name="ngayBatDau"></td>
            </tr>

            <tr>
              <td><span>Hình thức thanh toán</span></td>
              <td>
                <select name="maHinhThucThanhToan">
                  <c:forEach var="index" items="${hinhThucThanhToanList}">
                    <option value="${index.id}">${index.kieuThue}</option>
                  </c:forEach>
                </select>
              </td>
            </tr>
            <tr>
              <td><label for="idddc">Ghi chú: </label></td>
              <td><input type="text" id="idddc" name="ghiChu">
            </tr>
            <tr>
              <td><a class="btn btn-secondary" href="/phongTro" role="button">Hủy</a></td>
              <td style="text-align: left"><input type="submit" value="Tạo mới"></td>

            </tr>

          </table>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
