<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/14/2022
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/customers?action=create">Create new customer</a>
</p>
<table>
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${customers}' var="customer">
        <tr>
            <td>${customer.getId()}</td>
            <td><a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td><a href="/customers?action=edit&id=${customer.getId()}">edit</a></td>
            <td><a href="/customers?action=delete&id=${customer.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
