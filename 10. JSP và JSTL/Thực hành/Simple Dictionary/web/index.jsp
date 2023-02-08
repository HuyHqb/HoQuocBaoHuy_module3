<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 09/08/2021
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
      <h2>Vietnamese Dictionary</h2>
    <form action="dictionary.jsp" method="post">
      <input type="text" name="word" placeholder="Enter your word:">
      <button type="submit">Search</button>
    </form>

  </body>
</html>
