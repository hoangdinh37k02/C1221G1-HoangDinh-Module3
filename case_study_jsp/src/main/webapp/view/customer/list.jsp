<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/20/2022
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>
<center>
    <h1>Customer List</h1>
    <h2>
        <a href="/resort?action=create"><button class="btn btn-success">Create New Customer</button></a>
    </h2>
    <h2>
        <a href="/"><button class="btn btn-success">Về trang chủ</button></a>
    </h2>
    <form method="post" action="/resort?action=search">
        <input type="text" name="name" placeholder="Input Customer Name: ">
        <input type="text" name="email" placeholder="Input Customer Email: ">
        <select name="maLoaiKhach" >
            <option value="">Chọn loại khách</option>
            <c:forEach items="${customerTypeList}" var="c">
                <option value="${c.maLoaiKhach}">${c.tenLoaiKhach}</option>
            </c:forEach>
        </select>
        <button class="btn btn-primary" type="submit">Search</button>
    </form>

</center>
<div align="center" class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableCustomer" class="table table-striped table-bordered" style="width:100%">
                <caption><h2>List of Customer</h2></caption>
                <thead>
                    <tr>
                        <th>Mã khách hàng</th>
                        <th>Loại khách</th>
                        <th>Họ Tên</th>
                        <th>Ngày sinh</th>
                        <th>Giới tính</th>
                        <th>Số CMND</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Địa chỉ</th>
                        <th>Chỉnh sửa</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td><c:out value="${customer.maKhachHang}"/></td>

                        <c:forEach var="customerType" items="${customerTypeList}">
                            <c:if test="${customer.maLoaiKhach==customerType.maLoaiKhach}">
                                <td><c:out value="${customerType.tenLoaiKhach}"></c:out></td>
                            </c:if>
                        </c:forEach>
                        <td><c:out value="${customer.hoTen}"/></td>
                        <td><c:out value="${customer.ngaySinh}"/></td>
                        <c:if test="${customer.gioiTinh==1}">
                            <td><c:out value="Nam"/></td>
                        </c:if>
                        <c:if test="${customer.gioiTinh==0}">
                            <td><c:out value="Nữ"/></td>
                        </c:if>
                        <td><c:out value="${customer.soCMND}"/></td>
                        <td><c:out value="${customer.soDienThoai}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.diaChi}"/></td>

                        <td>
                            <a href="/resort?action=edit&maKhachHang=${customer.maKhachHang}">
                                <button class="btn btn-primary">Chỉnh sửa</button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"
                                    onclick="deleteModal(${customer.maKhachHang},'${customer.hoTen}')">
                                Xóa
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>

</div>
<form action="/resort?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Khách hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="maKhachHangCanXoa" name="maKhachHang">
                    Bạn có chắc muốn xóa khách hàng sau: <br>
                    Mã khách hàng: <p id="maKhachHang"></p>
                    Tên khách hàng: <p id="hoTen"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </div>
        </div>
    </div>
</form>


<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>

<script>
    function deleteModal(maKhachHang,hoTen){
            document.getElementById("maKhachHang").innerText=maKhachHang;
            document.getElementById("maKhachHangCanXoa").value=maKhachHang;
            document.getElementById("hoTen").innerText=hoTen;
    }
</script>

</body>
</html>
