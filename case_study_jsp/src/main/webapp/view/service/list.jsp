<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/21/2022
  Time: 8:13 AM
  To change this template use File | Settings | File Templates.
--%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html>
    <head>
        <title>Service List</title>
        <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
        <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
    </head>
    <body>
    <center>
        <h1>Service List</h1>
        <h2>
            <a href="/service?action=create"><button class="btn btn-success">Create New Service</button></a>
        </h2>
        <h2>
            <a href="/"><button class="btn btn-success">Về trang chủ</button></a>
        </h2>


    </center>
    <div align="center" class="container">
        <div class="row">
            <div class="col-lg-12">
                <table class="table table-striped table-bordered" style="width:100%">
                    <caption><h2>List of Customer</h2></caption>
                    <thead>
                    <tr>
                        <th>Mã dịch vụ</th>
                        <th>Tên dịch vụ</th>
                        <th>Diện tích</th>
                        <th>Chi phí thuê</th>
                        <th>Số người tối đa</th>
                        <th>Mã kiểu thuê</th>
                        <th>Mã loại dịch vụ</th>
                        <th>Tiêu chuẩn phòng</th>
                        <th>Tiện ích khác</th>
                        <th>Diện tích hồ bơi</th>
                        <th>Số tầng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="s" items="${serviceList}">
                        <tr>
                            <td><c:out value="${s.maDichVu}"/></td>

                            <td><c:out value="${s.tenDichVu}"/></td>
                            <td><c:out value="${s.dienTich}"/></td>
                            <td><c:out value="${s.chiPhiThue}"/></td>
                            <td><c:out value="${s.soNguoiToiDa}"/></td>
                            <c:if test="${s.maKieuThue==1}">
                                <td><c:out value="Year"/></td>
                            </c:if>
                            <c:if test="${s.maKieuThue==2}">
                                <td><c:out value="Month"/></td>
                            </c:if>
                            <c:if test="${s.maKieuThue==3}">
                                <td><c:out value="Day"/></td>
                            </c:if>
                            <c:if test="${s.maKieuThue==4}">
                                <td><c:out value="Hour"/></td>
                            </c:if>
<%--                            <td><c:out value="${s.maKieuThue}"/></td>--%>
                            <c:if test="${s.maLoaiDichVu==1}">
                                <td><c:out value="Villa"/></td>
                            </c:if>
                            <c:if test="${s.maLoaiDichVu==2}">
                                <td><c:out value="House"/></td>
                            </c:if>
                            <c:if test="${s.maLoaiDichVu==3}">
                                <td><c:out value="Room"/></td>
                            </c:if>
<%--                            <td><c:out value="${s.maLoaiDichVu}"/></td>--%>
                            <td><c:out value="${s.tieuChuanPhong}"/></td>
                            <td><c:out value="${s.tienNghiKhac}"/></td>
                            <td><c:out value="${s.dienTichHoBoi}"/></td>
                            <td><c:out value="${s.soTang}"/></td>

                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
    </body>
    </html>
