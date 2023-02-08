<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 27/08/2021
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<html>
    <head>
        <title>Danh Sach</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/static/http_maxcdn.bootstrapcdn.com_bootstrap_4.5.2_css_bootstrap.css">

        <script src="${pageContext.request.contextPath}/static/http_ajax.googleapis.com_ajax_libs_jquery_3.5.1_jquery.js"></script>
        <script src="${pageContext.request.contextPath}/static/http_cdnjs.cloudflare.com_ajax_libs_popper.js_1.16.0_umd_popper.js"></script>
        <script src="${pageContext.request.contextPath}/static/http_maxcdn.bootstrapcdn.com_bootstrap_4.5.2_js_bootstrap.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <p></p>
            <p></p>
            <p></p>
            <header class="text-center mt-10">
                <h2>Danh Sách Tiệc Cưới</h2>
            </header>
            <div class="row">
                <div class="col mx-auto">
                    <div class="card rounded border-0">
                        <div class="card-body p-4 bg-white rounded">
                            <div class="table-responsive w-90">
                                <table class="table table-bordered bg-light table-striped">

                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ngày tổ chức</th>
                                        <th>Cô Dâu</th>
                                        <th>Chú Rể</th>
                                        <th>Số Lượng Bàn</th>
                                        <th>Đơn Giá</th>
                                        <th>Dịch Vụ Đi Kèm</th>
                                        <th>Tiền Nợ Đặt Cọc</th>
                                        <th>Tiền Nợ Thanh Toán</th>
                                        <th>Ngày Đặt Cọc</th>
                                        <th>Ngày Thanh Toán</th>
                                        <th>Ghi Chú</th>
                                        <th>Trạng Thái</th>
                                        <th colspan="2">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="i" value="0"/>
                                    <c:forEach var="tiecCuoi" items="${requestScope.danhSachTiec}">
                                        <tr>
                                            <td>${i = i + 1}</td>
                                            <td><fmt:formatDate value="${tiecCuoi.ngayToChuc}"
                                                                pattern="dd/MM/yyyy"/></td>
                                            <td>${tiecCuoi.tenCoDau}</td>
                                            <td>${tiecCuoi.tenChuRe}</td>
                                            <td>${tiecCuoi.soLuongBan}</td>
                                            <td>${tiecCuoi.donGia}</td>
                                            <td>${tiecCuoi.dichVuDiKem.tenDichVu}</td>
                                            <td>${tiecCuoi.tienNoDatCoc}</td>
                                            <td>${tiecCuoi.tienNoThanhToan}</td>
                                            <td><fmt:formatDate value="${tiecCuoi.ngayDatCoc}"
                                                                pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${tiecCuoi.ngayThanhToan}"
                                                                pattern="dd/MM/yyyy"/></td>
                                            <td>${tiecCuoi.ghiChu}</td>
                                            <td>${tiecCuoi.trangThai}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/tieccuoi?action=edit&id=${tiecCuoi.id}">
                                                    <button type="button" class="btn btn-primary">Edit</button>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/tieccuoi?action=remove&id=${tiecCuoi.id}">
                                                    <button type="button" class="btn btn-secondary">Delete</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <a href="${pageContext.request.contextPath}/tieccuoi?action=add">
                                <button type="button" class="btn btn-success">Thêm tiệc cưới</button>
                            </a>
                        </div>
                    </div>


                </div>
            </div>
        </div>


    </body>
</html>
