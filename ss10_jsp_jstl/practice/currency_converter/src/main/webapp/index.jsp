<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/13/2022
  Time: 9:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Currency Converter</title>
  </head>
  <body>
  <h1>Currency Converter</h1>
  <form action="converter.jsp" method="post">
  <label>Rate: </label> <br>
  <input type="text" name="rate" value="22000"> <br> <br>
  <label>USD: </label> <br>
  <input type="number" name="usd" value="0"> <br> <br>
  <input type="submit" value="Convert">
  </form>
  </body>
</html>
