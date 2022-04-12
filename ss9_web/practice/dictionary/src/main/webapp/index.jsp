<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/12/2022
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Dictionary</title>
  </head>
  <body>
    <h1>Vietnamese Dictionary</h1>
    <form action="/translate" method="post">
      <input type="text" name="search" placeholder="Enter your word: ">
      <input type="submit" value="Search">
    </form>
  </body>
</html>
