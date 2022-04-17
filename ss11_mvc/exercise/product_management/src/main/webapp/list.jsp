<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/14/2022
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
    <h1>List Products</h1>
<table class="table">
    <tr class="row">
        <th class="col-1">No</th>
        <th class="col-1">SKU</th>
        <th class="col-2">Name</th>
        <th class="col-1">Price</th>
        <th class="col-2">Delete product</th>
        <th class="col-2">Edit product</th>
    </tr>
    <c:forEach items="${products}" var="product" varStatus="No">
        <tr class="row">
            <td class="col-1">${No.count}</td>
            <td class="col-1"><a href="/product?action=view&sku=${product.getSku()}">${product.sku}</a></td>
            <td class="col-2">${product.name}</td>
            <td class="col-1">${product.price}</td>
            <td class="col-2"><a href="/product?action=delete&sku=${product.getSku()}">Delete</a></td>
            <td class="col-2"><a href="/product?action=edit&sku=${product.getSku()}">Edit</a></td>
        </tr>
    </c:forEach>
</table>
<p>
    <button><a href="/product?action=create">Create new product</a> </button><br>
<%--    <form action="/product" method="get">--%>
<%--        <input type="text" name="find_sku" placeholder="Input found SKU: ">--%>
<%--        <input type="submit" value="search">--%>
<%--    </form>--%>
    <botton><a href="/product?action=search">Search product</a></botton>
</p>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</body>
</html>
