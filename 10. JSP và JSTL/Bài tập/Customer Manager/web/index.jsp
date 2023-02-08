<%@ page import="java.util.List" %>
<%@ page import="entity.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 09/08/2021
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" href="style.css">
    <title>$Title$</title>
  </head>
  <body>
    <%!
      List<Customer> list = new ArrayList<>();
    %>
    <%
      list.add(new Customer("Bảo","05/10/1999","Quảng Nam","image/01.jpg"));
      list.add(new Customer("Nam","21/10/1992","Đà Nẵng","image/02.jpg"));
      list.add(new Customer("Hoà","05/12/2001","Nam Định","image/03.jpg"));
      list.add(new Customer("Khoa","07/10/2000","Quảng Trị","image/04.webp"));
      list.add(new Customer("Thi","01/11/1999","Hà Nội","image/05.jpg"));

      request.setAttribute("listCus",list);
    %>


    <table>
      <caption>Danh sách khách hàng</caption>
      <thead>
      <tr>
        <td>Tên</td>
        <td>Ngày sinh</td>
        <td>Địa chỉ</td>
        <td>Ảnh</td>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="i" begin="0" end="4">
        <tr>
          <td>${listCus.get(i).name}</td>
          <td>${listCus.get(i).birthday}</td>
          <td>${listCus.get(i).address}</td>
          <td><img src="${listCus.get(i).image}" alt="image"></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </body>
</html>
