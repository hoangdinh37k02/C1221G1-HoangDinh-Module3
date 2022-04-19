<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/18/2022
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New User</title>
</head>
<body>
    <h1>Create New User</h1>
    <form method="post">
        <fieldset>
            <legend>Create New User</legend>
            <span>Input name: </span>
            <input type="text" name="name" placeholder="input name"> <br> <br>
            <span>Input email: </span>
            <input type="text" name="email" placeholder="input email"> <br> <br>
            <span>Input country: </span>
            <input type="text" name="country" placeholder="input country"> <br> <br>
            <input type="submit" value="Create">
        </fieldset>
    </form>
    <h2><a href="/user">Back to user list</a></h2>
</body>
</html>
