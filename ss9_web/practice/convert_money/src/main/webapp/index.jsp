<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/12/2022
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Converting</title>
  </head>
  <body>
  <h1> Currency Converter </h1>
  <form action="/convert" method="get">
    <lable>Rate: </lable>
    <br>
    <input type="text" value="22000" name="rate"> <br>
    <lable>USD</lable>
    <br>
    <input type="text" value="0" name="usd"> <br>
    <input type="submit" value="Converter">
  </form>
  </body>
</html>
