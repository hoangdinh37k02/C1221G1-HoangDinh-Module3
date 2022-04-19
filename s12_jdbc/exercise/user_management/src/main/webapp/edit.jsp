<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/18/2022
  Time: 7:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form method="post">
        <fieldset>
            <legend>Edit User</legend>
            <input type="hidden" name="id" value="<c:out value=" ${user.id}"/>">
            <span>Name: </span>
            <input type="text" name="name" value="<c:out value=" ${user.name}"/>"> <br>        
            <span>Email: </span>
            <input type="text" name="email" value="<c:out value=" ${user.email}"/>"> <br>        
            <span>Country: </span>
            <input type="text" name="country" value="<c:out value=" ${user.country}"/>"> <br>
            <input type="submit" value="Update">
        </fieldset>
    </form>
    <p><a href="/user">Back to User List</a></p>
</body>
</html>
