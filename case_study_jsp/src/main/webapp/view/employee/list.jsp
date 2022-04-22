<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/21/2022
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>
<center>
    <h1>Employee List</h1>
    <h2>
        <a href="/employee?action=create"><button class="btn btn-success">Create New Employee</button></a>
    </h2>
    <h2>
        <a href="/"><button class="btn btn-success">Về trang chủ</button></a>
    </h2>
    <form method="post" action="/employee?action=search">
        <input type="text" name="name" placeholder="Input Employee Name: ">
        <button class="btn btn-primary" type="submit">Search</button>
    </form>


</center>
<div align="center" class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableCustomer" class="table table-striped m-4 table-bordered" style="width:100%">
                <caption><h2>List of employee</h2></caption>
                <thead>
                <tr>
                    <th>Mã Nhân Viên</th>
                    <th>Họ Tên</th>
                    <th>Ngày sinh</th>
                    <th>Số CMND</th>
                    <th>Lương</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th>Trình Độ</th>
                    <th>Bộ Phận</th>
                    <th>Vị Trí</th>
                    <th>Chỉnh sửa</th>
                    <th>Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="e" items="${employeeList}">
                    <tr>
                        <td><c:out value="${e.maNhanVien}"/></td>
                        <td><c:out value="${e.hoTen}"/></td>
                        <td><c:out value="${e.ngaySinh}"/></td>
                        <td><c:out value="${e.soCMND}"/></td>
                        <td><c:out value="${e.luong}"/></td>
                        <td><c:out value="${e.soDT}"/></td>
                        <td><c:out value="${e.email}"/></td>
                        <td><c:out value="${e.diaChi}"/></td>

                        <c:forEach var="levelList" items="${levelList}">
                            <c:if test="${levelList.maTrinhDo==e.maTrinhDo}">
                                <td><c:out value="${levelList.tenTrinhDo}"></c:out></td>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="departmentList" items="${departmentList}">
                            <c:if test="${departmentList.maBoPhan==e.maBoPhan}">
                                <td><c:out value="${departmentList.tenBoPhan}"></c:out></td>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="positionList" items="${positionList}">
                            <c:if test="${positionList.maViTri==e.maViTri}">
                                <td><c:out value="${positionList.tenViTri}"></c:out></td>
                            </c:if>
                        </c:forEach>


                        <td>
                            <a href="/employee?action=edit&maNhanVien=${e.maNhanVien}">
                                <button class="btn btn-primary">Chỉnh sửa</button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"
                                    onclick="deleteModal(${e.maNhanVien},'${e.hoTen}')">
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
<form action="/employee?action=delete" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Nhân Viên</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="maNhanVienCanXoa" name="maNhanVien">
                    Bạn có chắc muốn xóa nhân viên sau: <br>
                    Mã nhân viên: <p id="maNhanVien"></p>
                    Tên nhân viên: <p id="hoTen"></p>
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
    function deleteModal(maNhanVien,hoTen){
        document.getElementById("maNhanVien").innerText=maNhanVien;
        document.getElementById("maNhanVienCanXoa").value=maNhanVien;
        document.getElementById("hoTen").innerText=hoTen;
    }
</script>

</body>
</html>
