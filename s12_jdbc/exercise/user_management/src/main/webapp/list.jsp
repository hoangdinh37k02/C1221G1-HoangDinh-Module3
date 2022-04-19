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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
    <h1>List User</h1>

<table class="table">
        <tr class="row">
            <td class="col-1">No</td>
            <td class="col-1">ID</td>
            <td class="col-2">NAME</td>
            <td class="col-2">Email</td>
            <td class="col-2">Country</td>
            <td class="col-1">Edit</td>
            <td class="col-1">Delete</td>
        </tr>
    <c:forEach items="${userList}" var="userList" varStatus="No">
        <tr class="row">
            <td class="col-1">${No.count}</td>
            <td class="col-1">${userList.id}</td>
            <td class="col-2">${userList.name}</td>
            <td class="col-2">${userList.email}</td>
            <td class="col-2">${userList.country}</td>
            <td class="col-1">
                <a href="/user?action=edit&id=${userList.id}">edit</a>

            </td>
            <td class="col-1">
<%--                <a href="/user?action=delete&id=${userList.id}">delete</a>--%>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                onclick="deleteModal(${userList.id},'${userList.name}')">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

    <form action="/user?action=delete" method="post">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       ame="id" id="idUserDelete">
                        Do you want to delete this user: <br>
                        Id user: <span id="idUser"></span> <br>
                        User name: <span id="nameUser"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <h3>Search By Name</h3>
    <form action="/user?action=search" method="post">
        <input type="text" name="name">
        <input type="submit" value="Search">
    </form>
    <h3>Searching Result</h3>
    <table class="table">
        <tr class="row">
            <td class="col-1">No</td>
            <td class="col-1">ID</td>
            <td class="col-2">NAME</td>
            <td class="col-2">Email</td>
            <td class="col-2">Country</td>

        </tr>
        <c:forEach items="${list}" var="userList" varStatus="No">
            <tr class="row">
                <td class="col-1">${No.count}</td>
                <td class="col-1">${userList.id}</td>
                <td class="col-2">${userList.name}</td>
                <td class="col-2">${userList.email}</td>
                <td class="col-2">${userList.country}</td>

            </tr>
        </c:forEach>
    </table>
<p><a href="/user?action=create">Create New User</a></p>
    <p><a href="/user">Back to User List</a></p>

    <script>
        function deleteModal(id,name){
            document.getElementById("idUser").innerText=id;
            document.getElementById("idUserDelete").value=id;
            document.getElementById("nameUser").innerText=name;
        }
    </script>

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
