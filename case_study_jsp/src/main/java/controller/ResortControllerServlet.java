package controller;

import model.Customer;
import service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ResortServletController", value = "/resort")
public class ResortControllerServlet extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request,response);
                break;
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
            switch (action) {
                case "create":
                    request.getRequestDispatcher("create.jsp").forward(request,response);
                    break;

                default:
//                    listUser(request, response);
//                    break;
            }

    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int maLoaiKhach = Integer.parseInt(request.getParameter("maLoaiKhach"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String gioiTinh = request.getParameter("gioiTinh");
        String soCMND=request.getParameter("soCMND");
        String soDienThoai=request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Customer customer = new Customer(maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCMND,soDienThoai,email,diaChi);
        customerService.insertCustomer(customer);
        request.getRequestDispatcher("create.jsp").forward(request,response);
    }


}
