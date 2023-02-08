<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 09/08/2021
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Converter</title>
    </head>
    <body>
        <%
            float rate = Float.parseFloat(request.getParameter("rate"));
            float usd =Float.parseFloat(request.getParameter("usd"));

            float vnd = rate * usd;
        %>
        Rate: <%=rate%>
        USD: <%=usd%>
        VND: <%=vnd%>
    </body>
</html>
