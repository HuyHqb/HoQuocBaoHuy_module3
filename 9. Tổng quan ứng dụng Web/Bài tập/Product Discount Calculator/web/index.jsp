<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 08/08/2021
  Time: 08:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>
    <form action="DiscountServlet" method="post">
      <label for="description">Product Description</label>
      <input type="text" name="description" id="description"><br>

      <label for="price">List Price</label>
      <input type="text" name="price" id="price"><br>

      <label for="discount">Discount Percent</label>
      <input type="text" name="discount" id="discount"><br>

      <button type="submit">Calculate Discount</button>
    </form>
  </body>
</html>


