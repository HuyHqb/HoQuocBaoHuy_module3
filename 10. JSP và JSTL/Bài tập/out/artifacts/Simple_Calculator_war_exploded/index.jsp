<%--
  Created by IntelliJ IDEA.
  User: lomahs
  Date: 10/08/2021
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <h2>Simple Calculator</h2>
    <form action="CalculatorServlet" method="post">
      <fieldset >
        <legend>Calculator</legend>
        <label for="firstO">
          First operand:
          <input type="text" name="firstO" id="firstO">
        </label>
        <label for="operator">
          Operator:
          <select name="operator" id="operator">
            <option value="+">Addition</option>
            <option value="-">Subtraction</option>
            <option value="*">Multiple</option>
            <option value="/">Divide</option>
          </select>
        </label>
        <label for="secondO">
          <input type="text" name="secondO" id="secondO">
        </label>
        <button type="submit">Calculate</button>
      </fieldset>
    </form>

  </body>
</html>
