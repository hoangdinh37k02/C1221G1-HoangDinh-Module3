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
    <style>
      #main{
        width: 30%;
        margin: auto;
        background-color: lightgoldenrodyellow;
        border: 1px solid ;
      }

      h1{
        text-align: center;
      }

      input{
        display: block;
        margin: auto;
      }

      lable{
        display: block;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
  <div id="main">
    <h1>Product Discount Calculator</h1>
    <a href="/calculate?ProductName=abc&ListPrice=10000&DiscountPercent=10"></a>
    <form action="/calculate" method="post">
      <lable>Product Name: </lable>
      <br>
      <input type="text" name="product_name" placeholder="Enter product name: "> <br>
      <lable>List Price: </lable>
      <br>
      <input type="number" name="list_price" placeholder="Enter price"> <br>
      <lable>Discount Percent</lable>
      <br>
      <input type="number" name="discount_percent"> <br>
      <br>
      <input type="submit" value="Calculate">
    </form>
  </div>
  </body>
</html>
