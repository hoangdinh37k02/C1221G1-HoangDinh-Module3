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
</head>
<body>
    <h1>List Products</h1>
<table border="1px">
    <tr>
        <th>No</th>
        <th>SKU</th>
        <th>Name</th>
        <th>Price</th>
        <th>Delete product</th>
        <th>Edit product</th>
    </tr>
    <c:forEach items='${products}' var="product" varStatus="No">
        <tr>
            <td>${No.count}</td>
            <td><a href="/product?action=view&sku=${product.getSku()}">${product.sku}</a></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td><a href="/product?action=delete&sku=${product.getSku()}">Delete</a></td>
            <td><a href="/product?action=edit&sku=${product.getSku()}">Edit</a></td>
        </tr>
    </c:forEach>
</table>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
</body>
</html>
