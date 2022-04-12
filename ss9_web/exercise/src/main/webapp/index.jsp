<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/12/2022
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount</title>
  </head>
  <body>
    <h1>Product Discount Calculator</h1>
    <form action="/calculate" method="post">
      <lable>Product Name: </lable>
      <br>
      <input type="text" name="Product Name" placeholder="Enter product name: "> <br>
      <lable>List Price: </lable>
      <br>
      <input type="number" name="List Price" placeholder="Enter price"> <br>
      <lable>Discount Percent</lable>
      <br>
      <input type="number" name="Discount Percent"> <br>
      <br>
      <input type="submit" value="Calculate" style="height: 30px; width: 80px; margin-left: 40px">
    </form>
  </body>
</html>
