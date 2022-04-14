<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/13/2022
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%--    <style>--%>
<%--        body{--%>
<%--            font-family: "Times New Roman";--%>
<%--        }--%>
<%--        h1{--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        table tbody, table thead, table tr{--%>
<%--            width: 700px;--%>
<%--        }--%>
<%--        table{--%>
<%--            border: 1px solid black;--%>
<%--            margin-left: auto;--%>
<%--            margin-right: auto;--%>
<%--            background-color: lightgoldenrodyellow;--%>
<%--        }--%>
<%--        td, th{--%>
<%--            padding-right: 50px;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<h1>Customer List</h1>
<table class="table">
    <thead>
    <tr class="row">
        <th class="col-1">STT</th>
        <th class="col-2">Tên</th>
        <th class="col-2">Ngày sinh</th>
        <th class="col-3">Địa chỉ</th>
        <th class="col-1">Hình ảnh</th>
    </tr>
    </thead>
    <c:forEach items="${customer}" var="cus" varStatus="STT">

    <tr class="row">
        <td class="col-1">${STT.count}</td>
        <td class="col-2">${cus.getName()}</td>
        <td class="col-2">${cus.getBirthDay()}</td>
        <td class="col-3">${cus.getAddress()}</td>
        <td class="col-1"><img src="${cus.getImg()}" style="width: 40px"></td>
    </tr>

    </c:forEach>
</table>
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
