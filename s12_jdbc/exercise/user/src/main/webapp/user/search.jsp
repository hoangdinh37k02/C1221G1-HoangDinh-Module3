<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/18/2022
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search User</title>
</head>
<body>
<h1>Search User</h1>
<form method="post">
    <fieldset>
        <legend>Input user country</legend>

        <input type="text" name="country" placeholder="Input search country: ">
        <input type="submit" value="search">

        </table>
    </fieldset>
</form>
<h1>Result of Searching</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach items="${userList}" var="userList" varStatus="No">
        <tr>
            <td>${No.count}</td>
            <td>${userList.id}</td>
            <td>${userList.name}</td>
            <td>${userList.country}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
