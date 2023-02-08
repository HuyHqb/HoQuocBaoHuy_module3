<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 27/08/2021
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <head>
        <title>Thêm</title>
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
            <header class="text-center">
                <h2>Thêm Tiệc Cưới</h2>
            </header>
            <div class="row w-75 mx-auto">
                <div class="col">
                    <form action="${pageContext.request.contextPath}/tieccuoi?action=add" method="post">
                        <span>${requestScope.message}</span><br>
                        <div class="form-group">
                            <label for="ngayToChuc">Ngày Tổ Chức:</label>
                            <input class="form-control" type="date" id="ngayToChuc" name="ngayToChuc" required>
                        </div>
                        <div class="form-group">
                            <label for="tenCoDau">Tên Cô Dâu:</label>
                            <input class="form-control" type="text" id="tenCoDau" name="tenCoDau" required>
                        </div>
                        <div class="form-group">
                            <label for="tenChuRe">Tên Chú Rể:</label>
                            <input class="form-control" type="text" id="tenChuRe" name="tenChuRe" required>
                        </div>
                        <div class="form-group">
                            <label for="soLuongBan">Số Lượng Bán:</label>
                            <input class="form-control" type="text" id="soLuongBan" name="soLuongBan" required>
                        </div>
                        <div class="form-group">
                            <label for="donGia">Đơn Giá:</label>
                            <input class="form-control" type="text" id="donGia" name="donGia" required>
                        </div>
                        <div class="form-group">
                            <label for="dichVuDiKem">Dịch Vụ Đi Kèm:</label>
                            <select class="custom-select" name="dichVuDiKem" id="dichVuDiKem">
                                <c:forEach var="dichVu" items="${requestScope.danhSachDichVu}">
                                    <option value="${dichVu.idDichVu}">${dichVu.tenDichVu}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tienNoDatCoc">Tiền Nợ Đặt Cọc</label>
                            <input class="form-control" type="text" id="tienNoDatCoc" name="tienNoDatCoc" required>
                        </div>
                        <div class="form-group">
                            <label for="tienNoThanhToan">Tiền Nợ Thanh Toán:</label>
                            <input class="form-control" type="text" id="tienNoThanhToan" name="tienNoThanhToan"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="ngayDatCoc">Ngày Đặt Cọc:</label>
                            <input class="form-control" type="date" id="ngayDatCoc" name="ngayDatCoc" required>
                        </div>
                        <div class="form-group">
                            <label for="ngayThanhToan">Ngày Thanh Toán:</label>
                            <input class="form-control" type="date" id="ngayThanhToan" name="ngayThanhToan" required>
                        </div>
                        <div class="form-group">
                            <label for="ghiChu">Ghi Chú:</label>
                            <input class="form-control" type="text" id="ghiChu" name="ghiChu" required>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái</label>
                            <input class="form-control" type="text" id="trangThai" name="trangThai" required>
                        </div>
                        <a href="${pageContext.request.contextPath}/tieccuoi">
                            <button type="button" class="btn btn-secondary">Back</button>
                        </a>
                        <button type="submit" class="btn btn-success">Add</button>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
