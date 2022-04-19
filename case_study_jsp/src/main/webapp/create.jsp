<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/19/2022
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create New Customer</title>
</head>
<body>
<center>
    <h1>Tạo khách hàng mới</h1>
    <h2>

        <a href="/">Về trang chủ</a> <br>
        <a href="resort?action=view">Danh sách khách hàng</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Tạo khách hàng</h2>
            </caption>
            <tr>
                <th>Mã loại khách:</th>
                <td>
                    <input type="text" name="maLoaiKhach" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Họ tên:</th>
                <td>
                    <input type="text" name="hoTen" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Ngày sinh:</th>
                <td>
                    <input type="date" name="ngaySinh" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Giới tính:</th>
                <td>
                    <input type="number" name="gioiTinh" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Số CMND:</th>
                <td>
                    <input type="text" name="soCMND" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>
                    <input type="text" name="soDienThoai" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>
                    <input type="text" name="diaChi" size="15"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
