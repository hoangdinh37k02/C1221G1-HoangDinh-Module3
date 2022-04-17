<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/17/2022
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>
</head>
<body>
    <h1>List User</h1>

<table>
        <tr>
            <td>No</td>
            <td>ID</td>
            <td>NAME</td>
            <td>Email</td>
            <td>Country</td>
        </tr>
    <c:forEach items="${userList}" var="userList" varStatus="No">
        <tr>
            <td>${No.count}</td>
            <td>${userList.id}</td>
            <td>${userList.name}</td>
            <td>${userList.email}</td>
            <td>${userList.country}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
