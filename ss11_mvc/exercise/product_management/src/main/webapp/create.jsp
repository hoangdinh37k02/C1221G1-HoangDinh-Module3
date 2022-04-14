<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/14/2022
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
</head>
<body>

    <h1>Create new product</h1>
    <c:if test='${message!=null}'><p style="color: red">${message}</p></c:if>
    <form method="post">
        <fieldset>
            <legend>Product information</legend>
            <table>
                <tr>
                    <td>SKU: </td>
                    <td><input type="text" name="sku"></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create product"></td>
                </tr>
            </table>
        </fieldset>
    </form>

<p><a href="/product">Back to product list</a></p>
</body>
</html>
