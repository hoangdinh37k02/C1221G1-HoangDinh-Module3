<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/21/2022
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tạo mới nhân viên</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>
<center>
    <h1>Tạo khách nhân viên</h1>
    <h2>
        <a href="/"> <button class="btn btn-success">Về trang chủ</button></a>

    </h2>
    <h2>
        <a href="employee?action=list"><button class="btn btn-success">Về danh sách</button></a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table class="table table-striped table-bordered">
            <caption>
                <h2>Tạo Nhân Viên</h2>
            </caption>
<%--            <tr>--%>
<%--                <th>Loại khách:</th>--%>
<%--                <td>--%>
<%--                    <select name="maLoaiKhach">--%>
<%--                        <c:forEach items="${customerTypeList}" var="c">--%>
<%--                            <option value="${c.maLoaiKhach}">${c.tenLoaiKhach}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
<%--                </td>--%>
<%--            </tr>--%>
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
                <th>Số CMND:</th>
                <td>
                    <input type="text" name="soCMND" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Lương:</th>
                <td>
                    <input type="text" name="luong" size="45"/>
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
                    <input type="text" name="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>
                    <input type="text" name="diaChi" size="45"/>
                </td>
            </tr>

            <tr>
                <th>Trình độ:</th>
                <td>
                    <select name="maTrinhDo">
                        <c:forEach items="${levelList}" var="levelList">
                            <option value="${levelList.maTrinhDo}">${levelList.tenTrinhDo}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Bộ phận:</th>
                <td>
                    <select name="maBoPhan">
                        <c:forEach items="${departmentList}" var="departmentList">
                            <option value="${departmentList.maBoPhan}">${departmentList.tenBoPhan}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Vị trí:</th>
                <td>
                    <select name="maViTri">
                        <c:forEach items="${positionList}" var="positionList">
                            <option value="${positionList.maViTri}">${positionList.tenViTri}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</body>

</html>
